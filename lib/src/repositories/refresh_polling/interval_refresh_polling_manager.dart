import 'package:logging/logging.dart';
import 'package:nekoton_repository/nekoton_repository.dart';
import 'package:rxdart/rxdart.dart';

/// Interval-based polling manager built on top of [RefreshPollingQueue].
///
/// This implementation is responsible for creating polling queues per address,
/// switching them between normal and intensive intervals, and pausing/resuming
/// globally. It should be used when SSE is not available or as a fallback.
class IntervalRefreshPollingManager implements RefreshPollingManager {
  /// Creates a new interval-based polling manager.
  IntervalRefreshPollingManager({required this.pollingConfig, Logger? logger})
    : _logger = logger ?? Logger('IntervalRefreshPollingManager');

  /// Active polling configuration from the current transport.
  final PollingConfig pollingConfig;

  final Logger _logger;

  final _targets = <Address, RefreshPollingTarget>{};
  final _queues = <Address, RefreshPollingQueue>{};
  final _activeAddresses = <Address>{};
  final _modes = <Address, RefreshPollingMode>{};
  final _isPausedSubject = BehaviorSubject<bool>.seeded(false);

  @override
  RefreshPollingBackend get backend => RefreshPollingBackend.interval;

  @override
  bool get isPaused => _isPausedSubject.value;

  @override
  Stream<bool> get isPausedStream => _isPausedSubject.stream;

  @override
  void registerTarget(RefreshPollingTarget target) {
    if (_targets.containsKey(target.address)) {
      unregisterTarget(target.address);
    }

    _targets[target.address] = target;
    _modes[target.address] =
        _modes[target.address] ?? RefreshPollingMode.normal;
    _queues[target.address] = _createQueue(target);

    _logger.fine(
      'Registered polling target for ${target.debugLabel ?? target.address}',
    );
  }

  @override
  void unregisterTarget(Address address) {
    _queues.remove(address)?.stop();
    _targets.remove(address);
    _modes.remove(address);
    _activeAddresses.remove(address);
  }

  @override
  bool hasTarget(Address address) {
    return _targets.containsKey(address);
  }

  @override
  void startPolling(Address address) {
    final target = _targets[address];
    if (target == null) return;

    _activeAddresses.add(address);

    final queue = _queues[address] ?? _createQueue(target);
    _queues[address] = queue;

    _applyPollingInterval(
      address: address,
      target: target,
      queue: queue,
      refreshImmediately: false,
    );

    if (!isPaused) {
      queue.start();
    }
  }

  @override
  void stopPolling(Address address) {
    _queues[address]?.stop();
    _activeAddresses.remove(address);
  }

  @override
  void stopPollingAll() {
    for (final queue in _queues.values) {
      queue.stop();
    }
    _activeAddresses.clear();
  }

  @override
  void pausePolling() {
    for (final queue in _queues.values) {
      queue.pause();
    }
    _isPausedSubject.add(true);
  }

  @override
  void resumePolling() {
    for (final address in _activeAddresses) {
      _queues[address]?.resume();
    }
    _isPausedSubject.add(false);
  }

  @override
  void setPollingMode(Address address, RefreshPollingMode mode) {
    final target = _targets[address];
    if (target == null) return;

    _modes[address] = mode;

    final queue = _queues[address];
    if (queue == null) return;

    _applyPollingInterval(
      address: address,
      target: target,
      queue: queue,
      refreshImmediately: mode == RefreshPollingMode.intensive,
    );
  }

  @override
  void clear() {
    for (final queue in _queues.values) {
      queue.stop();
    }
    _queues.clear();
    _targets.clear();
    _activeAddresses.clear();
    _modes.clear();
  }

  @override
  void dispose() {
    clear();
    _isPausedSubject.close();
  }

  RefreshPollingQueue _createQueue(RefreshPollingTarget target) {
    return RefreshPollingQueue(
      refresher: target.refresher,
      refreshInterval: target.defaultInterval,
    );
  }

  void _applyPollingInterval({
    required Address address,
    required RefreshPollingTarget target,
    required RefreshPollingQueue queue,
    required bool refreshImmediately,
  }) {
    final mode = _modes[address] ?? RefreshPollingMode.normal;
    final interval = mode == RefreshPollingMode.intensive
        ? target.intensiveInterval
        : target.defaultInterval;

    queue.updateRefreshInterval(
      interval: interval,
      refreshImmediately: refreshImmediately,
    );
  }
}
