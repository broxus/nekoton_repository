final class OperationCanceledException implements Exception {
  OperationCanceledException([this.message]);

  final String? message;

  @override
  String toString() {
    return 'SubscriptionCanceledException: $message';
  }
}
