class SseRpcRequest<T> {
  const SseRpcRequest({
    required this.id,
    required this.method,
    required this.params,
    this.jsonrpc = '2.0',
  });

  factory SseRpcRequest.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return SseRpcRequest<T>(
      id: json['id'] as int,
      method: json['method'] as String,
      params: fromJsonT(json['params']),
      jsonrpc: json['jsonrpc'] as String? ?? '2.0',
    );
  }

  final int id;
  final String method;
  final T params;
  final String jsonrpc;

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      <String, dynamic>{
        'id': id,
        'method': method,
        'params': toJsonT(params),
        'jsonrpc': jsonrpc,
      };
}
