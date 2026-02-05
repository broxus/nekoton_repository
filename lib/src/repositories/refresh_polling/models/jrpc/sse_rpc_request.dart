class SseRpcRequest {
  const SseRpcRequest({
    required this.id,
    required this.method,
    required this.params,
    this.jsonrpc = '2.0',
  });

  final int id;
  final String method;
  final Map<String, dynamic> params;
  final String jsonrpc;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'method': method,
    'params': params,
    'jsonrpc': jsonrpc,
  };
}
