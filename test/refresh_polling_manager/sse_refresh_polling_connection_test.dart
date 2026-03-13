import 'dart:async';
import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:nekoton_repository/src/repositories/refresh_polling/models/sse_models.dart';
import 'package:nekoton_repository/src/repositories/refresh_polling/models/sse_stream_event.dart';
import 'package:nekoton_repository/src/repositories/refresh_polling/sse/sse_refresh_polling_connection.dart';

class _FixedRandom implements Random {
  const _FixedRandom(this.value);

  final double value;

  @override
  bool nextBool() => value >= 0.5;

  @override
  double nextDouble() => value;

  @override
  int nextInt(int max) => (value * max).floor().clamp(0, max - 1);
}

const _reconnectPolicy = SseReconnectPolicy(
  minDelay: Duration(milliseconds: 100),
  maxDelay: Duration(milliseconds: 1000),
  factor: 2,
  jitter: 0.25,
  maxAttempts: 3,
);

void main() {
  group('SseRefreshPollingConnection', () {
    test('tracks connection generation and active subscription', () {
      final connection = SseRefreshPollingConnection(
        reconnectPolicy: _reconnectPolicy,
      );
      final subscription = const Stream<SseStreamEvent>.empty().listen(null);

      final generation = connection.beginConnectionAttempt();
      connection.attachSubscription(subscription);

      expect(connection.isConnecting, isFalse);
      expect(connection.isConnected, isTrue);
      expect(
        connection.isCurrentGeneration(generation, isDisposed: false),
        isTrue,
      );
      expect(connection.detachSubscription(), same(subscription));
      expect(connection.isConnected, isFalse);
    });

    test('resets reconnect attempts when uuid changes', () {
      final connection =
          SseRefreshPollingConnection(
              reconnectPolicy: _reconnectPolicy,
              random: const _FixedRandom(0.5),
            )
            ..prepareReconnectDelay()
            ..prepareReconnectDelay()
            ..updateUuid('uuid-1');

      final delay = connection.prepareReconnectDelay();

      expect(connection.uuid, 'uuid-1');
      expect(delay, const Duration(milliseconds: 100));
    });

    test('computes backoff with jitter and enables fallback on limit', () {
      final connection = SseRefreshPollingConnection(
        reconnectPolicy: _reconnectPolicy,
        random: const _FixedRandom(1),
      );

      final delays = List<Duration>.generate(
        3,
        (_) => connection.prepareReconnectDelay(),
      );

      expect(delays, const [
        Duration(milliseconds: 125),
        Duration(milliseconds: 250),
        Duration(milliseconds: 500),
      ]);
      expect(connection.shouldEnableFallback, isTrue);

      connection.enableFallback();

      expect(connection.isFallbackEnabled, isTrue);
    });

    test('clears connection state and invalidates generation', () {
      final subscription = const Stream<SseStreamEvent>.empty().listen(null);
      final connection = SseRefreshPollingConnection(
        reconnectPolicy: _reconnectPolicy,
      );
      final generation = connection.beginConnectionAttempt();

      connection
        ..updateUuid('uuid-1')
        ..attachSubscription(subscription)
        ..clearConnection();

      expect(connection.uuid, isNull);
      expect(connection.isConnected, isFalse);
      expect(
        connection.isCurrentGeneration(generation, isDisposed: false),
        isFalse,
      );
    });

    test('can cancel scheduled reconnect before callback fires', () async {
      var reconnectCalls = 0;
      SseRefreshPollingConnection(reconnectPolicy: _reconnectPolicy)
        ..scheduleReconnect(const Duration(milliseconds: 20), () async {
          reconnectCalls += 1;
        })
        ..cancelReconnect();

      await Future<void>.delayed(const Duration(milliseconds: 40));

      expect(reconnectCalls, 0);
    });
  });
}
