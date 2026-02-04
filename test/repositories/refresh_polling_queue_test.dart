import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

class _CallbackStub {
  void call([(Object error, StackTrace trace)? error]) {}
}

class RefresherImplementation extends Mock implements RefreshingInterface {
  @override
  String get refreshDescription => 'RefresherImplementation';
}

class RefreshCompleteCallback extends Mock implements _CallbackStub {}

void main() {
  const queueTimeout = Duration(milliseconds: 200);
  const refresherDelay = Duration(milliseconds: 100);

  group('RefreshPollingQueue', () {
    test('Request refresh by runSingleRefresh', () async {
      final refresher = RefresherImplementation();
      final callback = RefreshCompleteCallback();

      when(
        refresher.refresh,
      ).thenAnswer((_) => Future<void>.delayed(refresherDelay));
      when(callback.call).thenReturn(null);

      RefreshPollingQueue(
        refresher: refresher,
        refreshInterval: queueTimeout,
        refreshCompleteCallback: callback.call,
      ).runSingleRefresh();

      await Future<void>.delayed(queueTimeout * 2);
      verify(refresher.refresh).called(1);
      verify(callback.call).called(1);
    });

    test('Request refresh by polling', () async {
      final refresher = RefresherImplementation();
      final callback = RefreshCompleteCallback();
      when(
        refresher.refresh,
      ).thenAnswer((_) => Future<void>.delayed(refresherDelay));
      when(callback.call).thenReturn(null);

      final queue = RefreshPollingQueue(
        refresher: refresher,
        refreshInterval: queueTimeout,
        refreshCompleteCallback: callback.call,
      )..start();

      // ~0.7 secs lasts, refreshed 2 times
      await Future<void>.delayed(
        queueTimeout * 2 +
            refresherDelay * 2 +
            const Duration(milliseconds: 60),
      );
      queue.stop();
      verify(refresher.refresh).called(2);
      verify(callback.call).called(2);
    });

    test('Request refresh by polling with refreshImmediately=true', () async {
      final refresher = RefresherImplementation();
      when(
        refresher.refresh,
      ).thenAnswer((_) => Future<void>.delayed(refresherDelay));

      final queue = RefreshPollingQueue(
        refresher: refresher,
        refreshInterval: queueTimeout,
      )..start(refreshImmediately: true);

      // ~0.9 secs lasts, refreshed 3 times
      await Future<void>.delayed(
        queueTimeout * 2 +
            refresherDelay * 3 +
            const Duration(milliseconds: 60),
      );
      queue.stop();
      verify(refresher.refresh).called(3);
    });

    test('Refresh when refresher takes more time when polling', () async {
      final refresher = RefresherImplementation();
      when(refresher.refresh).thenAnswer(
        (_) => Future<void>.delayed(const Duration(milliseconds: 500)),
      );

      RefreshPollingQueue(
        refresher: refresher,
        refreshInterval: queueTimeout,
      ).start();

      // ~1.2 secs lasts, refreshed 2 times
      await Future<void>.delayed(const Duration(milliseconds: 1200));
      verify(refresher.refresh).called(2);
    });

    test('Refresh stops if error', () async {
      final refresher = RefresherImplementation();
      final callback = RefreshCompleteCallback();

      when(refresher.refresh).thenThrow(Exception('ERROR'));
      when(() => callback.call(any(that: isNotNull))).thenReturn(null);

      RefreshPollingQueue(
        refresher: refresher,
        refreshInterval: queueTimeout,
        refreshCompleteCallback: callback.call,
      ).start();

      // ~0.7 secs lasts, refreshed 1 times with error
      await Future<void>.delayed(queueTimeout * 3.5);
      verify(refresher.refresh).called(1);
      verify(() => callback.call(any(that: isNotNull))).called(1);
    });

    test('Refresh not stops if error', () async {
      final refresher = RefresherImplementation();
      final callback = RefreshCompleteCallback();

      when(refresher.refresh).thenThrow(Exception('ERROR'));
      when(() => callback.call(any(that: isNotNull))).thenReturn(null);

      RefreshPollingQueue(
        refresher: refresher,
        refreshInterval: queueTimeout,
        stopPollingIfError: false,
        refreshCompleteCallback: callback.call,
      ).start();

      // ~0.7 secs lasts, refreshed 3 times with error
      await Future<void>.delayed(queueTimeout * 3.5);
      verify(() => callback.call(any(that: isNotNull))).called(3);
    });
  });
}
