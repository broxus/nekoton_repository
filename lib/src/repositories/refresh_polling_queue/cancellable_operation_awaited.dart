import 'package:async/async.dart';

/// Wrapper above CancelableOperation that allows mark operation as canceled
/// and wait for canceled operation itself except of ignoring result.
class CancelableOperationAwaited<T> {
  CancelableOperationAwaited.fromFuture(Future<T> result)
      : _operation = CancelableOperation.fromFuture(result);

  final CancelableOperation<T> _operation;

  bool _isCanceled = false;

  bool get isCanceled => _isCanceled;

  Future<void> cancel() {
    _isCanceled = true;

    return _operation.valueOrCancellation();
  }

  Future<T?> valueOrCancellation() => _operation.valueOrCancellation();
}
