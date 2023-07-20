import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

class FutureOperation {
  Future<void> call() async {}
}

class MockFunction extends Mock implements FutureOperation {}

void main() {
  group('CancellableLongOperation', () {
    test('Complete operation itself', () async {
      final function = MockFunction();
      when(function.call).thenAnswer(
        (_) => Future.delayed(const Duration(seconds: 1)),
      );

      final start = DateTime.now();
      final operation = CancellableLongOperation<void>(function.call);

      await operation.resultFuture;
      final end = DateTime.now();

      expect(end.difference(start).inSeconds, 1);
      verify(function.call).called(1);
    });

    test('Complete operation by stop call', () async {
      final function = MockFunction();
      when(function.call).thenAnswer(
        (_) => Future.delayed(const Duration(seconds: 1)),
      );

      late CancellableLongOperation<void> operation;
      operation = CancellableLongOperation<void>(() async {
        for (var i = 0; i < 5; i++) {
          await function.call();
          if (operation.isStopped) return;
        }
      });

      final fut = operation.resultFuture;

      await Future<void>.delayed(const Duration(seconds: 2));

      operation.stop();
      await fut;

      verify(function.call).called(2);
    });

    test('Complete operation with error', () async {
      final function = MockFunction();
      when(function.call).thenAnswer(
        (_) => Future.delayed(const Duration(seconds: 1)),
      );

      late CancellableLongOperation<void> operation;
      operation = CancellableLongOperation<void>(() async {
        for (var i = 0; i < 5; i++) {
          await function.call();
          if (i == 1) throw Exception();
        }
      });

      await expectLater(operation.resultFuture, throwsException);

      verify(function.call).called(2);
    });
  });
}
