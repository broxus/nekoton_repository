import 'package:flutter_test/flutter_test.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

class _TestRefresher implements RefreshingInterface {
  const _TestRefresher();

  @override
  Future<void> refresh() async {}

  @override
  String get refreshDescription => 'test-refresher';
}

class _FakeRpcClient implements SseRpcClient {
  const _FakeRpcClient();

  @override
  Future<void> subscribe({
    required String uuid,
    required List<Address> addresses,
  }) {
    return Future.value();
  }

  @override
  Future<void> unsubscribe({
    required String uuid,
    required List<Address> addresses,
  }) {
    return Future.value();
  }

  @override
  Future<void> unsubscribeAll({required String uuid}) {
    return Future.value();
  }
}

class _FakeStreamClient implements SseStreamClient {
  const _FakeStreamClient();

  @override
  Stream<SseStreamEvent> connect() => const Stream.empty();

  @override
  Future<void> close() => Future.value();
}

void main() {
  group('SseRefreshPollingManager', () {
    test('subscribes and dispatches updates via SSE', () async {
      const reconnectPolicy = SseReconnectPolicy(
        minDelay: Duration(milliseconds: 500),
        maxDelay: Duration(seconds: 30),
        factor: 2,
        jitter: 0.2,
        maxAttempts: 5,
      );

      final manager = SseRefreshPollingManager(
        reconnectPolicy: reconnectPolicy,
        rpcClient: const _FakeRpcClient(),
        streamClient: const _FakeStreamClient(),
        fallbackManager: const NoopRefreshPollingManager(),
      );

      const target = RefreshPollingTarget(
        address: Address(address: '0:3'),
        refresher: _TestRefresher(),
        defaultInterval: Duration(seconds: 10),
        intensiveInterval: Duration(seconds: 2),
        debugLabel: 'ton:0:3',
      );

      manager
        ..registerTarget(target)
        ..startPolling(target.address);

      expect(manager.backend, RefreshPollingBackend.sse);
    });

    test('falls back to interval manager after reconnect failures', () async {
      const reconnectPolicy = SseReconnectPolicy(
        minDelay: Duration(milliseconds: 500),
        maxDelay: Duration(seconds: 30),
        factor: 2,
        jitter: 0.2,
        maxAttempts: 3,
      );
      const fallback = NoopRefreshPollingManager();

      final _ = SseRefreshPollingManager(
        rpcClient: const _FakeRpcClient(),
        streamClient: const _FakeStreamClient(),
        reconnectPolicy: reconnectPolicy,
        fallbackManager: fallback,
      )..startPolling(const Address(address: '0:4'));

      expect(fallback.backend, RefreshPollingBackend.interval);
    });
  });
}
