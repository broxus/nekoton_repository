class SseRpcError {
  const SseRpcError({required this.code, this.message, this.data});

  factory SseRpcError.fromJson(Map<String, dynamic> json) => SseRpcError(
    code: json['code'] as int,
    message: json['message'] as String?,
    data: json['data'],
  );

  final int code;
  final String? message;
  final Object? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'code': code,
    if (message != null) 'message': message,
    if (data != null) 'data': data,
  };

  @override
  String toString() =>
      'SseRpcError(code: $code, message: $message, data: $data)';
}
