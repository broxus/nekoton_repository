import 'dart:async';
import 'package:logging/logging.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

/// Callback that will be called during every refresh completes.
/// If refresh completes with error, [error] will not be null.
typedef RefreshCompleteCallback = void Function([
  (Object error, StackTrace trace)? error,
]);

/// This is a queue that lets you refreshing your wallets.
///
/// This queue works only for one wallet. If you want to refresh several wallets
/// you should create several queues.
class RefreshPollingQueue {
  RefreshPollingQueue({
    required this.refresher,
    required this.refreshInterval,
    this.refreshCompleteCallback,
    this.stopPollingIfError = true,
  });

  static final _logger = Logger('RefreshPollingQueue');

  /// Flag for refresh requests.
  /// Flag is rising by calling [startPolling], this means, that polling
  /// queue must start refresh operation when possible.
  ///
  /// Flag will be omitted by calling [stopPolling] method.
  ///
  /// This means, that refreshes will be called until this flag is raised.
  bool _hasRequest = false;

  /// If true, then polling will be stopped after error during refresh.
  /// To rerun process, you should call [startPolling] again.
  final bool stopPollingIfError;

  /// Refresh function that should be called periodically.
  final RefreshingInterface refresher;

  /// Refresh interval.
  final Duration refreshInterval;

  /// Callback that will be called every time, when refresh completes.
  /// This can be helpful to handle some states during polling.
  ///
  /// Result sends before checking for [_hasRequest] flag, so you can stop
  /// polling in callback if needed.
  ///
  /// !!! This callback calls with both successful result or error.
  ///     If completed with error, callback argument will be sent.
  final RefreshCompleteCallback? refreshCompleteCallback;

  /// Completer that indicates that current refresh operation in progress.
  Completer<void>? _refreshCompleter;

  /// Timer that calls [refresher].refresh method after time passed.
  ///
  /// This timer is not periodic, it will be created and launched every time,
  /// when refresh operation completes.
  ///
  /// To start timer work, use [startPolling].
  Timer? _timer;

  /// Get if polling is active now.
  /// Timer can be paused after it was completed, but not launched again after
  /// the refresh operation completion, so we check both states.
  bool get isPolling =>
      _timer != null && _timer!.isActive ||
      _refreshCompleter != null && !_refreshCompleter!.isCompleted;

  /// Returns future that completes when current refresh is finished.
  /// Or empty future if there is no refresh action.
  ///
  /// This can be helpful outside to track when refresh is finished.
  Future<void> currentRefresh() async =>
      _isRefreshing() ? _refreshCompleter?.future : Future.value();

  /// Request only one refresh operation without polling.
  void runSingleRefresh() {
    _hasRequest = true;
    _requestRefresh();
    _hasRequest = false;
  }

  /// Start refreshing by polling by launching timer or immediately calling
  /// refresh operation.
  /// [refreshImmediately] will try to call refresh immediately without creating
  /// timer.
  /// If [refreshImmediately] is false, then timer will be created and launched.
  /// This timer recreates every time, when refresh operation completes, so
  /// we have next workflow:
  /// 1) Timer created (3 secs)
  /// 2) Refresh operation completed (5 secs)
  /// 3) Timer created (3 secs)
  /// and etc.
  /// So for timer 3 secs and refresh duration 5 secs, we will have 8 secs for
  /// single flow.
  /// If [refreshImmediately] is true, then 1-st step of workflow above will be
  /// omitted and started with refresh operation.
  void startPolling({bool refreshImmediately = false}) {
    if (_hasRequest) {
      return;
    }

    _hasRequest = true;

    if (refreshImmediately) {
      _requestRefresh();
    } else {
      _createTimer();
    }
  }

  /// Create delay timer after which refresh will be called.
  /// This timer calls in the beginning of [startPolling] or in the end of
  /// refresh operation.
  void _createTimer() {
    if (!_hasRequest) return;

    _timer = Timer(refreshInterval, _requestRefresh);
  }

  /// Stop refresh polling.
  void stopPolling() {
    _timer?.cancel();
    _timer = null;
    _hasRequest = false;
  }

  /// ---------------------------------------------------
  /// Internal methods
  /// ---------------------------------------------------

  /// Try to refresh if possible.
  void _requestRefresh() {
    _timer?.cancel();
    _timer = null;

    if (!_hasRequest) return;

    if (_isRefreshing()) return;

    // ignore to avoid throwing exception to startPolling and runSingleRefresh
    _refresh().ignore();
  }

  /// Returns true, if refresh is in progress, false otherwise.
  bool _isRefreshing() {
    final completer = _refreshCompleter;

    return completer != null && !completer.isCompleted;
  }

  /// Start refresh operation by calling [RefreshingInterface.refresh] method.
  Future<void> _refresh() async {
    _logger.info('Refresh ${refresher.refreshDescription} started!');
    _refreshCompleter = Completer();

    _makeRefresh().ignore();
    await _refreshCompleter?.future;
  }

  Future<void> _makeRefresh() async {
    try {
      // make this pseudo event to avoid throwing errors without ignore above
      await Future<void>.delayed(Duration.zero);

      await refresher.refresh();
      _refreshCompleter?.complete();
      refreshCompleteCallback?.call();
    } catch (e, s) {
      _logger.severe('Refresh ${refresher.refreshDescription} failed!', e, s);
      if (stopPollingIfError) {
        stopPolling();
      }
      _refreshCompleter?.completeError(e, s);
      refreshCompleteCallback?.call((e, s));
    } finally {
      _refreshCompleter = null;
      _createTimer();
    }
  }
}
