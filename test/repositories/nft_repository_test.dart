import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

class MockTransportStrategy extends Mock implements TransportStrategy {}

class MockAbiLoader extends Mock implements AbiLoader {}

class MockNftDataProvider extends Mock implements NftDataProvider {}

class MockTonWallet extends Mock implements TonWallet {}

class MockLatestLtTracker extends Mock implements LatestLtTracker {}

// Address is sealed and cannot be mocked, so use a helper function to create
// Address instances.
Address makeAddress([String value = '0:0']) => Address(address: value);

Nft makeNft({
  String id = 'id',
  Address? owner,
  Address? manager,
  Address? collection,
}) {
  final nftOwner = owner ?? makeAddress('0:owner');

  return Nft(
    address: makeAddress('0:nft$id'),
    info: NftInfo(
      id: id,
      owner: nftOwner,
      manager: manager ?? nftOwner,
      collection: collection ?? makeAddress('0:collection'),
    ),
    json: NftJsonData.empty(),
  );
}

class MockProtoTransport extends Mock implements ProtoTransport {}

class MockNftCollection extends Mock implements NftCollection {}

class MockNftItem extends Mock implements NftItem {}

class MockNftList extends Mock implements NftList {}

class TestNftRepository with NftRepositoryImpl {
  TestNftRepository({
    required this.currentTransport,
    required this.abiLoader,
    required this.nftDataProvider,
  });

  @override
  final TransportStrategy currentTransport;

  @override
  final AbiLoader abiLoader;

  @override
  final NftDataProvider nftDataProvider;
}

