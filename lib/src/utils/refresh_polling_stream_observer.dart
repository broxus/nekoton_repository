import 'package:nekoton_repository/nekoton_repository.dart';

/// Observes wallet stream listener activity to toggle polling lazily.
///
/// Polling starts only when external listeners exist (beyond internal
/// repository subscriptions) and stops once all external listeners are gone.
class RefreshPollingStreamObserver extends StreamListenersObserver {
  RefreshPollingStreamObserver({
    required this.address,
    required this.refreshPollingManager,
    required this.internalListenersCount,
  });

  /// Wallet address used for polling control.
  final Address address;

  /// Polling manager used to start/stop wallet polling.
  final RefreshPollingManager refreshPollingManager;

  /// Number of internal listeners created by repository subscriptions.
  final int internalListenersCount;

  int _totalListeners = 0;
  bool _isActive = false;

  /// Syncs polling state whenever total stream listeners count changes.
  @override
  void onStreamListenersChanged(int totalListenersCount) {
    _totalListeners = totalListenersCount;
    _sync();
  }

  /// Stops polling and marks the observer as inactive.
  void dispose() => _stop();

  void _sync() {
    if (_totalListeners > internalListenersCount) {
      _start();
    } else {
      _stop();
    }
  }

  void _start() {
    if (_isActive) return;

    refreshPollingManager.startPolling(address);
    _isActive = true;
  }

  void _stop() {
    if (!_isActive) return;

    refreshPollingManager.stopPolling(address);
    _isActive = false;
  }
}
