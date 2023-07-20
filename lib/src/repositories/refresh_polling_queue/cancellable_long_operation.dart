import 'dart:async';

/// This is a support behavior because we can't cancel dart's Future, but for
/// some long and multi-step operations, this can be helpful to stop such
/// operations, for example, updating subscriptions for ton/token wallets.
///
/// Typical usage of this operation:
///
/// ```
/// late CancellableLongOperation<void> operation;
/// operation = CancellableLongOperation<void>(() async {
///   for (var i = 0; i < 5; i++) {
///     await function.call(); // this is long operation
///     if (operation.isStopped) return;
///   }
/// });
///
/// ```
class CancellableLongOperation<T> {
  CancellableLongOperation(this._operation) {
    _startOperation().ignore();
  }

  /// This is an operation that will be executed for long time.
  /// To cancel operation, you must save instance of CancellableLongOperation
  /// and check after every step [isStopped] flag to stop operation.
  final Future<T> Function() _operation;

  bool _isStopped = false;

  /// Check, if operation was stopped by calling [stop] method, so [_operation]
  /// must be completed.
  bool get isStopped => _isStopped;

  final _completer = Completer<T?>();

  /// This is a future, that really should be checked to track when operation
  /// really will be completed (by its own time or by stopping).
  ///
  /// If result is null, then future was completed by [stop].
  /// If result contains [T] or exception, then is was completed itself.
  ///
  /// Typically, you don't need result of this operation, because it's void.
  Future<T?> get resultFuture => _completer.future;

  /// Stop operation at next iteration of executing.
  /// To track this, [_operation] must contains checking for [isStopped] flag.
  ///
  /// !!! This is not a real stopping of dart's future, so to track when it will
  /// be completed, use:
  ///
  /// ```
  /// operation.stop();
  /// await operation.resultFuture;
  /// ```
  void stop() {
    if (isStopped) return;

    if (!_completer.isCompleted) {
      _completer.complete(null);
    }
    _isStopped = true;
  }

  Future<void> _startOperation() async {
    try {
      final res = await _operation();

      if (!_completer.isCompleted) {
        _completer.complete(res);
      }
      _isStopped = true;
    } on Exception catch (e, t) {
      if (!_completer.isCompleted) _completer.completeError(e, t);
    }
  }
}
