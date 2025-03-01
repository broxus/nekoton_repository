import 'package:nekoton_repository/nekoton_repository.dart';
import 'package:rxdart/rxdart.dart';

/// Implementation of TransportRepository.
/// Usage
/// ```
/// class NekotonRepository with TransportRepositoryImpl {}
/// ```
mixin TransportRepositoryImpl implements TransportRepository {
  final _transportSubject = BehaviorSubject<TransportStrategy>(sync: true);

  @override
  TransportStrategy get currentTransport => _transportSubject.value;

  @override
  Stream<TransportStrategy> get currentTransportStream =>
      _transportSubject.stream;

  @override
  Future<void> updateTransport(TransportStrategy transport) async {
    final prev = _transportSubject.valueOrNull;
    _transportSubject.add(transport);

    final decimals = transport.defaultNativeCurrencyDecimal;
    final patternDigits = decimals > 0 ? '0.${'#' * decimals}' : '0';

    Currencies().register(
      Currency.create(
        transport.nativeTokenTicker,
        decimals,
        symbol: transport.nativeTokenTicker,
        pattern: patternDigits,
      ),
    );

    await prev?.transport.dispose();
  }

  @override
  Future<GqlTransport> createGqlTransport({
    required GqlConnectionHttpClient client,
    required String name,
    required String group,
    required List<String> endpoints,
    required bool local,
    int? latencyDetectionInterval,
    int? maxLatency,
    int? endpointSelectionRetryCount,
  }) {
    final settings = GqlNetworkSettings(
      endpoints: endpoints,
      latencyDetectionInterval:
          latencyDetectionInterval ?? defaultLatencyDetectionInterval,
      maxLatency: maxLatency ?? defaultMaxLatency,
      endpointSelectionRetryCount:
          endpointSelectionRetryCount ?? defaultEndpointSelectionRetryCount,
      local: local,
    );

    final connection = GqlConnection.create(
      client: client,
      name: name,
      group: group,
      settings: settings,
    );

    return GqlTransport.create(gqlConnection: connection);
  }

  @override
  Future<ProtoTransport> createProtoTransport({
    required ProtoConnectionHttpClient client,
    required String name,
    required String group,
    required String endpoint,
  }) {
    final settings = ProtoNetworkSettings(endpoint: endpoint);

    final connection = ProtoConnection.create(
      client: client,
      name: name,
      group: group,
      settings: settings,
    );

    return ProtoTransport.create(protoConnection: connection);
  }

  @override
  Future<JrpcTransport> createJrpcTransport({
    required JrpcConnectionHttpClient client,
    required String name,
    required String group,
    required String endpoint,
  }) {
    final settings = JrpcNetworkSettings(endpoint: endpoint);

    final connection = JrpcConnection.create(
      client: client,
      name: name,
      group: group,
      settings: settings,
    );

    return JrpcTransport.create(jrpcConnection: connection);
  }
}
