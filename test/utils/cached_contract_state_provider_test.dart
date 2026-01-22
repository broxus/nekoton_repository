import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

class _MockTransport extends Mock implements Transport {}

FullContractState _state(String boc) => FullContractState(
  balance: BigInt.one,
  genTimings: const GenTimings(genLt: 'lt', genUtime: 1),
  isDeployed: true,
  boc: boc,
);

void main() {
  group('CachedContractStateProvider', () {
    late CachedContractStateProvider provider;
    late _MockTransport transport;

    const address = Address(address: '0:address');

    setUpAll(() {
      registerFallbackValue(const Address(address: '0:fallback'));
    });

    setUp(() {
      transport = _MockTransport();
      provider = CachedContractStateProvider();

      when(() => transport.networkId).thenReturn(1);
    });

    test('returns cached state while entry is not expired', () async {
      final state = _state('1');
      when(
        () => transport.getFullContractState(address),
      ).thenAnswer((_) async => state);

      // Act
      final first = await provider.get(address: address, transport: transport);
      final second = await provider.get(address: address, transport: transport);

      // Assert
      expect(first, same(state));
      expect(second, same(state));
      verify(() => transport.getFullContractState(address)).called(1);
    });

    test('refreshes state when cache entry has expired', () async {
      provider = CachedContractStateProvider(
        expiration: const Duration(milliseconds: 10),
      );
      when(() => transport.networkId).thenReturn(1);

      final firstState = _state('1');
      final secondState = _state('2');
      final states = <FullContractState>[firstState, secondState];

      when(
        () => transport.getFullContractState(address),
      ).thenAnswer((_) async => states.removeAt(0));

      // Act
      final first = await provider.get(address: address, transport: transport);
      await Future<void>.delayed(const Duration(milliseconds: 15));
      final second = await provider.get(address: address, transport: transport);

      // Assert
      expect(first, same(firstState));
      expect(second, same(secondState));
      verify(() => transport.getFullContractState(address)).called(2);
    });

    test('clears cache when network id changes', () async {
      final firstState = _state('1');
      final secondState = _state('2');
      final states = <FullContractState>[firstState, secondState];
      final networkIds = <int>[1, 1, 2, 2];
      when(() => transport.networkId).thenAnswer((_) => networkIds.removeAt(0));
      when(
        () => transport.getFullContractState(address),
      ).thenAnswer((_) async => states.removeAt(0));

      // Act
      final first = await provider.get(address: address, transport: transport);
      final second = await provider.get(address: address, transport: transport);

      // Assert
      expect(first, same(firstState));
      expect(second, same(secondState));
      verify(() => transport.getFullContractState(address)).called(2);
    });

    test('remove evicts cached entry', () async {
      final firstState = _state('1');
      final secondState = _state('2');
      final states = <FullContractState>[firstState, secondState];
      when(
        () => transport.getFullContractState(address),
      ).thenAnswer((_) async => states.removeAt(0));

      // Act
      final first = await provider.get(address: address, transport: transport);
      provider.remove(address);
      final second = await provider.get(address: address, transport: transport);

      // Assert
      expect(first, same(firstState));
      expect(second, same(secondState));
      verify(() => transport.getFullContractState(address)).called(2);
    });

    test('clear removes all cached entries', () async {
      const anotherAddress = Address(address: '0:another');
      final firstState = _state('1');
      final secondState = _state('2');
      final thirdState = _state('3');
      final states = <FullContractState>[firstState, secondState, thirdState];
      when(
        () => transport.getFullContractState(any()),
      ).thenAnswer((_) async => states.removeAt(0));

      // Act
      await provider.get(address: address, transport: transport);
      await provider.get(address: anotherAddress, transport: transport);
      provider.clear();
      await provider.get(address: address, transport: transport);

      // Assert
      verify(() => transport.getFullContractState(address)).called(2);
      verify(() => transport.getFullContractState(anotherAddress)).called(1);
    });

    test('throws when contract does not exist', () async {
      when(
        () => transport.getFullContractState(address),
      ).thenAnswer((_) async => null);

      // Act & Assert
      expect(
        () => provider.get(address: address, transport: transport),
        throwsA(isA<ContractNotExistsException>()),
      );
      verify(() => transport.getFullContractState(address)).called(1);
    });
  });
}
