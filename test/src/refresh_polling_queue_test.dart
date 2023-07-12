import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

class _CallbackStub {
  void call([
    (Object error, StackTrace trace)? error,
  ]) {}
}

class RefresherImplementation extends Mock implements RefreshingInterface {
  @override
  String get refreshDescription => 'RefresherImplementation';
}

class RefreshCompleteCallback extends Mock implements _CallbackStub {}

void main() {
  const queueTimeout = Duration(seconds: 2);
  const refresherDelay = Duration(seconds: 1);

  /// We must use this method except of thenThrow because it will broke
  /// awaiting of refresh method. THIS IS SOME BUG IDK HOW TO FIX IT
  Future<void> throwError() async {
    throw Exception('ERROR');
  }

  group('RefreshPollingQueue', () {
    test('Request refresh by runSingleRefresh', () async {
      final refresher = RefresherImplementation();
      final callback = RefreshCompleteCallback();

      when(refresher.refresh).thenAnswer(
        (_) => Future<void>.delayed(refresherDelay),
      );
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
      when(refresher.refresh).thenAnswer(
        (_) => Future<void>.delayed(refresherDelay),
      );
      when(callback.call).thenReturn(null);

      RefreshPollingQueue(
        refresher: refresher,
        refreshInterval: queueTimeout,
        refreshCompleteCallback: callback.call,
      ).startPolling();

      // 7.2 secs lasts, refreshed 3 times
      await Future<void>.delayed(queueTimeout * 3.6);
      verify(refresher.refresh).called(3);
      verify(callback.call).called(3);
    });

    test('Request refresh by polling with refreshImmediately=true', () async {
      final refresher = RefresherImplementation();
      when(refresher.refresh).thenAnswer(
        (_) => Future<void>.delayed(refresherDelay),
      );

      RefreshPollingQueue(
        refresher: refresher,
        refreshInterval: queueTimeout,
      ).startPolling(refreshImmediately: true);

      // 7 secs lasts, refreshed 4 times
      await Future<void>.delayed(queueTimeout * 3.5);
      verify(refresher.refresh).called(4);
    });

    test('Refresh when refresher takes more time when polling', () async {
      final refresher = RefresherImplementation();
      when(refresher.refresh).thenAnswer(
        (_) => Future<void>.delayed(const Duration(seconds: 5)),
      );

      RefreshPollingQueue(
        refresher: refresher,
        refreshInterval: queueTimeout,
      ).startPolling();

      // 7 secs lasts, refreshed 2 times
      await Future<void>.delayed(const Duration(seconds: 11));
      verify(refresher.refresh).called(2);
    });

    test('Refresh stops if error', () async {
      final refresher = RefresherImplementation();
      final callback = RefreshCompleteCallback();

      when(refresher.refresh).thenAnswer((_) => throwError());
      when(() => callback.call(any(that: isNotNull))).thenReturn(null);

      RefreshPollingQueue(
        refresher: refresher,
        refreshInterval: queueTimeout,
        refreshCompleteCallback: callback.call,
      ).startPolling();

      // 7 secs lasts, refreshed 1 times with error
      await Future<void>.delayed(queueTimeout * 3.5);
      verify(refresher.refresh).called(1);
      verify(() => callback.call(any(that: isNotNull))).called(1);
    });

    test('Refresh not stops if error', () async {
      final refresher = RefresherImplementation();
      final callback = RefreshCompleteCallback();

      when(refresher.refresh).thenAnswer((_) => throwError());
      when(() => callback.call(any(that: isNotNull))).thenReturn(null);

      RefreshPollingQueue(
        refresher: refresher,
        refreshInterval: queueTimeout,
        stopPollingIfError: false,
        refreshCompleteCallback: callback.call,
      ).startPolling();

      // 7 secs lasts, refreshed 3 times with error
      await Future<void>.delayed(queueTimeout * 3.5);
      verify(() => callback.call(any(that: isNotNull))).called(3);
    });
  });
}
