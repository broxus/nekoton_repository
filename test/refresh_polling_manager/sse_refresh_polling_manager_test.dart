import 'dart:async';

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
  Future<Stream<SseStreamEvent>> connect() async => const Stream.empty();

  @override
  Future<void> close() => Future.value();
}

class _ControlledStreamClient implements SseStreamClient {
  final connectCompleter = Completer<Stream<SseStreamEvent>>();
  int connectCalls = 0;
  int closeCalls = 0;

  @override
  Future<Stream<SseStreamEvent>> connect() {
    connectCalls += 1;
    return connectCompleter.future;
  }

  @override
  Future<void> close() async {
    closeCalls += 1;
  }
}

class _DelayedDisposePollingManager implements RefreshPollingManager {
  final disposeCompleter = Completer<void>();
  bool disposeStarted = false;
  bool disposeFinished = false;

  @override
  RefreshPollingBackend get backend => RefreshPollingBackend.interval;

  @override
  bool get isPaused => false;

  @override
  Stream<bool> get isPausedStream => const Stream.empty();

  @override
  void registerTarget(RefreshPollingTarget target) {}

  @override
  void unregisterTarget(Address address) {}

  @override
  bool hasTarget(Address address) => false;

  @override
  void startPolling(Address address) {}

  @override
  void stopPolling(Address address) {}

  @override
  void stopPollingAll() {}

  @override
  void pausePolling() {}

  @override
  void resumePolling() {}

  @override
  void setPollingMode(Address address, RefreshPollingMode mode) {}

  @override
  Future<void> dispose() async {
    disposeStarted = true;
    await disposeCompleter.future;
    disposeFinished = true;
  }
}

const _testTarget1 = RefreshPollingTarget(
  address: Address(address: '0:3'),
  refresher: _TestRefresher(),
  defaultInterval: Duration(seconds: 10),
  intensiveInterval: Duration(seconds: 2),
  debugLabel: 'ton:0:3',
);

const _testTarget2 = RefreshPollingTarget(
  address: Address(address: '0:4'),
  refresher: _TestRefresher(),
  defaultInterval: Duration(seconds: 10),
  intensiveInterval: Duration(seconds: 2),
  debugLabel: 'ton:0:4',
);

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

      final manager =
          SseRefreshPollingManager(
              reconnectPolicy: reconnectPolicy,
              rpcClient: const _FakeRpcClient(),
              streamClient: const _FakeStreamClient(),
              fallbackManager: const NoopRefreshPollingManager(),
            )
            ..registerTarget(_testTarget1)
            ..startPolling(_testTarget1.address);

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

    test('coalesces concurrent connection attempts', () async {
      const reconnectPolicy = SseReconnectPolicy(
        minDelay: Duration(milliseconds: 10),
        maxDelay: Duration(milliseconds: 20),
        factor: 2,
        jitter: 0,
        maxAttempts: 3,
      );

      final streamClient = _ControlledStreamClient();
      final manager =
          SseRefreshPollingManager(
              reconnectPolicy: reconnectPolicy,
              rpcClient: const _FakeRpcClient(),
              streamClient: streamClient,
              fallbackManager: const NoopRefreshPollingManager(),
            )
            ..registerTarget(_testTarget1)
            ..registerTarget(_testTarget2)
            ..startPolling(_testTarget1.address)
            ..startPolling(_testTarget2.address);

      await Future<void>.delayed(Duration.zero);

      expect(streamClient.connectCalls, 1);

      streamClient.connectCompleter.complete(
        StreamController<SseStreamEvent>().stream,
      );

      await manager.dispose();
    });

    test('dispose cancels reconnect and awaits fallback teardown', () async {
      const reconnectPolicy = SseReconnectPolicy(
        minDelay: Duration(milliseconds: 10),
        maxDelay: Duration(milliseconds: 20),
        factor: 2,
        jitter: 0,
        maxAttempts: 3,
      );

      final controller = StreamController<SseStreamEvent>();
      final fallbackManager = _DelayedDisposePollingManager();
      final streamClient = _ControlledStreamClient()
        ..connectCompleter.complete(controller.stream);
      final manager =
          SseRefreshPollingManager(
              reconnectPolicy: reconnectPolicy,
              rpcClient: const _FakeRpcClient(),
              streamClient: streamClient,
              fallbackManager: fallbackManager,
            )
            ..registerTarget(_testTarget1)
            ..startPolling(_testTarget1.address);

      controller.add(const SseStreamEvent(event: 'uuid', data: 'uuid-1'));
      await Future<void>.delayed(Duration.zero);
      await controller.close();
      await Future<void>.delayed(Duration.zero);

      final disposeFuture = manager.dispose();
      await Future<void>.delayed(Duration.zero);

      expect(fallbackManager.disposeStarted, isTrue);
      expect(fallbackManager.disposeFinished, isFalse);

      await Future<void>.delayed(const Duration(milliseconds: 30));
      expect(streamClient.connectCalls, 1);

      fallbackManager.disposeCompleter.complete();
      await disposeFuture;

      expect(fallbackManager.disposeFinished, isTrue);
    });
  });
}
