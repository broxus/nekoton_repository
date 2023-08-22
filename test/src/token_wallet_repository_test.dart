import 'dart:async';
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nekoton_repository/nekoton_repository.dart' hide Symbol;
import 'package:nekoton_repository/nekoton_repository.dart' as nek show Symbol;
import 'package:tuple/tuple.dart';

class MockBridge extends Mock implements NekotonBridge {}

class MockTransport extends Mock implements TransportStrategy {}

class MockWalletStorage extends Mock
    implements TokenWalletTransactionsStorage {}

class MockWallet extends Mock implements TokenWallet {}

class MockJrpcTransport extends Mock implements JrpcTransport {}

class TokenWalletRepoTest with TokenWalletRepositoryImpl {
  TokenWalletRepoTest(
    this.currentTransport,
    this.tokenWalletStorage,
  );

  @override
  final MockTransport currentTransport;

  @override
  final MockWalletStorage tokenWalletStorage;
}

void main() {
  late MockTransport transport;
  late MockWalletStorage storage;
  late MockWallet wallet;
  late MockJrpcTransport jrpc;

  late TokenWalletRepoTest repository;

  late Stream<BigInt> balanceStream;
  late Stream<
      Tuple2<List<TransactionWithData<TokenWalletTransaction?>>,
          TransactionsBatchInfo>> transactionsFoundStream;

  const owner = Address(address: '0:1111111111111');

  const root1 = Address(address: '0:root1');
  const root2 = Address(address: '0:root2');

  const tokenAddress = Address(address: '0:tokenAddress');

  const transportGroup = 'jrpc';
  const asset1 = TokenWalletAsset(rootTokenContract: root1);
  const asset2 = TokenWalletAsset(rootTokenContract: root2);
  const assetsSingle = AssetsList(
    name: '',
    tonWallet: TonWalletAsset(
      address: owner,
      publicKey: PublicKey(publicKey: ''),
      contract: WalletType.everWallet(),
    ),
    additionalAssets: {
      transportGroup: AdditionalAssets(depools: [], tokenWallets: [asset1]),
    },
  );
  const assetsBoth = AssetsList(
    name: '',
    tonWallet: TonWalletAsset(
      address: owner,
      publicKey: PublicKey(publicKey: ''),
      contract: WalletType.everWallet(),
    ),
    additionalAssets: {
      transportGroup: AdditionalAssets(
        depools: [],
        tokenWallets: [asset1, asset2],
      ),
    },
  );

  final contract = ContractState(
    balance: BigInt.zero,
    genTimings: const GenTimings(genLt: '', genUtime: 0),
    isDeployed: true,
  );
  const symbol1 = nek.Symbol(
    rootTokenContract: root1,
    name: 'TEST1',
    decimals: 1,
    fullName: '',
  );
  const symbol2 = nek.Symbol(
    rootTokenContract: root2,
    name: 'TEST2',
    decimals: 1,
    fullName: '',
  );
  const version = TokenWalletVersion.tip3;

  late TokenWalletDartWrapper tokenWrapper1;
  late TokenWalletDartWrapper tokenWrapper2;
  late ArcTokenWalletBoxTrait walletBoxTrait;

  late MockBridge bridge;
  late ArcTransportBoxTrait box;

  setUp(() {
    transport = MockTransport();
    storage = MockWalletStorage();
    wallet = MockWallet();
    repository = TokenWalletRepoTest(transport, storage);
    jrpc = MockJrpcTransport();

    bridge = MockBridge();
    box = ArcTransportBoxTrait.fromRaw(0, 0, bridge);
    registerFallbackValue(box);

    walletBoxTrait = ArcTokenWalletBoxTrait.fromRaw(0, 0, bridge);
    tokenWrapper1 = TokenWalletDartWrapper(
      bridge: bridge,
      innerWallet: walletBoxTrait,
    );
    tokenWrapper2 = TokenWalletDartWrapper(
      bridge: bridge,
      innerWallet: walletBoxTrait,
    );
    registerFallbackValue(walletBoxTrait);
    registerFallbackValue(tokenWrapper1);
    registerFallbackValue(tokenWrapper2);

    balanceStream = const Stream.empty();
    transactionsFoundStream = const Stream.empty();
  });

  group('TonWalletRepository', () {
    test('addWallet', () {
      when(() => wallet.onBalanceChangedStream)
          .thenAnswer((_) => balanceStream);
      when(() => wallet.onTransactionsFoundStream)
          .thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.owner).thenReturn(owner);
      when(() => wallet.rootTokenContract).thenReturn(root1);

      repository.addTokenWalletInst(wallet);

      expect(repository.tokenWalletsMap[(owner, root1)], wallet);
      expect(repository.tokenWalletSubscriptions[(owner, root1)], isNotNull);

      verify(() => wallet.onBalanceChangedStream).called(1);
      verify(() => wallet.onTransactionsFoundStream).called(1);
    });

    test('removeWallet', () {
      when(() => wallet.onBalanceChangedStream)
          .thenAnswer((_) => balanceStream);
      when(() => wallet.onTransactionsFoundStream)
          .thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.owner).thenReturn(owner);
      when(() => wallet.rootTokenContract).thenReturn(root1);

      repository
        ..addTokenWalletInst(wallet)
        ..removeTokenWalletInst(owner, root1);

      expect(repository.tokenWalletsMap[(owner, root1)], isNull);
      expect(repository.tokenWalletSubscriptions[(owner, root1)], isNull);
    });

    test('unsubscribe', () {
      when(() => wallet.onBalanceChangedStream)
          .thenAnswer((_) => balanceStream);
      when(() => wallet.onTransactionsFoundStream)
          .thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.owner).thenReturn(owner);
      when(() => wallet.rootTokenContract).thenReturn(root1);
      when(wallet.dispose).thenReturn(null);
      when(wallet.refresh).thenAnswer((_) => Future<void>.value());
      when(() => wallet.refreshDescription).thenReturn('');

      final poller = RefreshPollingQueue(
        refresher: wallet,
        refreshInterval: tokenWalletRefreshInterval,
      )..startPolling();

      repository.tokenPollingQueues[(owner, root1)] = poller;

      repository
        ..addTokenWalletInst(wallet)
        ..unsubscribeToken(owner, root1);

      expect(repository.tokenWalletsMap[(owner, root1)], isNull);
      expect(repository.tokenWalletSubscriptions[(owner, root1)], isNull);
      expect(repository.tokenPollingQueues[(owner, root1)], isNull);
      expect(poller.isPolling, isFalse);

      verify(wallet.dispose).called(1);
    });

    test('stopPolling', () {
      when(() => wallet.onBalanceChangedStream)
          .thenAnswer((_) => balanceStream);
      when(() => wallet.onTransactionsFoundStream)
          .thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.owner).thenReturn(owner);
      when(() => wallet.rootTokenContract).thenReturn(root1);
      when(wallet.refresh).thenAnswer((_) => Future<void>.value());
      when(() => wallet.refreshDescription).thenReturn('');

      final poller1 = RefreshPollingQueue(
        refresher: wallet,
        refreshInterval: tokenWalletRefreshInterval,
      )..startPolling();
      final poller2 = RefreshPollingQueue(
        refresher: wallet,
        refreshInterval: tokenWalletRefreshInterval,
      )..startPolling();

      repository.tokenPollingQueues[(owner, root1)] = poller1;
      repository.tokenPollingQueues[(owner, root2)] = poller2;

      repository
        ..addTokenWalletInst(wallet)
        ..stopPollingToken();

      expect(repository.tokenPollingQueues[(owner, root1)], isNull);
      expect(repository.tokenPollingQueues[(owner, root2)], isNull);
      expect(poller1.isPolling, isFalse);
      expect(poller2.isPolling, isFalse);
    });

    test('startPolling with clearing previous', () {
      when(() => wallet.onBalanceChangedStream)
          .thenAnswer((_) => balanceStream);
      when(() => wallet.onTransactionsFoundStream)
          .thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.owner).thenReturn(owner);
      when(() => wallet.rootTokenContract).thenReturn(root1);

      when(wallet.refresh).thenAnswer((_) => Future<void>.value());
      when(() => wallet.refreshDescription).thenReturn('');

      final oldPoller = RefreshPollingQueue(
        refresher: wallet,
        refreshInterval: tonWalletRefreshInterval,
      )..startPolling();

      repository.tokenPollingQueues[(owner, root2)] = oldPoller;

      repository
        ..addTokenWalletInst(wallet)
        ..startPollingToken(owner, root1);

      expect(repository.tokenPollingQueues[(owner, root1)], isNotNull);
      expect(repository.tokenPollingQueues[(owner, root1)]!.isPolling, isTrue);
      expect(repository.tokenPollingQueues[(owner, root2)], isNull);
      expect(oldPoller.isPolling, false);
    });

    test('startPolling without clearing previous', () {
      when(() => wallet.onBalanceChangedStream)
          .thenAnswer((_) => balanceStream);
      when(() => wallet.onTransactionsFoundStream)
          .thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.owner).thenReturn(owner);
      when(() => wallet.rootTokenContract).thenReturn(root1);

      final oldPoller = RefreshPollingQueue(
        refresher: wallet,
        refreshInterval: tonWalletRefreshInterval,
      )..startPolling();

      repository.tokenPollingQueues[(owner, root2)] = oldPoller;

      repository
        ..addTokenWalletInst(wallet)
        ..startPollingToken(owner, root1, stopPrevious: false);

      expect(repository.tokenPollingQueues[(owner, root1)], isNotNull);
      expect(repository.tokenPollingQueues[(owner, root1)]!.isPolling, isTrue);
      expect(repository.tokenPollingQueues[(owner, root2)], isNotNull);
      expect(oldPoller.isPolling, true);
    });
  });

  void mockTokenWallet(
    TokenWalletDartWrapper box,
    TokenWalletAsset asset,
    nek.Symbol symbol,
  ) {
    when(() => box.address())
        .thenAnswer((_) => Future.value(tokenAddress.address));
    when(() => box.owner()).thenAnswer((_) => Future.value(owner.address));
    when(() => box.owner()).thenAnswer((_) => Future.value(owner.address));
    when(() => box.symbol()).thenAnswer(
      (_) => Future.value(jsonEncode(symbol.toJson())),
    );
    when(() => box.version()).thenAnswer(
      (_) => Future.value(jsonEncode(version.toString())),
    );
    when(() => box.balance()).thenAnswer((_) => Future.value('100000000'));
    when(() => box.contractState()).thenAnswer(
      (_) => Future.value(jsonEncode(contract.toJson())),
    );
  }

  group('TokenWalletRepository', () {
    test('updateTokenSubscriptions without side effects', () async {
      mockWrapper(bridge);
      when(() => wallet.onBalanceChangedStream)
          .thenAnswer((_) => balanceStream);
      when(() => wallet.onTransactionsFoundStream)
          .thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.owner).thenReturn(owner);
      when(() => wallet.rootTokenContract).thenReturn(root1);

      when(() => transport.transport).thenReturn(jrpc);
      when(() => jrpc.transportBox).thenReturn(box);
      when(() => jrpc.group).thenReturn(transportGroup);

      when(
        () => bridge.subscribeStaticMethodTokenWalletDartWrapper(
          instanceHash: any(named: 'instanceHash'),
          transport: any(named: 'transport'),
          rootTokenContract: any(named: 'rootTokenContract'),
          owner: any(named: 'owner'),
        ),
      ).thenAnswer((call) {
        if (call.namedArguments[const Symbol('rootTokenContract')] ==
            root1.address) {
          return Future.value(tokenWrapper1);
        }
        return Future.value(tokenWrapper2);
      });
      mockTokenWallet(tokenWrapper1, asset1, symbol1);
      mockTokenWallet(tokenWrapper2, asset2, symbol2);

      await repository.updateTokenSubscriptions([assetsBoth]);

      expect(repository.tokenWallets.length, 2);

      expect(Currencies()[symbol1.name], isNotNull);
      expect(Currencies()[symbol2.name], isNotNull);
    });

    test('updateTokenSubscriptions with expanding assets list', () async {
      mockWrapper(bridge);
      when(() => wallet.onBalanceChangedStream)
          .thenAnswer((_) => balanceStream);
      when(() => wallet.onTransactionsFoundStream)
          .thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.owner).thenReturn(owner);
      when(() => wallet.rootTokenContract).thenReturn(root1);

      when(() => transport.transport).thenReturn(jrpc);
      when(() => jrpc.transportBox).thenReturn(box);
      when(() => jrpc.group).thenReturn(transportGroup);

      when(
        () => bridge.subscribeStaticMethodTokenWalletDartWrapper(
          instanceHash: any(named: 'instanceHash'),
          transport: any(named: 'transport'),
          rootTokenContract: any(named: 'rootTokenContract'),
          owner: any(named: 'owner'),
        ),
      ).thenAnswer((call) {
        if (call.namedArguments[const Symbol('rootTokenContract')] ==
            root1.address) {
          return Future.value(tokenWrapper1);
        }
        return Future.value(tokenWrapper2);
      });
      mockTokenWallet(tokenWrapper1, asset1, symbol1);
      mockTokenWallet(tokenWrapper2, asset2, symbol2);

      unawaited(repository.updateTokenSubscriptions([assetsSingle]));
      await Future<void>.delayed(const Duration(milliseconds: 300));
      await repository.updateTokenSubscriptions([assetsBoth]);

      expect(repository.tokenWallets.length, 2);
      verify(
        () => bridge.subscribeStaticMethodTokenWalletDartWrapper(
          instanceHash: any(named: 'instanceHash'),
          transport: any(named: 'transport'),
          rootTokenContract: root1.address,
          owner: any(named: 'owner'),
        ),
      ).called(1);
      verify(
        () => bridge.subscribeStaticMethodTokenWalletDartWrapper(
          instanceHash: any(named: 'instanceHash'),
          transport: any(named: 'transport'),
          rootTokenContract: root2.address,
          owner: any(named: 'owner'),
        ),
      ).called(1);
      expect(Currencies()[symbol1.name], isNotNull);
      expect(Currencies()[symbol2.name], isNotNull);
    });

    test('updateTokenTransportSubscriptions without side effects', () async {
      mockWrapper(bridge);
      when(() => wallet.onBalanceChangedStream)
          .thenAnswer((_) => balanceStream);
      when(() => wallet.onTransactionsFoundStream)
          .thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.owner).thenReturn(owner);
      when(() => wallet.rootTokenContract).thenReturn(root1);

      when(() => transport.transport).thenReturn(jrpc);
      when(() => jrpc.transportBox).thenReturn(box);
      when(() => jrpc.group).thenReturn(transportGroup);

      when(
        () => bridge.subscribeStaticMethodTokenWalletDartWrapper(
          instanceHash: any(named: 'instanceHash'),
          transport: any(named: 'transport'),
          rootTokenContract: any(named: 'rootTokenContract'),
          owner: any(named: 'owner'),
        ),
      ).thenAnswer((call) {
        if (call.namedArguments[const Symbol('rootTokenContract')] ==
            root1.address) {
          return Future.value(tokenWrapper1);
        }
        return Future.value(tokenWrapper2);
      });
      mockTokenWallet(tokenWrapper1, asset1, symbol1);
      mockTokenWallet(tokenWrapper2, asset2, symbol2);

      repository.tokenWalletsMap[(owner, root1)] = wallet;
      repository.tokenWalletsMap[(owner, root2)] = wallet;
      repository
        ..lastUpdatedNetworkGroup = transportGroup
        ..lastUpdatedTokenAssets = [assetsBoth];

      await repository.updateTokenTransportSubscriptions();

      verify(wallet.dispose).called(2);
      expect(repository.tokenWallets.length, 2);
      expect(Currencies()[symbol1.name], isNotNull);
      expect(Currencies()[symbol2.name], isNotNull);
    });
  });
}