void main() {
  group('NftRepositoryImpl', () {
    late TestNftRepository repository;
    late MockTransportStrategy transport;
    late MockAbiLoader abiLoader;
    late MockNftDataProvider nftDataProvider;
    late MockProtoTransport protoTransport;

    setUp(() {
      transport = MockTransportStrategy();
      abiLoader = MockAbiLoader();
      nftDataProvider = MockNftDataProvider();
      protoTransport = MockProtoTransport();
      when(() => transport.transport).thenReturn(protoTransport);
      when(() => transport.nftApiBaseUrl).thenReturn(null);
      repository = TestNftRepository(
        currentTransport: transport,
        abiLoader: abiLoader,
        nftDataProvider: nftDataProvider,
      );
    });

    test('can be instantiated', () {
      expect(repository, isNotNull);
    });

    test('subscribeToWalletNftTransfers replaces existing subscription', () {
      final wallet = MockTonWallet();
      final tracker = MockLatestLtTracker();
      var cancelCount = 0;

      final messageSent =
          StreamController<(PendingTransaction, Transaction?)>.broadcast(
            onCancel: () => cancelCount++,
          );
      final stateChanged = StreamController<ContractState>.broadcast(
        onCancel: () => cancelCount++,
      );
      final messageExpired = StreamController<PendingTransaction>.broadcast(
        onCancel: () => cancelCount++,
      );
      final transactionsFound =
          StreamController<
            (
              List<TransactionWithData<TransactionAdditionalInfo?>>,
              TransactionsBatchInfo,
            )
          >.broadcast(onCancel: () => cancelCount++);

      addTearDown(() async {
        await messageSent.close();
        await stateChanged.close();
        await messageExpired.close();
        await transactionsFound.close();
      });

      when(() => wallet.address).thenReturn(makeAddress('0:wallet'));
      when(
        () => wallet.onMessageSentStream,
      ).thenAnswer((_) => messageSent.stream);
      when(
        () => wallet.onStateChangedStream,
      ).thenAnswer((_) => stateChanged.stream);
      when(
        () => wallet.onMessageExpiredStream,
      ).thenAnswer((_) => messageExpired.stream);
      when(
        () => wallet.onTransactionsFoundStream,
      ).thenAnswer((_) => transactionsFound.stream);

      repository
        ..subscribeToWalletNftTransfers(wallet: wallet, tracker: tracker)
        ..subscribeToWalletNftTransfers(wallet: wallet, tracker: tracker)
        ..unsubscribeFromWalletNftTransfers(wallet.address);

      expect(cancelCount, equals(8));
    });

    test(
      'scanNftCollections calls transport and returns collections',
      () async {
        final owner = makeAddress();
        final collection = makeAddress();
        final nftCollection = MockNftCollection();
        when(
          () => protoTransport.use<List<NftCollection>>(any()),
        ).thenAnswer((_) async => [nftCollection]);

        final result = await repository.scanNftCollections(
          owner: owner,
          collections: [collection],
        );

        expect(result, isA<List<NftCollection>>());
        expect(result.first, nftCollection);
      },
    );

    test(
      'scanNftCollections uses api provider and filters empty results',
      () async {
        when(() => transport.nftApiBaseUrl).thenReturn('https://api');

        final owner = makeAddress('0:owner');
        final collectionWithItems = makeAddress('0:collection1');
        final collectionEmpty = makeAddress('0:collection2');
        final nftCollection = MockNftCollection();

        when(
          () => nftDataProvider.getNftList(
            apiBaseUrl: any(named: 'apiBaseUrl'),
            collection: collectionWithItems,
            owner: owner,
            limit: 1,
            offset: any(named: 'offset'),
          ),
        ).thenAnswer((_) async => NftList(items: [MockNftItem()]));

        when(
          () => nftDataProvider.getNftList(
            apiBaseUrl: any(named: 'apiBaseUrl'),
            collection: collectionEmpty,
            owner: owner,
            limit: 1,
            offset: any(named: 'offset'),
          ),
        ).thenAnswer((_) async => const NftList(items: []));

        when(() => protoTransport.use<List<NftCollection>>(any())).thenAnswer((
          invocation,
        ) async {
          final callback =
              invocation.positionalArguments.first
                  as Future<List<NftCollection>> Function();

          return callback();
        });

        when(
          () => protoTransport.use<NftCollection>(any()),
        ).thenAnswer((_) async => nftCollection);

        final result = await repository.scanNftCollections(
          owner: owner,
          collections: [collectionWithItems, collectionEmpty],
        );

        expect(result, [nftCollection]);
        verify(
          () => nftDataProvider.getNftList(
            apiBaseUrl: 'https://api',
            collection: collectionWithItems,
            owner: owner,
            limit: 1,
          ),
        ).called(1);
        verify(() => protoTransport.use<NftCollection>(any())).called(1);
      },
    );

    test('scanNftCollections returns empty when transport throws', () async {
      final owner = makeAddress('0:owner');
      final collection = makeAddress('0:collection');

      when(() => protoTransport.use<List<NftCollection>>(any())).thenAnswer((
        invocation,
      ) async {
        final callback =
            invocation.positionalArguments.first
                as Future<List<NftCollection>> Function();

        return callback();
      });

      final result = await repository.scanNftCollections(
        owner: owner,
        collections: [collection],
      );

      expect(result, isEmpty);
    });

    test('tryGetNftCollection returns collection when owner matches', () async {
      final address = makeAddress('0:nft');
      final owner = makeAddress('0:owner');
      final nftCollection = MockNftCollection();
      final nftItem = NftItem(nft: makeNft(owner: owner));

      when(() => protoTransport.use<NftCollection?>(any())).thenAnswer((
        invocation,
      ) async {
        final callback =
            invocation.positionalArguments.first
                as Future<NftCollection?> Function();

        return callback();
      });

      when(
        () => protoTransport.use<NftItem>(any()),
      ).thenAnswer((_) async => nftItem);
      when(
        () => protoTransport.use<NftCollection>(any()),
      ).thenAnswer((_) async => nftCollection);

      final result = await repository.tryGetNftCollection(
        address: address,
        owner: owner,
      );

      expect(result, nftCollection);
    });

    test(
      'tryGetNftCollection returns null when owner differs and wallet absent',
      () async {
        final address = makeAddress('0:nft');
        final owner = makeAddress('0:owner');
        final foreignOwner = makeAddress('0:other');

        when(() => protoTransport.use<NftCollection?>(any())).thenAnswer((
          invocation,
        ) async {
          final callback =
              invocation.positionalArguments.first
                  as Future<NftCollection?> Function();

          return callback();
        });

        when(
          () => protoTransport.use<NftItem>(any()),
        ).thenAnswer((_) async => NftItem(nft: makeNft(owner: foreignOwner)));

        final result = await repository.tryGetNftCollection(
          address: address,
          owner: owner,
        );

        expect(result, isNull);
        verifyNever(() => protoTransport.use<NftCollection>(any()));
      },
    );

    test(
      'tryGetNftCollection falls back to address when getNftItem fails',
      () async {
        final address = makeAddress('0:nft');
        final owner = makeAddress('0:owner');
        final nftCollection = MockNftCollection();

        when(() => protoTransport.use<NftCollection?>(any())).thenAnswer((
          invocation,
        ) async {
          final callback =
              invocation.positionalArguments.first
                  as Future<NftCollection?> Function();

          return callback();
        });

        when(
          () => protoTransport.use<NftItem>(any()),
        ).thenThrow(Exception('failed'));
        when(
          () => protoTransport.use<NftCollection>(any()),
        ).thenAnswer((_) async => nftCollection);

        final result = await repository.tryGetNftCollection(
          address: address,
          owner: owner,
        );

        expect(result, nftCollection);
      },
    );

    test('getNftList uses api provider continuation as offset', () async {
      when(() => transport.nftApiBaseUrl).thenReturn('https://api');

      final collection = makeAddress('0:collection');
      final owner = makeAddress('0:owner');
      const continuation = '7';
      const limit = 5;
      final expectedList = NftList(items: [MockNftItem()]);

      when(
        () => nftDataProvider.getNftList(
          apiBaseUrl: any(named: 'apiBaseUrl'),
          collection: collection,
          owner: owner,
          limit: limit,
          offset: 7,
        ),
      ).thenAnswer((_) async => expectedList);

      final result = await repository.getNftList(
        collection: collection,
        owner: owner,
        limit: limit,
        continuation: continuation,
      );

      expect(result, expectedList);
      verify(
        () => nftDataProvider.getNftList(
          apiBaseUrl: 'https://api',
          collection: collection,
          owner: owner,
          limit: limit,
          offset: 7,
        ),
      ).called(1);
    });

    test('getMultitokenWallet returns null when transport throws', () async {
      when(
        () => protoTransport.use<MultitokenWallet>(any()),
      ).thenThrow(Exception('fail'));

      final result = await repository.getMultitokenWallet(
        makeAddress('0:wallet'),
      );

      expect(result, isNull);
    });

    test('prepareNftTransfer delegates to transport', () async {
      final address = makeAddress('0:nft');
      final owner = makeAddress('0:owner');
      final recipient = makeAddress('0:recipient');
      final sendGasTo = makeAddress('0:gas');
      final message = InternalMessage(
        source: owner,
        body: 'body',
        destination: address,
        amount: BigInt.one,
        bounce: true,
      );

      when(
        () => protoTransport.use<InternalMessage>(any()),
      ).thenAnswer((_) async => message);

      final result = await repository.prepareNftTransfer(
        address: address,
        owner: owner,
        recipient: recipient,
        sendGasTo: sendGasTo,
      );

      expect(result, message);
      verify(() => protoTransport.use<InternalMessage>(any())).called(1);
    });

    test('prepareNftTokenTransfer delegates to transport', () async {
      final collection = makeAddress('0:collection');
      final owner = makeAddress('0:owner');
      final recipient = makeAddress('0:recipient');
      final remainingGasTo = makeAddress('0:gas');
      final message = InternalMessage(
        source: owner,
        body: 'body',
        destination: collection,
        amount: BigInt.two,
        bounce: true,
      );

      when(
        () => protoTransport.use<InternalMessage>(any()),
      ).thenAnswer((_) async => message);

      final result = await repository.prepareNftTokenTransfer(
        id: '1',
        count: BigInt.one,
        collection: collection,
        owner: owner,
        recipient: recipient,
        remainingGasTo: remainingGasTo,
      );

      expect(result, message);
      verify(() => protoTransport.use<InternalMessage>(any())).called(1);
    });
    test('tryGetNftCollection returns null if not owner', () async {
      final address = makeAddress();
      final owner = makeAddress();
      when(
        () => protoTransport.use<NftCollection?>(any()),
      ).thenAnswer((_) async => null);

      final result = await repository.tryGetNftCollection(
        address: address,
        owner: owner,
      );

      expect(result, isNull);
    });

    test('getNftList returns NftList', () async {
      final collection = makeAddress();
      final owner = makeAddress();
      final nftList = MockNftList();
      when(
        () => protoTransport.use<NftList>(any()),
      ).thenAnswer((_) async => nftList);

      final result = await repository.getNftList(
        collection: collection,
        owner: owner,
        limit: 1,
      );

      expect(result, isA<NftList>());
    });

    test('getNftItem returns NftItem', () async {
      final address = makeAddress();
      final owner = makeAddress();
      final nftItem = MockNftItem();
      when(
        () => protoTransport.use<NftItem>(any()),
      ).thenAnswer((_) async => nftItem);

      final result = await repository.getNftItem(
        address: address,
        owner: owner,
      );

      expect(result, isA<NftItem>());
    });

    test('getNftCollection returns NftCollection', () async {
      final address = makeAddress();
      final nftCollection = MockNftCollection();
      when(
        () => protoTransport.use<NftCollection>(any()),
      ).thenAnswer((_) async => nftCollection);

      final result = await repository.getNftCollection(address);

      expect(result, isA<NftCollection>());
    });
  });
}
