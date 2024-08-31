import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

class TransportRepositoryTest with TransportRepositoryImpl {}

class MockTransport extends Mock implements TransportStrategy {}

void main() {
  late TransportRepositoryTest transportRepository;
  late MockTransport transport;

  const ticker = 'Ticker';
  const decimals = 9;

  setUp(() {
    transport = MockTransport();
    transportRepository = TransportRepositoryTest();
  });

  group('TransportRepositoryImpl', () {
    test('updateTransport', () async {
      when(() => transport.nativeTokenTicker).thenReturn(ticker);
      when(() => transport.defaultNativeCurrencyDecimal).thenReturn(decimals);

      await transportRepository.updateTransport(transport);

      final cur = Currencies()[ticker];
      expect(cur, isNotNull);
      expect(cur!.symbol, ticker);
      expect(cur.isoCode, ticker);
      expect(cur.decimalDigits, decimals);
      expect(cur.pattern, '0.${'#' * decimals}');
    });
  });
}
