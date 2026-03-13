import 'dart:async';
import 'dart:math';

import 'package:nekoton_repository/src/repositories/refresh_polling/models/sse_models.dart';
import 'package:nekoton_repository/src/repositories/refresh_polling/models/sse_stream_event.dart';

/// Tracks SSE connection lifecycle, retry state, and reconnect scheduling.
class SseRefreshPollingConnection {
  /// Creates a new connection state holder.
  SseRefreshPollingConnection({required this.reconnectPolicy, Random? random})
    : _random = random ?? Random();

  /// Backoff policy used for reconnect scheduling.
  final SseReconnectPolicy reconnectPolicy;

  final Random _random;

  StreamSubscription<SseStreamEvent>? _subscription;
  Timer? _reconnectTimer;
  String? _uuid;
  int _reconnectAttempt = 0;
  int _connectionGeneration = 0;
  bool _fallbackEnabled = false;
  SseConnectionState _connectionState = SseConnectionState.disconnected;

  /// Current server-issued SSE connection UUID.
  String? get uuid => _uuid;

  /// Whether fallback polling has been enabled.
  bool get isFallbackEnabled => _fallbackEnabled;

  /// Whether a connection attempt is in progress.
  bool get isConnecting => _connectionState == SseConnectionState.connecting;

  /// Whether a stream subscription is currently attached.
  bool get isConnected =>
      _connectionState == SseConnectionState.connected && _subscription != null;

  /// Returns true when [generation] is still the active connection generation.
  bool isCurrentGeneration(int generation, {required bool isDisposed}) {
    return !isDisposed && generation == _connectionGeneration;
  }

  /// Marks the start of a new connection attempt and returns its generation.
  int beginConnectionAttempt() {
    _connectionState = SseConnectionState.connecting;
    return ++_connectionGeneration;
  }

  /// Marks the current connection attempt as aborted.
  void abortConnectionAttempt() {
    _connectionState = SseConnectionState.disconnected;
  }

  /// Attaches the active stream [subscription].
  void attachSubscription(StreamSubscription<SseStreamEvent> subscription) {
    _subscription = subscription;
    _connectionState = SseConnectionState.connected;
  }

  /// Detaches and returns the current stream subscription, if any.
  StreamSubscription<SseStreamEvent>? detachSubscription() {
    final subscription = _subscription;
    _subscription = null;
    return subscription;
  }

  /// Stores a new UUID and resets reconnect attempts.
  void updateUuid(String uuid) {
    _uuid = uuid;
    _reconnectAttempt = 0;
  }

  /// Returns true when fallback should be enabled instead of retrying.
  bool get shouldEnableFallback {
    return _reconnectAttempt >= reconnectPolicy.maxAttempts;
  }

  /// Computes and records the next reconnect delay.
  Duration prepareReconnectDelay() {
    final delay = _computeBackoffDelay(_reconnectAttempt);
    _reconnectAttempt += 1;
    return delay;
  }

  /// Schedules a reconnect callback after [delay].
  void scheduleReconnect(Duration delay, Future<void> Function() onReconnect) {
    _connectionState = SseConnectionState.retrying;
    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(delay, () {
      unawaited(onReconnect());
    });
  }

  /// Cancels any pending reconnect timer.
  void cancelReconnect() {
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
  }

  /// Clears stream-related state.
  void clearConnection({bool invalidateGeneration = true}) {
    if (invalidateGeneration) {
      _connectionGeneration += 1;
    }

    _connectionState = SseConnectionState.disconnected;
    _uuid = null;
    cancelReconnect();
    _subscription = null;
  }

  /// Enables fallback mode.
  void enableFallback() {
    _fallbackEnabled = true;
  }

  /// Resets non-stream state during disposal.
  void reset() {
    _reconnectAttempt = 0;
    _fallbackEnabled = false;
  }

  Duration _computeBackoffDelay(int attempt) {
    final min = reconnectPolicy.minDelay.inMilliseconds;
    final max = reconnectPolicy.maxDelay.inMilliseconds;
    final exponentialDelay = (min * pow(reconnectPolicy.factor, attempt))
        .toDouble();
    final cappedDelay = exponentialDelay.clamp(min.toDouble(), max.toDouble());
    final jitter = cappedDelay * reconnectPolicy.jitter;
    final offset = (_random.nextDouble() * 2 - 1) * jitter;
    final delay = (cappedDelay + offset).round().clamp(min, max);

    return Duration(milliseconds: delay);
  }
}
