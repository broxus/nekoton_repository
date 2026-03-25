import 'dart:async';
import 'dart:convert';

import 'package:logging/logging.dart';
import 'package:mutex/mutex.dart';
import 'package:nekoton_repository/nekoton_repository.dart';
import 'package:nekoton_repository/src/repositories/refresh_polling/sse/sse_refresh_polling_connection.dart';
import 'package:nekoton_repository/src/repositories/refresh_polling/sse/sse_refresh_polling_targets.dart';
import 'package:rxdart/rxdart.dart';

/// SSE-based polling manager that subscribes to server events.
///
/// This implementation must:
/// - Open an SSE stream and track the current UUID from server events.
/// - Use [SseRpcClient] to subscribe/unsubscribe addresses.
/// - Dispatch updates to registered targets.
/// - Apply exponential backoff for reconnect attempts.
/// - Fall back to [fallbackManager] after exceeding max attempts.
class SseRefreshPollingManager implements RefreshPollingManager {
  /// Creates a new SSE-based polling manager.
  SseRefreshPollingManager({
    required this.rpcClient,
    required this.streamClient,
    required this.reconnectPolicy,
    required this.fallbackManager,
    Logger? logger,
  }) : _connection = SseRefreshPollingConnection(
         reconnectPolicy: reconnectPolicy,
       ),
       _logger = logger ?? Logger('SseRefreshPollingManager');

  /// SSE configuration including base URL and reconnect policy.
  final SseReconnectPolicy reconnectPolicy;

  /// JSON-RPC client for subscription management.
  final SseRpcClient rpcClient;

  /// Client that connects to SSE stream and yields events.
  final SseStreamClient streamClient;

  /// Fallback manager used when SSE is unavailable.
  final RefreshPollingManager fallbackManager;

  final SseRefreshPollingConnection _connection;
  final Logger _logger;

  final _targets = SseRefreshPollingTargets();
  final _pausedSubject = BehaviorSubject<bool>.seeded(false);
  final _mutex = Mutex();

  bool _isDisposed = false;

  @override
  RefreshPollingBackend get backend => RefreshPollingBackend.sse;

  @override
  bool get isPaused => _pausedSubject.value;

  @override
  Stream<bool> get isPausedStream => _pausedSubject.stream;

  bool get _canConnect =>
      !_isDisposed &&
      !isPaused &&
      !_connection.isFallbackEnabled &&
      !_connection.isConnected &&
      !_connection.isConnecting;

  @override
  void registerTarget(RefreshPollingTarget target) {
    if (_isDisposed) return;

    _targets.registerTarget(target);
    fallbackManager.registerTarget(target);
  }

  @override
  void unregisterTarget(Address address) {
    if (_isDisposed) return;

    if (_targets.isSubscribed(address)) {
      _unsubscribeAddresses([address]).ignore();
    }

    _targets.unregisterTarget(address);
    fallbackManager.unregisterTarget(address);
  }

  @override
  bool hasTarget(Address address) => _targets.hasTarget(address);

  @override
  void startPolling(Address address) {
    if (_isDisposed) return;
    if (!_targets.hasTarget(address)) {
      _logger.warning(
        'Attempted to start polling for unregistered address: $address',
      );
      return;
    }

    _targets.activate(address);

    if (isPaused) return;

    if (_connection.isFallbackEnabled) {
      return fallbackManager.startPolling(address);
    }

    _ensureConnected().then((_) => _subscribeAddresses([address])).ignore();
  }

  @override
  void stopPolling(Address address) {
    if (_isDisposed) return;

    _targets.deactivate(address);
    fallbackManager.stopPolling(address);

    _unsubscribeAddresses([address]).ignore();
  }

  @override
  void stopPollingAll() {
    if (_isDisposed) return;

    _unsubscribeAll().ignore();
    _targets
      ..clearActiveAddresses()
      ..clearSubscriptions();

    fallbackManager.stopPollingAll();
  }

  @override
  Future<void> pausePolling() async {
    if (_isDisposed || isPaused) return;

    _pausedSubject.add(true);

    await _closeStream();
    await fallbackManager.pausePolling();
  }

  @override
  Future<void> resumePolling() async {
    if (_isDisposed || !isPaused) return;

    _pausedSubject.add(false);

    if (!_connection.isFallbackEnabled) {
      _targets.refreshActiveTargets();
    }

    await _ensureConnected();
    await fallbackManager.resumePolling();
  }

  @override
  void setPollingMode(Address address, RefreshPollingMode mode) {
    if (_isDisposed) return;

    if (_connection.isFallbackEnabled) {
      fallbackManager.setPollingMode(address, mode);
    }
  }

  @override
  Future<void> dispose() async {
    if (_isDisposed) return;

    _isDisposed = true;
    _connection.cancelReconnect();
    _targets.clear();

    await _closeStream();
    _connection.reset();
    await _pausedSubject.close();
    await fallbackManager.dispose();
  }

