import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:logging/logging.dart';
import 'package:nekoton_repository/nekoton_repository.dart';
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
  }) : _logger = logger ?? Logger('SseRefreshPollingManager');

  /// SSE configuration including base URL and reconnect policy.
  final SseReconnectPolicy reconnectPolicy;

  /// JSON-RPC client for subscription management.
  final SseRpcClient rpcClient;

  /// Client that connects to SSE stream and yields events.
  final SseStreamClient streamClient;

  /// Fallback manager used when SSE is unavailable.
  final RefreshPollingManager fallbackManager;

  final Logger _logger;

  final _targets = <Address, RefreshPollingTarget>{};
  final _activeAddresses = <Address>{};
  final _subscribedAddresses = <Address>{};
  final _refreshInFlight = <Address>{};
  final _pausedSubject = BehaviorSubject<bool>.seeded(false);

  StreamSubscription<SseStreamEvent>? _subscription;
  Timer? _reconnectTimer;
  String? _uuid;
  int _reconnectAttempt = 0;
  bool _fallbackEnabled = false;

  @override
  RefreshPollingBackend get backend => RefreshPollingBackend.sse;

  @override
  bool get isPaused => _pausedSubject.value;

  @override
  Stream<bool> get isPausedStream => _pausedSubject.stream;

  @override
  void registerTarget(RefreshPollingTarget target) {
    if (_targets.containsKey(target.address)) {
      unregisterTarget(target.address);
    }

    _targets[target.address] = target;
    fallbackManager.registerTarget(target);

    if (_uuid != null && _activeAddresses.contains(target.address)) {
      _subscribeAddresses([target.address]);
    }
  }

  @override
  void unregisterTarget(Address address) {
    _activeAddresses.remove(address);
    _targets.remove(address);
    _refreshInFlight.remove(address);

    if (_uuid != null) {
      _unsubscribeAddresses([address]);
    }

    fallbackManager.unregisterTarget(address);
  }

  @override
  bool hasTarget(Address address) {
    return _targets.containsKey(address);
  }

  @override
  void startPolling(Address address) {
    _activeAddresses.add(address);

    if (_fallbackEnabled) {
      return fallbackManager.startPolling(address);
    }

    _ensureConnected();

    if (_uuid != null) {
      _subscribeAddresses([address]);
    }
  }

  @override
  void stopPolling(Address address) {
    _activeAddresses.remove(address);
    _refreshInFlight.remove(address);

    if (_uuid != null) {
      _unsubscribeAddresses([address]);
    }

    fallbackManager.stopPolling(address);
  }

  @override
  void stopPollingAll() {
    if (_uuid != null) {
      _unsubscribeAll();
    }
    _activeAddresses.clear();
    _subscribedAddresses.clear();
    fallbackManager.stopPollingAll();
  }

  @override
  void pausePolling() {
    _pausedSubject.add(true);
    fallbackManager.pausePolling();
  }

  @override
  void resumePolling() {
    _pausedSubject.add(false);
    fallbackManager.resumePolling();

    if (!_fallbackEnabled) {
      // refresh all _activeAddresses immediately after resume,
      // since we might have missed updates while paused
      _activeAddresses.forEach(_refreshTarget);
    }
  }

  @override
  void setPollingMode(Address address, RefreshPollingMode mode) {
    if (_fallbackEnabled) {
      fallbackManager.setPollingMode(address, mode);
    }
  }

  @override
  void clear() {
    stopPollingAll();
    _targets.clear();
    _activeAddresses.clear();
    _subscribedAddresses.clear();
    _refreshInFlight.clear();
  }

  @override
  void dispose() {
    clear();
    _closeStream();
    _pausedSubject.close();
    fallbackManager.dispose();
  }

  void _ensureConnected() {
    if (_fallbackEnabled) return;
    if (_subscription != null) return;

    _logger.fine('Opening SSE stream for polling');

    _subscription = streamClient.connect().listen(
      _handleEvent,
      onError: (Object error, StackTrace stackTrace) {
        _logger.warning('SSE stream error', error, stackTrace);
        _handleStreamFailure();
      },
      onDone: _handleStreamFailure,
    );
  }

  void _handleEvent(SseStreamEvent event) {
    if (event.event == 'uuid') {
      _uuid = event.data;
      _reconnectAttempt = 0;
      _subscribedAddresses.clear();
      _subscribeAddresses(_activeAddresses.toList());
      return;
    }

    if (event.event == 'update') {
      _handleUpdate(event.data);
    }
  }

  void _handleUpdate(String payload) {
    if (isPaused || _fallbackEnabled) return;

    final update = _parseUpdate(payload);
    if (update == null) return;

    _refreshTarget(update.address);
  }

  void _refreshTarget(Address address) {
    final target = _targets[address];
    if (target == null) return;

    if (_refreshInFlight.contains(address)) return;

    _refreshInFlight.add(address);
    target.refresher.refresh().whenComplete(
      () => _refreshInFlight.remove(address),
    );
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

  void _handleStreamFailure() {
    _closeStream();

    if (_fallbackEnabled) return;

    if (_reconnectAttempt >= reconnectPolicy.maxAttempts) {
      _enableFallback();
      return;
    }

    final delay = _computeBackoffDelay(_reconnectAttempt);
    _reconnectAttempt += 1;

    _logger.fine('Scheduling SSE reconnect in $delay');
    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(delay, _ensureConnected);
  }

  Duration _computeBackoffDelay(int attempt) {
    final min = reconnectPolicy.minDelay.inMilliseconds;
    final max = reconnectPolicy.maxDelay.inMilliseconds;
    final exp = (min * pow(reconnectPolicy.factor, attempt)).toDouble();
    final capped = exp.clamp(min.toDouble(), max.toDouble());
    final jitter = capped * reconnectPolicy.jitter;
    final offset = (Random().nextDouble() * 2 - 1) * jitter;
    final result = (capped + offset).round().clamp(min, max);
    return Duration(milliseconds: result);
  }

  void _enableFallback() {
    if (_fallbackEnabled) return;
    _fallbackEnabled = true;
    _logger.warning('Falling back to interval polling manager');

    for (final address in _activeAddresses) {
      fallbackManager.startPolling(address);
    }
  }

  void _subscribeAddresses(List<Address> addresses) {
    if (_uuid == null || addresses.isEmpty) return;

    final toSubscribe = addresses
        .where((address) => !_subscribedAddresses.contains(address))
        .toList();
    if (toSubscribe.isEmpty) return;

    _subscribedAddresses.addAll(toSubscribe);
    unawaited(rpcClient.subscribe(uuid: _uuid!, addresses: toSubscribe));
  }

  void _unsubscribeAddresses(List<Address> addresses) {
    if (_uuid == null || addresses.isEmpty) return;

    final toUnsubscribe = addresses
        .where(_subscribedAddresses.contains)
        .toList();
    if (toUnsubscribe.isEmpty) return;

    _subscribedAddresses.removeAll(toUnsubscribe);
    unawaited(rpcClient.unsubscribe(uuid: _uuid!, addresses: toUnsubscribe));
  }

  void _unsubscribeAll() {
    if (_uuid == null) return;
    _subscribedAddresses.clear();
    unawaited(rpcClient.unsubscribeAll(uuid: _uuid!));
  }

  void _closeStream() {
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
    _subscription?.cancel();
    _subscription = null;
    _subscribedAddresses.clear();
    unawaited(streamClient.close());
  }
}
