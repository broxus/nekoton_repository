import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nekoton_repository/nekoton_repository.dart';
import 'package:rxdart/rxdart.dart';

/// Factory responsible for selecting the polling manager implementation.
typedef RefreshPollingManagerFactory =
    RefreshPollingManager Function({required PollingConfig pollingConfig});

/// Default factory implementation for refresh polling managers.
class DefaultRefreshPollingManagerFactory {
  /// Creates a new factory.
  const DefaultRefreshPollingManagerFactory();

  RefreshPollingManager create({
    required PollingConfig pollingConfig,
    Dio? dio,
  }) {
    final sseBaseUrl = pollingConfig.sseBaseUrl?.trim();
    if (sseBaseUrl == null || sseBaseUrl.isEmpty) {
      return IntervalRefreshPollingManager(pollingConfig: pollingConfig);
    }

    final options = BaseOptions(baseUrl: sseBaseUrl);
    dio = dio?.clone(options: options) ?? Dio(options);

    return SseRefreshPollingManager(
      rpcClient: _HttpSseRpcClient(dio: dio),
      streamClient: _HttpSseStreamClient(dio: dio),
      reconnectPolicy: const SseReconnectPolicy(
        minDelay: Duration(milliseconds: 500),
        maxDelay: Duration(seconds: 10),
        factor: 2,
        jitter: 0.2,
        maxAttempts: 5,
      ),
      fallbackManager: IntervalRefreshPollingManager(
        pollingConfig: pollingConfig,
      ),
    );
  }
}

class _HttpSseRpcClient implements SseRpcClient {
  _HttpSseRpcClient({required this.dio});

  final Dio dio;
  int _rpcId = 1;

  @override
  Future<void> subscribe({
    required String uuid,
    required List<Address> addresses,
  }) {
    return _call(
      SseRpcMethod.subscribe,
      SseSubscribeParams(
        uuid: uuid,
        addresses: addresses.map((e) => e.address).toList(),
      ).toJson(),
    );
  }

  @override
  Future<void> unsubscribe({
    required String uuid,
    required List<Address> addresses,
  }) {
    return _call(
      SseRpcMethod.unsubscribe,
      SseUnsubscribeParams(
        uuid: uuid,
        addresses: addresses.map((e) => e.address).toList(),
      ).toJson(),
    );
  }

  @override
  Future<void> unsubscribeAll({required String uuid}) {
    return _call(
      SseRpcMethod.unsubscribeAll,
      SseUnsubscribeAllParams(uuid: uuid).toJson(),
    );
  }

  Future<void> _call(SseRpcMethod method, Map<String, dynamic> params) async {
    final payload = SseRpcRequest(
      id: _rpcId++,
      method: method.value,
      params: params,
    );

    final response = await dio.post<String>(
      '/rpc',
      data: jsonEncode(payload.toJson()),
      options: Options(
        contentType: Headers.jsonContentType,
        responseType: ResponseType.plain,
      ),
    );

    final body = response.data;

    if (body == null || body.isEmpty) {
      throw StateError('SSE RPC response body is empty');
    }

    final decoded = jsonDecode(body);
    if (decoded is! Map<String, dynamic>) {
      throw StateError('SSE RPC response has invalid format');
    }

    final envelope = SseRpcResponse<dynamic>.fromJson(decoded);
    final error = envelope.error;

    if (error != null) throw error;
  }
}

class _HttpSseStreamClient implements SseStreamClient {
  _HttpSseStreamClient({required this.dio});

  final Dio dio;
  CancelToken? _cancelToken;

  @override
  Future<Stream<SseStreamEvent>> connect() async {
    // Cancel any existing in-flight request before starting a new one.
    _cancelToken?.cancel();
    _cancelToken = CancelToken();

    final stream = await dio
        .get<ResponseBody>(
          '/stream',
          options: Options(
            responseType: ResponseType.stream,
            headers: {
              'Connection': 'Keep-Alive',
              'Accept': 'text/event-stream',
              'Cache-Control': 'no-cache',
            },
          ),
          cancelToken: _cancelToken,
        )
        .then((response) {
          final responseBody = response.data;
          if (responseBody == null) {
            throw StateError('SSE response body is empty');
          }

          return responseBody.stream.transform(
            ResponseBodyToSseMessageTransformer(),
          );
        });

    return stream.map((message) {
      if (message.event == null && message.data == null) return null;
      return SseStreamEvent(
        event: message.event ?? 'message',
        data: message.data ?? '',
      );
    }).whereNotNull();
  }

  @override
  Future<void> close() async {
    _cancelToken?.cancel();
    _cancelToken = null;
  }
}
