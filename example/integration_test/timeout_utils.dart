import 'package:flutter_test/flutter_test.dart';

/// A utility class to extend [WidgetTester] with a timeout for [pumpAndSettle].
extension TesterTimeoutUtil on WidgetTester {
  Future<void> pumpAndSettleWithTimeout([
    Duration timeout = const Duration(milliseconds: 300),
  ]) async {
    await pumpAndSettle(
      timeout,
      EnginePhase.sendSemanticsUpdate,
      const Duration(minutes: 15),
    );
  }
}