  /// All active addresses from [_targets] will be subscribed
  /// when SSE returns a new UUID
  Future<void> _ensureConnected() async {
    if (!_canConnect) return;

    await _mutex.acquire();
    try {
      if (!_canConnect) return;

      final generation = _connection.beginConnectionAttempt();

      _logger.fine('Opening SSE stream for polling');

      final stream = await streamClient.connect();

      if (!_connection.isCurrentGeneration(
            generation,
            isDisposed: _isDisposed,
          ) ||
          isPaused) {
        _connection.abortConnectionAttempt();
        await streamClient.close();
        return;
      }

      final subscription = stream.listen(
        (event) => _handleEvent(event, generation),
        onError: (Object error, StackTrace stackTrace) {
          if (!_connection.isCurrentGeneration(
            generation,
            isDisposed: _isDisposed,
          )) {
            return;
          }

          _logger.warning('SSE stream error', error, stackTrace);
          _handleStreamFailure(generation).ignore();
        },
        onDone: () {
          if (!_connection.isCurrentGeneration(
            generation,
            isDisposed: _isDisposed,
          )) {
            return;
          }

          _handleStreamFailure(generation).ignore();
        },
      );
      _connection.attachSubscription(subscription);
    } catch (e, s) {
      _connection.abortConnectionAttempt();
      _logger.warning('Failed to connect to SSE stream', e, s);
      _handleStreamFailure().ignore();
    } finally {
      _mutex.release();
    }
  }

  void _handleEvent(SseStreamEvent event, int generation) {
    if (!_connection.isCurrentGeneration(generation, isDisposed: _isDisposed)) {
      return;
    }

    if (event.event == 'uuid') {
      _connection.updateUuid(event.data);
      _targets.clearSubscriptions();
      _subscribeAddresses(_targets.activeAddresses.toList()).ignore();
      return;
    }

    if (event.event == 'update') {
      _handleUpdate(event.data);
    }
  }

  void _handleUpdate(String payload) {
    if (_isDisposed || isPaused || _connection.isFallbackEnabled) return;

    final update = _parseUpdate(payload);
    if (update == null) return;

    _targets.refreshTarget(update.address);
  }

  SseStreamUpdate? _parseUpdate(String payload) {
    try {
      final decoded = jsonDecode(payload);
      if (decoded is! Map<String, dynamic>) {
        _logger.warning('SSE update payload is not a JSON object');
        return null;
      }

      return SseStreamUpdate.fromJson(decoded);
    } catch (e, s) {
      _logger.warning('Failed to parse SSE update', e, s);
      return null;
    }
  }

  Future<void> _handleStreamFailure([int? generation]) async {
    if (_isDisposed || isPaused) return;

    await _closeStream(generation: generation);

    if (_connection.isFallbackEnabled || _isDisposed || isPaused) return;

    if (_connection.shouldEnableFallback) {
      _enableFallback();
      return;
    }

    final delay = _connection.prepareReconnectDelay();

    _logger.fine('Scheduling SSE reconnect in $delay');
    _connection.scheduleReconnect(delay, _ensureConnected);
  }

  void _enableFallback() {
    if (_connection.isFallbackEnabled || _isDisposed) return;

    _connection.enableFallback();
    _logger.warning('Falling back to interval polling manager');

    for (final address in _targets.activeAddresses) {
      fallbackManager.startPolling(address);
    }
  }

  Future<void> _subscribeAddresses(List<Address> addresses) async {
    if (_isDisposed) return;

    final uuid = _connection.uuid;
    if (uuid == null || addresses.isEmpty) return;

    final toSubscribe = _targets.addressesToSubscribe(addresses);
    if (toSubscribe.isEmpty) return;

    await _mutex.acquire();
    try {
      final toSubscribe = _targets.addressesToSubscribe(addresses);
      if (toSubscribe.isEmpty) return;

      await rpcClient.subscribe(uuid: uuid, addresses: toSubscribe);
      _targets.markSubscribed(toSubscribe);
    } on SseRpcError catch (e) {
      _logger.warning('Failed to subscribe addresses', e);

      if (e.code == -32602) {
        // Invalid subscription (e.g. unknown UUID) - trigger reconnect
        _handleStreamFailure().ignore();
        return;
      }

      // Other subscription errors are logged and swallowed to avoid
      // surfacing as unhandled zone errors when called from stream handlers.
    } catch (e, s) {
      _logger.warning('Failed to subscribe addresses', e, s);
      // Swallow unexpected errors after logging to avoid unhandled zone errors.
    } finally {
      _mutex.release();
    }
  }

  Future<void> _unsubscribeAddresses(List<Address> addresses) async {
    if (_isDisposed) return;

    final uuid = _connection.uuid;
    if (uuid == null || addresses.isEmpty) return;

    final toUnsubscribe = _targets.addressesToUnsubscribe(addresses);
    if (toUnsubscribe.isEmpty) return;

    await _mutex.acquire();
    try {
      final toUnsubscribe = _targets.addressesToUnsubscribe(addresses);
      if (toUnsubscribe.isEmpty) return;

      _targets.markUnsubscribed(toUnsubscribe);
      await rpcClient.unsubscribe(uuid: uuid, addresses: toUnsubscribe);
    } catch (e, s) {
      _logger.warning('Failed to unsubscribe addresses', e, s);
    } finally {
      _mutex.release();
    }
  }

  Future<void> _unsubscribeAll() async {
    if (_isDisposed) return;

    final uuid = _connection.uuid;
    if (uuid == null) return;

    await _mutex.acquire();
    try {
      await rpcClient.unsubscribeAll(uuid: uuid);
    } catch (e, s) {
      _logger.warning('Failed to unsubscribe all addresses', e, s);
    } finally {
      _mutex.release();
    }
  }

  Future<void> _closeStream({int? generation}) async {
    await _mutex.acquire();
    try {
      if (generation != null &&
          !_connection.isCurrentGeneration(
            generation,
            isDisposed: _isDisposed,
          )) {
        return;
      }

      _logger.fine('Closing SSE stream');

      final subscription = _connection.detachSubscription();
      _connection.clearConnection();
      _targets.clearSubscriptions();

      await subscription?.cancel();
      await streamClient.close();
    } catch (e, s) {
      _logger.severe('Failed to close SSE stream', e, s);
    } finally {
      _mutex.release();
    }
  }
}
