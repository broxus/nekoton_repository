class SseSubscribeParams {
  const SseSubscribeParams({required this.uuid, required this.addresses});

  factory SseSubscribeParams.fromJson(Map<String, dynamic> json) =>
      SseSubscribeParams(
        uuid: json['uuid'] as String,
        addresses: (json['addrs'] as List<dynamic>).cast<String>(),
      );

  final String uuid;
  final List<String> addresses;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'uuid': uuid,
    'addrs': addresses,
  };
}

class SseUnsubscribeParams {
  const SseUnsubscribeParams({required this.uuid, required this.addresses});

  factory SseUnsubscribeParams.fromJson(Map<String, dynamic> json) =>
      SseUnsubscribeParams(
        uuid: json['uuid'] as String,
        addresses: (json['addrs'] as List<dynamic>).cast<String>(),
      );

  final String uuid;
  final List<String> addresses;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'uuid': uuid,
    'addrs': addresses,
  };
}

class SseUnsubscribeAllParams {
  const SseUnsubscribeAllParams({required this.uuid});

  factory SseUnsubscribeAllParams.fromJson(Map<String, dynamic> json) =>
      SseUnsubscribeAllParams(uuid: json['uuid'] as String);

  final String uuid;

  Map<String, dynamic> toJson() => <String, dynamic>{'uuid': uuid};
}
