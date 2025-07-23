final class OperationCanceledException implements Exception {
  const OperationCanceledException([this.message]);

  final String? message;

  @override
  String toString() {
    return 'OperationCanceledException: $message';
  }
}

final class TvmException implements Exception {
  const TvmException(this.code);

  final int code;

  @override
  String toString() {
    return 'TvmException: $code';
  }
}
