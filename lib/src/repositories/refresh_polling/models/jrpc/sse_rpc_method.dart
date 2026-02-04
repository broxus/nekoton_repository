/// JSON-RPC methods for SSE subscriptions.
enum SseRpcMethod { subscribe, unsubscribe, unsubscribeAll }

extension SseRpcMethodValue on SseRpcMethod {
  /// Wire value used in JSON-RPC payloads.
  String get value => switch (this) {
    SseRpcMethod.subscribe => 'subSubscribe',
    SseRpcMethod.unsubscribe => 'subUnsubscribe',
    SseRpcMethod.unsubscribeAll => 'subUnsubscribeAll',
  };
}
