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
      repository = TestNftRepository(
        currentTransport: transport,
        abiLoader: abiLoader,
        nftDataProvider: nftDataProvider,
      );
    });

    test('can be instantiated', () {
      expect(repository, isNotNull);
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
