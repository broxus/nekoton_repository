import 'package:nekoton_repository/nekoton_repository.dart';

/// No-op implementation of [RefreshPollingManager].
///
/// Useful in tests or when polling is intentionally disabled.
class NoopRefreshPollingManager implements RefreshPollingManager {
  /// Creates a no-op polling manager.
  const NoopRefreshPollingManager();

  @override
  RefreshPollingBackend get backend => RefreshPollingBackend.interval;

  @override
  bool get isPaused => false;

  @override
  Stream<bool> get isPausedStream => const Stream.empty();

  @override
  void registerTarget(RefreshPollingTarget target) {}

  @override
  void unregisterTarget(Address address) {}

  @override
  bool hasTarget(Address address) => false;

  @override
  void startPolling(Address address) {}

  @override
  void stopPolling(Address address) {}

  @override
  void stopPollingAll() {}

  @override
  void pausePolling() {}

  @override
  void resumePolling() {}

  @override
  void setPollingMode(Address address, RefreshPollingMode mode) {}

  @override
  void clear() {}

  @override
  void dispose() {}
}
