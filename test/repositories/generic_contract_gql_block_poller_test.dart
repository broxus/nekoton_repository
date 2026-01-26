import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nekoton_repository/nekoton_repository.dart';
import 'package:nekoton_repository/src/repositories/generic_contract_repository/contract_gql_block_poller.dart';
import 'package:nekoton_repository/src/repositories/ton_wallet_repository/ton_wallet_gql_block_poller.dart';

class _MockGenericContract extends Mock implements GenericContract {}

class _MockGqlTransport extends Mock implements GqlTransport {}

class _FakeLatestBlock extends Fake implements LatestBlock {
  _FakeLatestBlock(this.id);

  @override
  final String id;
}

void main() {
  late _MockGenericContract contract;
  late _MockGqlTransport transport;
  late GenericContractGqlBlockPoller poller;

  const address = Address(address: '0:generic-contract');

  setUpAll(() {
    registerFallbackValue(address);
    registerFallbackValue('');
  });

  setUp(() {
    contract = _MockGenericContract();
    transport = _MockGqlTransport();
    poller = GenericContractGqlBlockPoller(
      contract: contract,
      transport: transport,
    );

    when(() => contract.address).thenReturn(address);
  });

  group('GenericContractGqlBlockPoller', () {
    test('refresh fetches latest block and processes next one', () async {
      // Arrange
      final latestBlock = _FakeLatestBlock('latest');

      const nextBlockId = 'next';
      const blockData = 'block-data';

      when(
        () => transport.getLatestBlock(address: address),
      ).thenAnswer((_) async => latestBlock);
      when(
        () => transport.waitForNextBlock(
          currentBlockId: latestBlock.id,
          address: address,
          timeout: nextBlockTimeout,
        ),
      ).thenAnswer((_) async => nextBlockId);
      when(
        () => transport.getBlock(id: nextBlockId),
      ).thenAnswer((_) async => blockData);
      when(
        () => contract.handleBlock(block: blockData),
      ).thenAnswer((_) async {});

      // Act
      await poller.refresh();

      // Assert
      expect(poller.currentBlockId, nextBlockId);
      verify(() => transport.getLatestBlock(address: address)).called(1);
      verify(
        () => transport.waitForNextBlock(
          currentBlockId: latestBlock.id,
          address: address,
          timeout: nextBlockTimeout,
        ),
      ).called(1);
      verify(() => transport.getBlock(id: nextBlockId)).called(1);
      verify(() => contract.handleBlock(block: blockData)).called(1);
    });

    test('refresh uses existing block id without requesting latest', () async {
      // Arrange
      poller.currentBlockId = 'existing';
      const nextBlockId = 'next';
      const blockData = 'block-data';

      when(
        () => transport.waitForNextBlock(
          currentBlockId: poller.currentBlockId!,
          address: address,
          timeout: nextBlockTimeout,
        ),
      ).thenAnswer((_) async => nextBlockId);
      when(
        () => transport.getBlock(id: nextBlockId),
      ).thenAnswer((_) async => blockData);
      when(
        () => contract.handleBlock(block: blockData),
      ).thenAnswer((_) async {});

      // Act
      await poller.refresh();

      // Assert
      expect(poller.currentBlockId, nextBlockId);
      verifyNever(
        () => transport.getLatestBlock(address: any(named: 'address')),
      );
      verify(
        () => transport.waitForNextBlock(
          currentBlockId: 'existing',
          address: address,
          timeout: nextBlockTimeout,
        ),
      ).called(1);
    });

    test('refresh propagates getBlock errors without updating id', () async {
      // Arrange
      poller.currentBlockId = 'existing';
      final failure = Exception('get block failure');

      when(
        () => transport.waitForNextBlock(
          currentBlockId: poller.currentBlockId!,
          address: address,
          timeout: nextBlockTimeout,
        ),
      ).thenAnswer((_) async => 'next');
      when(() => transport.getBlock(id: 'next')).thenThrow(failure);

      // Act & Assert
      expect(poller.refresh, throwsA(failure));
      expect(poller.currentBlockId, 'existing');
    });

    test('refresh does not update current id when handleBlock fails', () async {
      // Arrange
      poller.currentBlockId = 'latest';

      const nextBlockId = 'next';
      const blockData = 'block-data';
      final failure = Exception('handle block failure');

      when(
        () => transport.waitForNextBlock(
          currentBlockId: poller.currentBlockId!,
          address: address,
          timeout: nextBlockTimeout,
        ),
      ).thenAnswer((_) async => nextBlockId);
      when(
        () => transport.getBlock(id: nextBlockId),
      ).thenAnswer((_) async => blockData);
      when(() => contract.handleBlock(block: blockData)).thenThrow(failure);

      // Act & Assert
      expect(poller.refresh, throwsA(failure));
      expect(poller.currentBlockId, 'latest');
      verifyNever(
        () => transport.getLatestBlock(address: any(named: 'address')),
      );
    });

    test('refreshDescription contains contract address', () {
      // Arrange & Act & Assert
      expect(
        poller.refreshDescription,
        'GenericContract ${address.address} GQL block poller',
      );
    });
  });
}
