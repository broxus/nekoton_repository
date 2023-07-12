import 'dart:async';
import 'dart:collection';

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

  /// Queue of refresh requests.
  /// Requests adds to the queue by calling [_requestRefresh], so there can be
  /// many requests in the queue, but after taking next request, the queue will
  /// be cleared.
  ///
  /// Items from the queue will be removed by calling [_checkQueue] method.
  /// This method will be called after refresh is finished or after adding new
  /// request by calling [_requestRefresh].
  final _queue = Queue<void>();

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
  /// Result sends before checking for queue, so you can stop polling in
  /// callback if needed.
  ///
  /// !!! This callback calls with both successful result or error.
  ///     If completed with error, callback argument will be sent.
  final RefreshCompleteCallback? refreshCompleteCallback;

  /// Completer that indicates that current refresh operation in progress.
  Completer<void>? _refreshCompleter;

  /// Timer that calls [refresher].refresh method
  Timer? _timer;

  /// Get if polling is active now
  bool get isPolling => _timer != null && _timer!.isActive;

  /// Returns future that completes when current refresh is finished.
  /// Or empty future if there is no refresh action.
  ///
  /// This can be helpful outside to track when refresh is finished.
  Future<void> currentRefresh() async =>
      _isRefreshing() ? _refreshCompleter?.future : Future.value();

  /// Request only one refresh operation without polling.
  void runSingleRefresh() => _requestRefresh();

  /// Start refreshing by polling.
  /// [refreshImmediately] will try to call refresh immediately.
  void startPolling({bool refreshImmediately = false}) {
    if (_timer != null) {
      return;
    }

    _timer = Timer.periodic(
      refreshInterval,
      (_) => _requestRefresh(),
    );

    if (refreshImmediately) {
      _requestRefresh();
    }
  }

  /// Stop refresh polling.
  ///
  /// [clearQueue] allows to clear all requested refreshes.
  void stopPolling({bool clearQueue = true}) {
    _timer?.cancel();
    _timer = null;

    if (clearQueue) _queue.clear();
  }

  /// ---------------------------------------------------
  /// Internal methods
  /// ---------------------------------------------------

  /// Request refreshing by adding value to the queue and try to refresh if
  /// if possible.
  void _requestRefresh() {
    _queue.add(null);
    _checkQueue();
  }

  /// Check if we have refresh requests and if we can refresh.
  /// If we can refresh then refresh and clear requests from the queue.
  void _checkQueue() {
    if (_queue.isEmpty) return;

    if (_isRefreshing()) return;

    _queue.clear();
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
      _checkQueue();
    }
  }
}
