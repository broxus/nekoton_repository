import 'package:async/async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nekoton_repository/src/utils/utils.dart';

class FutureOperation {
  Future<void> call() async {}
}

class MockFunction extends Mock implements FutureOperation {}

void main() {
  group('CancelableOperation', () {
    test('Complete operation itself', () async {
      final function = MockFunction();
      when(
        function.call,
      ).thenAnswer((_) => Future.delayed(const Duration(seconds: 1)));

      final start = NtpTime.now();
      final operation = CancelableOperation<void>.fromFuture(function.call());

      await operation.valueOrCancellation();
      final end = NtpTime.now();

      expect(end.difference(start).inSeconds, 1);
      verify(function.call).called(1);
    });

    test('Complete operation by stop call', () async {
      final function = MockFunction();
      when(
        function.call,
      ).thenAnswer((_) => Future.delayed(const Duration(seconds: 1)));

      late CancelableOperation<void> operation;
      operation = CancelableOperation<void>.fromFuture(() async {
        for (var i = 0; i < 5; i++) {
          await function.call();
          if (operation.isCanceled) return;
        }
      }());

      final fut = operation.valueOrCancellation();

      await Future<void>.delayed(const Duration(seconds: 2));

      await operation.cancel();
      await fut;

      verify(function.call).called(2);
    });

    test('Complete operation with error', () async {
      final function = MockFunction();
      when(
        function.call,
      ).thenAnswer((_) => Future.delayed(const Duration(seconds: 1)));

      late CancelableOperation<void> operation;
      operation = CancelableOperation<void>.fromFuture(() async {
        for (var i = 0; i < 5; i++) {
          await function.call();
          if (i == 1) throw Exception();
        }
      }());

      await expectLater(operation.valueOrCancellation(), throwsException);

      verify(function.call).called(2);
    });
  });
}
