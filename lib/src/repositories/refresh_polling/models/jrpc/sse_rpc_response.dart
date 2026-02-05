import 'package:nekoton_repository/src/repositories/refresh_polling/models/jrpc/sse_rpc_error.dart';

class SseRpcResponse<T> {
  const SseRpcResponse({
    this.jsonrpc = '2.0',
    this.id,
    this.result,
    this.error,
  });

  factory SseRpcResponse.fromJson(
    Map<String, dynamic> json, [
    T Function(Object? json)? fromJsonT,
  ]) {
    return SseRpcResponse<T>(
      jsonrpc: json['jsonrpc'] as String? ?? '2.0',
      id: json['id'] as int?,
      result: json.containsKey('result') && fromJsonT != null
          ? fromJsonT(json['result'])
          : null,
      error: json['error'] == null
          ? null
          : SseRpcError.fromJson(json['error'] as Map<String, dynamic>),
    );
  }

  final String jsonrpc;
  final int? id;
  final T? result;
  final SseRpcError? error;

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      <String, dynamic>{
        'jsonrpc': jsonrpc,
        if (id != null) 'id': id,
        if (result != null) 'result': toJsonT(result as T),
        if (error != null) 'error': error!.toJson(),
      };
}
