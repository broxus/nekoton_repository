import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

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
    if (envelope.error != null) {
      throw StateError('SSE RPC error: ${envelope.error}');
    }
  }
}

class _HttpSseStreamClient implements SseStreamClient {
  _HttpSseStreamClient({required this.dio});

  final Dio dio;
  CancelToken? _cancelToken;
  void Function()? _cancelSubscription;

  @override
  Stream<SseStreamEvent> connect() {
    final controller = StreamController<SseStreamEvent>();

    controller
      ..onListen = () async {
        _cancelToken?.cancel();
        _cancelToken = CancelToken();

        try {
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

          final subscription = stream.listen(
            (message) {
              if (message.event == null && message.data == null) return;
              final event = SseStreamEvent(
                event: message.event ?? 'message',
                data: message.data ?? '',
              );
              controller.add(event);
            },
            onError: controller.addError,
            onDone: () {
              final cancel = _cancelSubscription;
              _cancelSubscription = null;
              cancel?.call();
              controller.close();
            },
          );
          _cancelSubscription = () {
            unawaited(subscription.cancel());
          };
        } catch (e, s) {
          controller.addError(e, s);
        }
      }
      ..onCancel = () async {
        final cancel = _cancelSubscription;
        _cancelSubscription = null;
        cancel?.call();

        final token = _cancelToken;
        _cancelToken = null;
        token?.cancel();
      };

    return controller.stream;
  }

  @override
  Future<void> close() async {
    final cancel = _cancelSubscription;
    _cancelSubscription = null;
    cancel?.call();

    final token = _cancelToken;
    _cancelToken = null;
    token?.cancel();
  }
}
