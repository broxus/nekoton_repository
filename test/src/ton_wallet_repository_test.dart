import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nekoton_repository/nekoton_repository.dart' hide Symbol;
import 'package:nekoton_repository/src/repositories/ton_wallet_repository/ton_wallet_gql_block_poller.dart';
import 'package:nekoton_repository/src/utils/utils.dart';

class MockTokenRepository extends Mock implements TokenWalletRepository {}

class MockBridge extends Mock implements NekotonBridgeApi {}

class MockTransport extends Mock implements TransportStrategy {
  @override
  PollingConfig get pollingConfig => PollingConfig.defaultConfig;
}

class MockKeystore extends Mock implements KeyStore {}

class MockWalletStorage extends Mock implements TonWalletTransactionsStorage {}

class MockWallet extends Mock implements TonWallet {}

class MockArcTransportBoxTrait extends Mock implements ArcTransportBoxTrait {}

class MockArcTonWalletBoxTrait extends Mock implements ArcTonWalletBoxTrait {}

class MockTonWalletDartWrapper extends Mock implements TonWalletDartWrapper {}

class MockUnsignedMessage extends Mock implements UnsignedMessage {}

class MockGqlTransport extends Mock implements GqlTransport {
  @override
  Future<T> use<T>(Future<T> Function() fn) => fn();
}

class MockProtoTransport extends Mock implements ProtoTransport {
  @override
  Future<T> use<T>(Future<T> Function() fn) => fn();
}

class MockJrpcTransport extends Mock implements ProtoTransport {
  @override
  Future<T> use<T>(Future<T> Function() fn) => fn();
}

class TonWalletRepoTest with TonWalletRepositoryImpl {
  TonWalletRepoTest(
    this.currentTransport,
    this.keyStore,
    this.tonWalletStorage,
  );

  @override
  final MockTransport currentTransport;

  @override
  final MockKeystore keyStore;

  @override
  final MockWalletStorage tonWalletStorage;
}

void main() {
  late MockKeystore keystore;
  late MockTransport transport;
  late MockWalletStorage storage;
  late MockWallet wallet;
  late MockGqlTransport gql;
  late MockProtoTransport proto;
  late MockJrpcTransport jrpc;

  late TonWalletRepoTest repository;
  late MockTokenRepository tokenRepository;

  late Stream<(PendingTransaction, Transaction?)> messageSentStream;
  late Stream<PendingTransaction> expiredStream;
  late Stream<ContractState> stateStream;
  late Stream<
    (
      List<TransactionWithData<TransactionAdditionalInfo?>>,
      TransactionsBatchInfo,
    )
  >
  transactionsFoundStream;

  const address = Address(address: '0:1111111111111');
  const duplicateAddress = Address(address: '0:22222222222');

  const multisigAddress = Address(
    address:
        '0:91b689ad990660249eb00140577e6a98d70043ccaa7f63acfc0436336bdbd80f',
  );

  const multisigKey1 = PublicKey(
    publicKey:
        'aa693399a5fa114e2c0345dd6dcbfd1bb6f334e78b5fedb8c980d28dda6715cf',
  );
  const multisigKey1Entry = KeyStoreEntry(
    signerName: '',
    name: '',
    publicKey: multisigKey1,
    masterKey: multisigKey1,
    accountId: 0,
  );
  const multisigKey2 = PublicKey(
    publicKey:
        'bb9c2578a1b9d0c7a6c947c419afe61c691052ff459df65e3eb4375faf3b25c6',
  );
  const multisigKey2Entry = KeyStoreEntry(
    signerName: '',
    name: '',
    publicKey: multisigKey2,
    masterKey: multisigKey2,
    accountId: 0,
  );

  const notMultisigKey = PublicKey(
    publicKey:
        'ad158ac64c5deff5abd4d5e86a81d954716445c45e31f17a9dfe780f9cef7602',
  );
  const notMultisigKeyEntry = KeyStoreEntry(
    signerName: '',
    name: '',
    publicKey: notMultisigKey,
    masterKey: notMultisigKey,
    accountId: 0,
  );

  const notMultisigAddress = Address(
    address:
        '0:d92c91860621eb5397957ee3f426860e2c21d7d4410626885f35db88a46a87c2',
  );

  const asset1 = TonWalletAsset(
    address: notMultisigAddress,
    publicKey: notMultisigKey,
    contract: WalletType.everWallet(),
  );
  const asset2 = TonWalletAsset(
    address: multisigAddress,
    publicKey: notMultisigKey,
    contract: WalletType.walletV3(),
  );
  final details = TonWalletDetails(
    requiredConfirmations: null,
    requiresSeparateDeploy: true,
    minAmount: BigInt.zero,
    expirationTime: 0,
    supportsMultipleOwners: false,
    supportsPayload: false,
  );
  final contract = ContractState(
    balance: BigInt.zero,
    genTimings: const GenTimings(genLt: '', genUtime: 0),
    isDeployed: true,
  );
  final bridge = MockBridge();

  late TonWalletDartWrapper tonWrapper1;
  late TonWalletDartWrapper tonWrapper2;
  late ArcTonWalletBoxTrait walletBoxTrait;
  late ArcTransportBoxTrait box;

  /// We must use this method except of thenThrow because it will broke
  /// awaiting of refresh method. THIS IS SOME BUG IDK HOW TO FIX IT
  Future<T> throwError<T>() async {
    throw Exception('ERROR');
  }

  setUp(() {
    transport = MockTransport();
    storage = MockWalletStorage();
    keystore = MockKeystore();
    wallet = MockWallet();
    repository = TonWalletRepoTest(transport, keystore, storage);
    gql = MockGqlTransport();
    proto = MockProtoTransport();
    jrpc = MockJrpcTransport();

    box = MockArcTransportBoxTrait();
    registerFallbackValue(box);

    walletBoxTrait = MockArcTonWalletBoxTrait();
    tonWrapper1 = MockTonWalletDartWrapper();
    tonWrapper2 = MockTonWalletDartWrapper();
    registerFallbackValue(walletBoxTrait);
    registerFallbackValue(tonWrapper1);
    registerFallbackValue(tonWrapper2);

    tokenRepository = MockTokenRepository();

    messageSentStream = const Stream.empty();
    expiredStream = const Stream.empty();
    stateStream = const Stream.empty();
    transactionsFoundStream = const Stream.empty();

    registerFallbackValue(Int32List(0));
  });

  setUpAll(() {
    NekotonBridge.initMock(api: bridge);
  });

  group('TonWalletRepository', () {
    test('addWallet', () {
      when(
        () => wallet.onMessageExpiredStream,
      ).thenAnswer((_) => expiredStream);
      when(
        () => wallet.onMessageSentStream,
      ).thenAnswer((_) => messageSentStream);
      when(
        () => wallet.onTransactionsFoundStream,
      ).thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.onStateChangedStream).thenAnswer((_) => stateStream);
      when(() => wallet.address).thenReturn(address);

      repository.addWalletInst(wallet);

      expect(repository.walletsMap[address]?.wallet, wallet);
      expect(repository.walletSubscriptions[address], isNotNull);

      verify(() => wallet.onMessageExpiredStream).called(1);
      verify(() => wallet.onMessageSentStream).called(1);
      verify(() => wallet.onTransactionsFoundStream).called(1);
      verify(() => wallet.onStateChangedStream).called(1);
    });

    test('removeWallet', () {
      when(
        () => wallet.onMessageExpiredStream,
      ).thenAnswer((_) => expiredStream);
      when(
        () => wallet.onMessageSentStream,
      ).thenAnswer((_) => messageSentStream);
      when(
        () => wallet.onTransactionsFoundStream,
      ).thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.onStateChangedStream).thenAnswer((_) => stateStream);
      when(() => wallet.address).thenReturn(address);

      repository
        ..addWalletInst(wallet)
        ..removeWalletInst(address);

      expect(repository.walletsMap[address]?.wallet, isNull);
      expect(repository.walletSubscriptions[address], isNull);
    });

    test('unsubscribe', () async {
      when(
        () => wallet.onMessageExpiredStream,
      ).thenAnswer((_) => expiredStream);
      when(
        () => wallet.onMessageSentStream,
      ).thenAnswer((_) => messageSentStream);
      when(
        () => wallet.onTransactionsFoundStream,
      ).thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.onStateChangedStream).thenAnswer((_) => stateStream);
      when(() => wallet.address).thenReturn(address);
      when(wallet.dispose).thenReturn(null);
      when(wallet.refresh).thenAnswer((_) => Future<void>.value());
      when(() => wallet.refreshDescription).thenReturn('');

      final poller = RefreshPollingQueue(
        refresher: wallet,
        refreshInterval: PollingConfig.defaultConfig.tonWalletRefreshInterval,
      )..start();

      repository.pollingQueues[address] = poller;

      repository.addWalletInst(wallet);
      await repository.unsubscribe(address);

      expect(repository.walletsMap[address]?.wallet, isNull);
      expect(repository.walletSubscriptions[address], isNull);
      expect(repository.pollingQueues[address], isNull);
      expect(poller.isPolling, isFalse);

      verify(wallet.dispose).called(1);
    });

    test('stopPolling', () {
      when(
        () => wallet.onMessageExpiredStream,
      ).thenAnswer((_) => expiredStream);
      when(
        () => wallet.onMessageSentStream,
      ).thenAnswer((_) => messageSentStream);
      when(
        () => wallet.onTransactionsFoundStream,
      ).thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.onStateChangedStream).thenAnswer((_) => stateStream);
      when(() => wallet.address).thenReturn(address);
      when(wallet.refresh).thenAnswer((_) => Future<void>.value());
      when(() => wallet.refreshDescription).thenReturn('');

      final poller1 = RefreshPollingQueue(
        refresher: wallet,
        refreshInterval: PollingConfig.defaultConfig.tonWalletRefreshInterval,
      )..start();
      final poller2 = RefreshPollingQueue(
        refresher: wallet,
        refreshInterval: PollingConfig.defaultConfig.tonWalletRefreshInterval,
      )..start();

      repository.pollingQueues[address] = poller1;
      repository.pollingQueues[duplicateAddress] = poller2;

      repository
        ..addWalletInst(wallet)
        ..stopPolling();

      expect(repository.pollingQueues[address], isNull);
      expect(repository.pollingQueues[duplicateAddress], isNull);
      expect(poller1.isPolling, isFalse);
      expect(poller2.isPolling, isFalse);
    });

    test('startPolling with clearing previous', () async {
      when(
        () => wallet.onMessageExpiredStream,
      ).thenAnswer((_) => expiredStream);
      when(
        () => wallet.onMessageSentStream,
      ).thenAnswer((_) => messageSentStream);
      when(
        () => wallet.onTransactionsFoundStream,
      ).thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.onStateChangedStream).thenAnswer((_) => stateStream);
      when(() => wallet.address).thenReturn(address);

      when(wallet.refresh).thenAnswer((_) => Future<void>.value());
      when(() => wallet.refreshDescription).thenReturn('');

      final oldPoller = RefreshPollingQueue(
        refresher: wallet,
        refreshInterval: PollingConfig.defaultConfig.tonWalletRefreshInterval,
      )..start();

      repository.pollingQueues[duplicateAddress] = oldPoller;

      repository.addWalletInst(wallet);
      await repository.startPolling(address);

      expect(repository.pollingQueues[address], isNotNull);
      expect(repository.pollingQueues[address]!.isPolling, isTrue);
      expect(repository.pollingQueues[duplicateAddress], isNull);
      expect(oldPoller.isPolling, false);
    });

    test('startPolling without clearing previous', () async {
      when(
        () => wallet.onMessageExpiredStream,
      ).thenAnswer((_) => expiredStream);
      when(
        () => wallet.onMessageSentStream,
      ).thenAnswer((_) => messageSentStream);
      when(
        () => wallet.onTransactionsFoundStream,
      ).thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.onStateChangedStream).thenAnswer((_) => stateStream);
      when(() => wallet.address).thenReturn(address);

      final oldPoller = RefreshPollingQueue(
        refresher: wallet,
        refreshInterval: PollingConfig.defaultConfig.tonWalletRefreshInterval,
      )..start();

      repository.pollingQueues[duplicateAddress] = oldPoller;

      repository.addWalletInst(wallet);
      await repository.startPolling(address, stopPrevious: false);

      expect(repository.pollingQueues[address], isNotNull);
      expect(repository.pollingQueues[address]!.isPolling, isTrue);
      expect(repository.pollingQueues[duplicateAddress], isNotNull);
      expect(oldPoller.isPolling, true);
    });
  });

  group('TonWalletRepository.send', () {
    // 1 ever
    final amount = BigInt.parse('1000000000');
    const transactionExpiring = Duration(seconds: 20);
    final pendingTransaction = PendingTransaction(
      messageHash: 'messageHash',
      expireAt: NtpTime.now().add(transactionExpiring),
    );
    const sendDuration = Duration(seconds: 3);
    final signedMessage = SignedMessage(
      hash: 'hash',
      expireAt: NtpTime.now(),
      boc: 'boc',
    );
    final latestBlock = LatestBlock(
      id: 'latest',
      endLt: BigInt.zero,
      genUtime: 0,
    );
    const nextBlockId = 'next';
    const block = 'block';
    const networkId = 111;
    const group = 'group';
    final transaction = Transaction(
      id: const TransactionId(hash: 'hash', lt: 'lt'),
      createdAt: NtpTime.now(),
      aborted: false,
      origStatus: AccountStatus.active,
      endStatus: AccountStatus.active,
      totalFees: amount,
      boc: '',
      inMessage: Message(
        hash: 'messageHash',
        value: amount,
        bounce: false,
        bounced: false,
      ),
      outMessages: [],
    );
    final pendingWithData = PendingTransactionWithData(
      transaction: pendingTransaction,
      destination: address,
      amount: amount,
      createdAt: NtpTime.now(),
    );
    registerFallbackValue(signedMessage);
    registerFallbackValue(address);
    registerFallbackValue(nextBlockTimeout);
    registerFallbackValue(pendingWithData);

    ///--------------------------------------
    ///                  GQL
    ///--------------------------------------

    test('send GQL success', () async {
      // default settings for subscription
      when(
        () => wallet.onMessageExpiredStream,
      ).thenAnswer((_) => expiredStream);
      when(() => wallet.onMessageSentStream).thenAnswer(
        (_) => Stream.fromFuture(
          Future.delayed(sendDuration, () {
            return (pendingTransaction, transaction);
          }),
        ),
      );
      when(
        () => wallet.onTransactionsFoundStream,
      ).thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.onStateChangedStream).thenAnswer((_) => stateStream);
      when(() => wallet.address).thenReturn(address);
      when(wallet.refresh).thenAnswer((_) => Future<void>.value());
      when(() => wallet.refreshDescription).thenReturn('');

      when(() => wallet.transport).thenReturn(gql);
      when(
        () => wallet.send(
          signedMessage: any(named: 'signedMessage', that: isNotNull),
        ),
      ).thenAnswer((_) => Future.value(pendingTransaction));

      // Transport flow
      when(() => gql.networkId).thenReturn(networkId);
      when(() => gql.group).thenReturn(group);

      /// Gql refresh flow
      when(
        () => gql.getLatestBlock(address: any(named: 'address')),
      ).thenAnswer((_) => Future.value(latestBlock));
      when(
        () => gql.waitForNextBlock(
          currentBlockId: any(named: 'currentBlockId'),
          address: address,
          timeout: any(named: 'timeout'),
        ),
      ).thenAnswer((_) => Future.value(nextBlockId));
      when(
        () => gql.getBlock(id: any(named: 'id')),
      ).thenAnswer((_) => Future.value(block));
      when(
        () => wallet.handleBlock(block: any(named: 'block')),
      ).thenAnswer((_) => Future<void>.value());

      // storage flow
      when(
        () => storage.addPendingTransaction(
          networkId: any(named: 'networkId'),
          group: any(named: 'group'),
          address: any(named: 'address'),
          transaction: any(named: 'transaction'),
        ),
      ).thenAnswer((_) => Future<void>.value());
      when(
        () => storage.deletePendingTransaction(
          networkId: any(named: 'networkId'),
          group: any(named: 'group'),
          address: any(named: 'address'),
          messageHash: any(named: 'messageHash'),
        ),
      ).thenAnswer((_) => Future.value(pendingWithData));

      /// old poller must be paused
      final oldPoller = RefreshPollingQueue(
        refresher: wallet,
        refreshInterval: PollingConfig.defaultConfig.tonWalletRefreshInterval,
      )..start();
      repository.pollingQueues[address] = oldPoller;
      repository.addWalletInst(wallet);

      ///----------------------------
      /// Main flow
      ///----------------------------

      final transactionFuture = repository.send(
        address: address,
        signedMessage: signedMessage,
        destination: duplicateAddress,
        amount: amount,
      );

      /// wait for preparation completed
      await Future<void>.delayed(const Duration(seconds: 1));
      expect(oldPoller.isPolling, isFalse);

      /// Wait for method completion
      final transactionResult = await transactionFuture;

      verify(() => wallet.send(signedMessage: signedMessage)).called(1);
      verify(
        () => storage.addPendingTransaction(
          networkId: networkId,
          group: group,
          address: address,
          transaction: any(named: 'transaction', that: isNotNull),
        ),
      ).called(1);
      verify(
        () => storage.deletePendingTransaction(
          networkId: any(named: 'networkId'),
          group: any(named: 'group'),
          address: any(named: 'address'),
          messageHash: pendingTransaction.messageHash,
        ),
      ).called(1);

      // refresh flow
      verify(() => gql.getLatestBlock(address: address)).called(1);
      verify(
        () => gql.waitForNextBlock(
          address: address,
          currentBlockId: latestBlock.id,
          timeout: nextBlockTimeout,
        ),
      ).called(1);
      verify(() => gql.getBlock(id: nextBlockId)).called(1);
      verify(() => wallet.handleBlock(block: block)).called(1);

      expect(transactionResult, transaction);
      expect(repository.walletsMap[address]?.wallet, isNotNull);
      expect(repository.walletSubscriptions[address], isNotNull);
      expect(repository.pollingQueues[address], isNotNull);
      expect(oldPoller.isPolling, isTrue);
    });

    test('send GQL failed', () async {
      // default settings for subscription
      when(
        () => wallet.onMessageExpiredStream,
      ).thenAnswer((_) => expiredStream);
      // this should be avoided
      when(() => wallet.onMessageSentStream).thenAnswer(
        (_) =>
            Stream.fromFuture(Future.delayed(transactionExpiring, throwError)),
      );
      when(
        () => wallet.onTransactionsFoundStream,
      ).thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.onStateChangedStream).thenAnswer((_) => stateStream);
      when(() => wallet.address).thenReturn(address);
      when(wallet.refresh).thenAnswer((_) => Future<void>.value());
      when(() => wallet.refreshDescription).thenReturn('');

      when(() => wallet.transport).thenReturn(gql);
      when(
        () => wallet.send(
          signedMessage: any(named: 'signedMessage', that: isNotNull),
        ),
      ).thenAnswer((_) => Future.value(pendingTransaction));

      // Transport flow
      when(() => gql.networkId).thenReturn(networkId);
      when(() => gql.group).thenReturn(group);

      /// Gql refresh flow
      when(() => gql.getLatestBlock(address: any(named: 'address'))).thenAnswer(
        (_) =>
            Future<LatestBlock>.delayed(const Duration(seconds: 1), throwError),
      );

      // storage flow
      when(
        () => storage.addPendingTransaction(
          networkId: any(named: 'networkId'),
          group: any(named: 'group'),
          address: any(named: 'address'),
          transaction: any(named: 'transaction'),
        ),
      ).thenAnswer((_) => Future<void>.value());

      /// old poller must be paused
      final oldPoller = RefreshPollingQueue(
        refresher: wallet,
        refreshInterval: PollingConfig.defaultConfig.tonWalletRefreshInterval,
      )..start();
      repository.pollingQueues[address] = oldPoller;
      repository.addWalletInst(wallet);

      ///----------------------------
      /// Main flow
      ///----------------------------

      final transactionFuture = repository.send(
        address: address,
        signedMessage: signedMessage,
        destination: duplicateAddress,
        amount: amount,
      );

      /// wait for preparation completed
      await Future<void>.delayed(const Duration(milliseconds: 500));
      expect(oldPoller.isPolling, isFalse);

      /// Wait for method completion
      try {
        await transactionFuture;
        expect(true, false);
      } catch (_) {
        expect(true, true);
      }

      verify(() => wallet.send(signedMessage: signedMessage)).called(1);
      verify(
        () => storage.addPendingTransaction(
          networkId: networkId,
          group: group,
          address: address,
          transaction: any(named: 'transaction', that: isNotNull),
        ),
      ).called(1);
      verifyNever(
        () => storage.deletePendingTransaction(
          networkId: any(named: 'networkId'),
          group: any(named: 'group'),
          address: any(named: 'address'),
          messageHash: pendingTransaction.messageHash,
        ),
      );

      // refresh flow
      verify(() => gql.getLatestBlock(address: address)).called(1);
      verifyNever(
        () => gql.waitForNextBlock(
          address: address,
          currentBlockId: latestBlock.id,
          timeout: nextBlockTimeout,
        ),
      );
      verifyNever(() => gql.getBlock(id: nextBlockId));
      verifyNever(() => wallet.handleBlock(block: block));

      expect(repository.walletsMap[address]?.wallet, isNotNull);
      expect(repository.walletSubscriptions[address], isNotNull);
      expect(repository.pollingQueues[address], isNotNull);
      expect(oldPoller.isPolling, isTrue);
    });

    ///--------------------------------------
    ///                  PROTO
    ///--------------------------------------

    test('send PROTO success', () async {
      // default settings for subscription
      when(
        () => wallet.onMessageExpiredStream,
      ).thenAnswer((_) => expiredStream);
      when(() => wallet.onMessageSentStream).thenAnswer(
        (_) => Stream.fromFuture(
          Future.delayed(sendDuration, () {
            return (pendingTransaction, transaction);
          }),
        ),
      );
      when(
        () => wallet.onTransactionsFoundStream,
      ).thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.onStateChangedStream).thenAnswer((_) => stateStream);
      when(() => wallet.address).thenReturn(address);
      when(
        () => wallet.refresh(),
      ).thenAnswer((_) => Future<void>.delayed(sendDuration));
      when(() => wallet.refreshDescription).thenReturn('');

      when(() => wallet.transport).thenReturn(proto);
      when(
        () => wallet.send(
          signedMessage: any(named: 'signedMessage', that: isNotNull),
        ),
      ).thenAnswer((_) => Future.value(pendingTransaction));

      // Transport flow
      when(() => proto.networkId).thenReturn(networkId);
      when(() => proto.group).thenReturn(group);

      // storage flow
      when(
        () => storage.addPendingTransaction(
          networkId: any(named: 'networkId'),
          group: any(named: 'group'),
          address: any(named: 'address'),
          transaction: any(named: 'transaction'),
        ),
      ).thenAnswer((_) => Future<void>.value());
      when(
        () => storage.deletePendingTransaction(
          networkId: any(named: 'networkId'),
          group: any(named: 'group'),
          address: any(named: 'address'),
          messageHash: any(named: 'messageHash'),
        ),
      ).thenAnswer((_) => Future.value(pendingWithData));

      repository.addWalletInst(wallet);

      ///----------------------------
      /// Main flow
      ///----------------------------

      final transactionFuture = repository.send(
        address: address,
        signedMessage: signedMessage,
        destination: duplicateAddress,
        amount: amount,
      );

      /// wait for preparation completed
      await Future<void>.delayed(const Duration(seconds: 1));

      /// Wait for method completion
      final transactionResult = await transactionFuture;

      verify(() => wallet.send(signedMessage: signedMessage)).called(1);
      verify(
        () => storage.addPendingTransaction(
          networkId: networkId,
          group: group,
          address: address,
          transaction: any(named: 'transaction', that: isNotNull),
        ),
      ).called(1);
      verify(
        () => storage.deletePendingTransaction(
          networkId: any(named: 'networkId'),
          group: any(named: 'group'),
          address: any(named: 'address'),
          messageHash: pendingTransaction.messageHash,
        ),
      ).called(1);

      verify(() => wallet.refresh()).called(1);

      expect(transactionResult, transaction);
      expect(repository.walletsMap[address]?.wallet, isNotNull);
      expect(repository.walletSubscriptions[address], isNotNull);
      expect(repository.pollingQueues[address], isNull);
    });

    test('send PROTO failed', () async {
      // default settings for subscription
      when(
        () => wallet.onMessageExpiredStream,
      ).thenAnswer((_) => expiredStream);
      // this should be avoided
      when(() => wallet.onMessageSentStream).thenAnswer(
        (_) =>
            Stream.fromFuture(Future.delayed(transactionExpiring, throwError)),
      );
      when(
        () => wallet.onTransactionsFoundStream,
      ).thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.onStateChangedStream).thenAnswer((_) => stateStream);
      when(() => wallet.address).thenReturn(address);
      when(() => wallet.refresh()).thenAnswer(
        (_) =>
            Future<LatestBlock>.delayed(const Duration(seconds: 1), throwError),
      );
      when(() => wallet.refreshDescription).thenReturn('');

      when(() => wallet.transport).thenReturn(proto);
      when(
        () => wallet.send(
          signedMessage: any(named: 'signedMessage', that: isNotNull),
        ),
      ).thenAnswer((_) => Future.value(pendingTransaction));

      // Transport flow
      when(() => proto.networkId).thenReturn(networkId);
      when(() => proto.group).thenReturn(group);

      // storage flow
      when(
        () => storage.addPendingTransaction(
          networkId: any(named: 'networkId'),
          group: any(named: 'group'),
          address: any(named: 'address'),
          transaction: any(named: 'transaction'),
        ),
      ).thenAnswer((_) => Future<void>.value());

      repository.addWalletInst(wallet);

      ///----------------------------
      /// Main flow
      ///----------------------------

      final transactionFuture = repository.send(
        address: address,
        signedMessage: signedMessage,
        destination: duplicateAddress,
        amount: amount,
      );

      /// wait for preparation completed
      await Future<void>.delayed(const Duration(milliseconds: 500));

      /// Wait for method completion
      try {
        await transactionFuture;
        expect(true, false);
      } catch (_) {
        expect(true, true);
      }

      verify(() => wallet.send(signedMessage: signedMessage)).called(1);
      verify(
        () => storage.addPendingTransaction(
          networkId: networkId,
          group: group,
          address: address,
          transaction: any(named: 'transaction', that: isNotNull),
        ),
      ).called(1);
      verifyNever(
        () => storage.deletePendingTransaction(
          networkId: any(named: 'networkId'),
          group: any(named: 'group'),
          address: any(named: 'address'),
          messageHash: pendingTransaction.messageHash,
        ),
      );

      // refresh flow
      verify(() => wallet.refresh()).called(1);

      expect(repository.walletsMap[address]?.wallet, isNotNull);
      expect(repository.walletSubscriptions[address], isNotNull);
      expect(repository.pollingQueues[address], isNull);
    });

    ///--------------------------------------
    ///                  JRPC
    ///--------------------------------------

    test('send JRPC success', () async {
      // default settings for subscription
      when(
        () => wallet.onMessageExpiredStream,
      ).thenAnswer((_) => expiredStream);
      when(() => wallet.onMessageSentStream).thenAnswer(
        (_) => Stream.fromFuture(
          Future.delayed(sendDuration, () {
            return (pendingTransaction, transaction);
          }),
        ),
      );
      when(
        () => wallet.onTransactionsFoundStream,
      ).thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.onStateChangedStream).thenAnswer((_) => stateStream);
      when(() => wallet.address).thenReturn(address);
      when(
        () => wallet.refresh(),
      ).thenAnswer((_) => Future<void>.delayed(sendDuration));
      when(() => wallet.refreshDescription).thenReturn('');

      when(() => wallet.transport).thenReturn(jrpc);
      when(
        () => wallet.send(
          signedMessage: any(named: 'signedMessage', that: isNotNull),
        ),
      ).thenAnswer((_) => Future.value(pendingTransaction));

      // Transport flow
      when(() => jrpc.networkId).thenReturn(networkId);
      when(() => jrpc.group).thenReturn(group);

      // storage flow
      when(
        () => storage.addPendingTransaction(
          networkId: any(named: 'networkId'),
          group: any(named: 'group'),
          address: any(named: 'address'),
          transaction: any(named: 'transaction'),
        ),
      ).thenAnswer((_) => Future<void>.value());
      when(
        () => storage.deletePendingTransaction(
          networkId: any(named: 'networkId'),
          group: any(named: 'group'),
          address: any(named: 'address'),
          messageHash: any(named: 'messageHash'),
        ),
      ).thenAnswer((_) => Future.value(pendingWithData));

      repository.addWalletInst(wallet);

      ///----------------------------
      /// Main flow
      ///----------------------------

      final transactionFuture = repository.send(
        address: address,
        signedMessage: signedMessage,
        destination: duplicateAddress,
        amount: amount,
      );

      /// wait for preparation completed
      await Future<void>.delayed(const Duration(seconds: 1));

      /// Wait for method completion
      final transactionResult = await transactionFuture;

      verify(() => wallet.send(signedMessage: signedMessage)).called(1);
      verify(
        () => storage.addPendingTransaction(
          networkId: networkId,
          group: group,
          address: address,
          transaction: any(named: 'transaction', that: isNotNull),
        ),
      ).called(1);
      verify(
        () => storage.deletePendingTransaction(
          networkId: any(named: 'networkId'),
          group: any(named: 'group'),
          address: any(named: 'address'),
          messageHash: pendingTransaction.messageHash,
        ),
      ).called(1);

      verify(() => wallet.refresh()).called(1);

      expect(transactionResult, transaction);
      expect(repository.walletsMap[address]?.wallet, isNotNull);
      expect(repository.walletSubscriptions[address], isNotNull);
      expect(repository.pollingQueues[address], isNull);
    });

    test('send JRPC failed', () async {
      // default settings for subscription
      when(
        () => wallet.onMessageExpiredStream,
      ).thenAnswer((_) => expiredStream);
      // this should be avoided
      when(() => wallet.onMessageSentStream).thenAnswer(
        (_) =>
            Stream.fromFuture(Future.delayed(transactionExpiring, throwError)),
      );
      when(
        () => wallet.onTransactionsFoundStream,
      ).thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.onStateChangedStream).thenAnswer((_) => stateStream);
      when(() => wallet.address).thenReturn(address);
      when(() => wallet.refresh()).thenAnswer(
        (_) =>
            Future<LatestBlock>.delayed(const Duration(seconds: 1), throwError),
      );
      when(() => wallet.refreshDescription).thenReturn('');

      when(() => wallet.transport).thenReturn(jrpc);
      when(
        () => wallet.send(
          signedMessage: any(named: 'signedMessage', that: isNotNull),
        ),
      ).thenAnswer((_) => Future.value(pendingTransaction));

      // Transport flow
      when(() => jrpc.networkId).thenReturn(networkId);
      when(() => jrpc.group).thenReturn(group);

      // storage flow
      when(
        () => storage.addPendingTransaction(
          networkId: any(named: 'networkId'),
          group: any(named: 'group'),
          address: any(named: 'address'),
          transaction: any(named: 'transaction'),
        ),
      ).thenAnswer((_) => Future<void>.value());

      repository.addWalletInst(wallet);

      ///----------------------------
      /// Main flow
      ///----------------------------

      final transactionFuture = repository.send(
        address: address,
        signedMessage: signedMessage,
        destination: duplicateAddress,
        amount: amount,
      );

      /// wait for preparation completed
      await Future<void>.delayed(const Duration(milliseconds: 500));

      /// Wait for method completion
      try {
        await transactionFuture;
        expect(true, false);
      } catch (_) {
        expect(true, true);
      }

      verify(() => wallet.send(signedMessage: signedMessage)).called(1);
      verify(
        () => storage.addPendingTransaction(
          networkId: networkId,
          group: group,
          address: address,
          transaction: any(named: 'transaction', that: isNotNull),
        ),
      ).called(1);
      verifyNever(
        () => storage.deletePendingTransaction(
          networkId: any(named: 'networkId'),
          group: any(named: 'group'),
          address: any(named: 'address'),
          messageHash: pendingTransaction.messageHash,
        ),
      );

      // refresh flow
      verify(() => wallet.refresh()).called(1);

      expect(repository.walletsMap[address]?.wallet, isNotNull);
      expect(repository.walletSubscriptions[address], isNotNull);
      expect(repository.pollingQueues[address], isNull);
    });
  });

  group('TonWalletRepository.getLocalCustodians', () {
    test('Get only one local custodian', () async {
      when(
        () => wallet.onMessageExpiredStream,
      ).thenAnswer((_) => expiredStream);
      when(
        () => wallet.onMessageSentStream,
      ).thenAnswer((_) => messageSentStream);
      when(
        () => wallet.onTransactionsFoundStream,
      ).thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.onStateChangedStream).thenAnswer((_) => stateStream);

      when(() => transport.transport).thenReturn(proto);
      when(() => keystore.keys).thenReturn([multisigKey1Entry]);
      when(() => wallet.custodians).thenReturn([multisigKey1, multisigKey2]);
      when(() => wallet.address).thenReturn(multisigAddress);

      repository.addWalletInst(wallet);
      final local = await repository.getLocalCustodians(multisigAddress);
      expect(local, [multisigKey1]);
    });

    test('Get several local custodian', () async {
      when(
        () => wallet.onMessageExpiredStream,
      ).thenAnswer((_) => expiredStream);
      when(
        () => wallet.onMessageSentStream,
      ).thenAnswer((_) => messageSentStream);
      when(
        () => wallet.onTransactionsFoundStream,
      ).thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.onStateChangedStream).thenAnswer((_) => stateStream);

      when(() => transport.transport).thenReturn(proto);
      when(
        () => keystore.keys,
      ).thenReturn([multisigKey1Entry, multisigKey2Entry]);
      when(() => wallet.custodians).thenReturn([multisigKey1, multisigKey2]);
      when(() => wallet.address).thenReturn(multisigAddress);

      repository.addWalletInst(wallet);
      final local = await repository.getLocalCustodians(multisigAddress);
      expect(local, [multisigKey1, multisigKey2]);
    });

    test('Return single-item custodians for not multisig', () async {
      when(
        () => wallet.onMessageExpiredStream,
      ).thenAnswer((_) => expiredStream);
      when(
        () => wallet.onMessageSentStream,
      ).thenAnswer((_) => messageSentStream);
      when(
        () => wallet.onTransactionsFoundStream,
      ).thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.onStateChangedStream).thenAnswer((_) => stateStream);

      when(() => transport.transport).thenReturn(proto);
      when(() => keystore.keys).thenReturn([notMultisigKeyEntry]);
      when(() => wallet.custodians).thenReturn([notMultisigKey]);
      when(() => wallet.address).thenReturn(notMultisigAddress);

      repository.addWalletInst(wallet);
      final local = await repository.getLocalCustodians(notMultisigAddress);
      expect(local, [notMultisigKey]);
    });

    test('Return null for not multisig if no local found', () async {
      when(
        () => wallet.onMessageExpiredStream,
      ).thenAnswer((_) => expiredStream);
      when(
        () => wallet.onMessageSentStream,
      ).thenAnswer((_) => messageSentStream);
      when(
        () => wallet.onTransactionsFoundStream,
      ).thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.onStateChangedStream).thenAnswer((_) => stateStream);

      when(() => transport.transport).thenReturn(proto);
      when(() => keystore.keys).thenReturn([]);
      when(() => wallet.custodians).thenReturn([notMultisigKey]);
      when(() => wallet.address).thenReturn(notMultisigAddress);

      repository.addWalletInst(wallet);
      final local = await repository.getLocalCustodians(notMultisigAddress);
      expect(local, isNull);
    });
  });

  group('TonWalletRepository.getLocalCustodiansAsync', () {
    test('Get only one local custodian', () async {
      when(() => proto.transportBox).thenReturn(box);
      when(
        () => bridge.crateApiMergedTonWalletDartWrapperGetCustodians(
          address: any(named: 'address'),
          transport: any(named: 'transport'),
        ),
      ).thenAnswer(
        (_) => Future.value([multisigKey1.publicKey, multisigKey2.publicKey]),
      );

      when(() => transport.transport).thenReturn(proto);
      when(() => proto.disposed).thenReturn(false);
      when(() => keystore.keys).thenReturn([multisigKey1Entry]);

      final local = await repository.getLocalCustodiansAsync(multisigAddress);
      expect(local, [multisigKey1]);
    });

    test('Get several local custodian', () async {
      when(() => proto.transportBox).thenReturn(box);
      when(
        () => bridge.crateApiMergedTonWalletDartWrapperGetCustodians(
          address: any(named: 'address'),
          transport: any(named: 'transport'),
        ),
      ).thenAnswer(
        (_) => Future.value([multisigKey1.publicKey, multisigKey2.publicKey]),
      );

      when(() => transport.transport).thenReturn(proto);
      when(() => proto.disposed).thenReturn(false);
      when(
        () => keystore.keys,
      ).thenReturn([multisigKey1Entry, multisigKey2Entry]);

      final local = await repository.getLocalCustodiansAsync(multisigAddress);
      expect(local, [multisigKey1, multisigKey2]);
    });

    test('Return single-item custodians for not multisig ', () async {
      when(() => proto.transportBox).thenReturn(box);
      when(
        () => bridge.crateApiMergedTonWalletDartWrapperGetCustodians(
          address: any(named: 'address'),
          transport: any(named: 'transport'),
        ),
      ).thenAnswer((_) => Future.value([notMultisigKey.publicKey]));

      when(() => transport.transport).thenReturn(proto);
      when(() => proto.disposed).thenReturn(false);
      when(() => keystore.keys).thenReturn([notMultisigKeyEntry]);

      final local = await repository.getLocalCustodiansAsync(
        notMultisigAddress,
      );
      expect(local, [notMultisigKey]);
    });

    test('Return null for not multisig if no local found ', () async {
      when(() => proto.transportBox).thenReturn(box);
      when(
        () => bridge.crateApiMergedTonWalletDartWrapperGetCustodians(
          address: any(named: 'address'),
          transport: any(named: 'transport'),
        ),
      ).thenAnswer((_) => Future.value([notMultisigKey.publicKey]));

      when(() => transport.transport).thenReturn(proto);
      when(() => proto.disposed).thenReturn(false);
      when(() => keystore.keys).thenReturn([]);

      final local = await repository.getLocalCustodiansAsync(
        notMultisigAddress,
      );
      expect(local, isNull);
    });
  });

  void mockTonWallet(TonWalletDartWrapper box, TonWalletAsset asset) {
    when(
      () => box.walletType(),
    ).thenAnswer((_) => Future.value(jsonEncode(asset.contract.toJson())));
    when(() => box.workchain()).thenAnswer((_) => Future.value(1));
    when(
      () => box.publicKey(),
    ).thenAnswer((_) => Future.value(asset.publicKey.publicKey));
    when(
      () => box.address(),
    ).thenAnswer((_) => Future.value(asset.address.address));
    when(
      () => box.details(),
    ).thenAnswer((_) => Future.value(jsonEncode(details.toJson())));
    when(
      () => box.contractState(),
    ).thenAnswer((_) => Future.value(jsonEncode(contract.toJson())));
    when(
      () => box.pendingTransactions(),
    ).thenAnswer((_) => Future.value(jsonEncode([])));
    when(
      () => box.unconfirmedTransactions(),
    ).thenAnswer((_) => Future.value(jsonEncode([])));
    when(
      () => box.pollingMethod(),
    ).thenAnswer((_) => Future.value(PollingMethod.manual));
    when(
      () => box.custodians(),
    ).thenAnswer((_) => Future.value([asset.publicKey.publicKey]));
  }

  group('TonWalletRepository', () {
    test('updateSubscriptions without side effects', () async {
      when(
        () => wallet.onMessageExpiredStream,
      ).thenAnswer((_) => expiredStream);
      when(
        () => wallet.onMessageSentStream,
      ).thenAnswer((_) => messageSentStream);
      when(
        () => wallet.onTransactionsFoundStream,
      ).thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.onStateChangedStream).thenAnswer((_) => stateStream);

      when(() => transport.transport).thenReturn(proto);
      when(() => proto.disposed).thenReturn(false);
      when(() => wallet.address).thenReturn(multisigAddress);
      when(() => proto.transportBox).thenReturn(box);

      when(
        () => bridge.crateApiMergedTonWalletDartWrapperSubscribe(
          publicKey: any(named: 'publicKey'),
          transport: any(named: 'transport'),
          walletType: any(named: 'walletType'),
          workchainId: any(named: 'workchainId'),
          onCustodiansChanged: any(named: 'onCustodiansChanged'),
          onTransactionsFound: any(named: 'onTransactionsFound'),
          onDetailsChanged: any(named: 'onDetailsChanged'),
          onMessageExpired: any(named: 'onMessageExpired'),
          onMessageSent: any(named: 'onMessageSent'),
          onStateChanged: any(named: 'onStateChanged'),
          onUnconfirmedTransactionsChanged: any(
            named: 'onUnconfirmedTransactionsChanged',
          ),
        ),
      ).thenAnswer((call) {
        if (call.namedArguments[const Symbol('walletType')] ==
            jsonEncode(asset1.contract.toJson())) {
          return Future.value(tonWrapper1);
        }
        return Future.value(tonWrapper2);
      });
      mockTonWallet(tonWrapper1, asset1);
      mockTonWallet(tonWrapper2, asset2);

      await repository.updateSubscriptions([(asset1, false), (asset2, false)]);

      expect(repository.wallets.length, 2);
    });

    test('updateSubscriptions without side effects by address metod', () async {
      when(
        () => wallet.onMessageExpiredStream,
      ).thenAnswer((_) => expiredStream);
      when(
        () => wallet.onMessageSentStream,
      ).thenAnswer((_) => messageSentStream);
      when(
        () => wallet.onTransactionsFoundStream,
      ).thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.onStateChangedStream).thenAnswer((_) => stateStream);

      when(() => transport.transport).thenReturn(proto);
      when(() => proto.disposed).thenReturn(false);
      when(() => wallet.address).thenReturn(multisigAddress);
      when(() => proto.transportBox).thenReturn(box);

      when(
        () => bridge.crateApiMergedTonWalletDartWrapperSubscribe(
          publicKey: any(named: 'publicKey'),
          transport: any(named: 'transport'),
          walletType: any(named: 'walletType'),
          workchainId: any(named: 'workchainId'),
          onCustodiansChanged: any(named: 'onCustodiansChanged'),
          onTransactionsFound: any(named: 'onTransactionsFound'),
          onDetailsChanged: any(named: 'onDetailsChanged'),
          onMessageExpired: any(named: 'onMessageExpired'),
          onMessageSent: any(named: 'onMessageSent'),
          onStateChanged: any(named: 'onStateChanged'),
          onUnconfirmedTransactionsChanged: any(
            named: 'onUnconfirmedTransactionsChanged',
          ),
        ),
      ).thenAnswer((_) => Future.value(tonWrapper2));
      when(
        () => bridge.crateApiMergedTonWalletDartWrapperSubscribeByAddress(
          address: any(named: 'address'),
          transport: any(named: 'transport'),
          onCustodiansChanged: any(named: 'onCustodiansChanged'),
          onTransactionsFound: any(named: 'onTransactionsFound'),
          onDetailsChanged: any(named: 'onDetailsChanged'),
          onMessageExpired: any(named: 'onMessageExpired'),
          onMessageSent: any(named: 'onMessageSent'),
          onStateChanged: any(named: 'onStateChanged'),
          onUnconfirmedTransactionsChanged: any(
            named: 'onUnconfirmedTransactionsChanged',
          ),
        ),
      ).thenAnswer((_) => Future.value(tonWrapper1));
      mockTonWallet(tonWrapper1, asset1);
      mockTonWallet(tonWrapper2, asset2);

      await repository.updateSubscriptions([(asset1, true), (asset2, false)]);

      expect(repository.wallets.length, 2);
    });

    test('updateSubscriptions with failed subscribe of one wallet', () async {
      when(
        () => wallet.onMessageExpiredStream,
      ).thenAnswer((_) => expiredStream);
      when(
        () => wallet.onMessageSentStream,
      ).thenAnswer((_) => messageSentStream);
      when(
        () => wallet.onTransactionsFoundStream,
      ).thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.onStateChangedStream).thenAnswer((_) => stateStream);

      when(() => transport.transport).thenReturn(proto);
      when(() => proto.disposed).thenReturn(false);
      when(() => wallet.address).thenReturn(multisigAddress);
      when(() => proto.transportBox).thenReturn(box);

      when(
        () => bridge.crateApiMergedNtComputeTonWalletAddress(
          publicKey: any(named: 'publicKey'),
          walletType: any(named: 'walletType'),
          workchain: any(named: 'workchain'),
        ),
      ).thenAnswer((_) => '12345');
      when(
        () => bridge.crateApiMergedNtRepackAddress(
          address: any(named: 'address'),
        ),
      ).thenAnswer((_) => '12345');

      when(
        () => bridge.crateApiMergedTonWalletDartWrapperSubscribe(
          publicKey: any(named: 'publicKey'),
          transport: any(named: 'transport'),
          walletType: any(named: 'walletType'),
          workchainId: any(named: 'workchainId'),
          onCustodiansChanged: any(named: 'onCustodiansChanged'),
          onTransactionsFound: any(named: 'onTransactionsFound'),
          onDetailsChanged: any(named: 'onDetailsChanged'),
          onMessageExpired: any(named: 'onMessageExpired'),
          onMessageSent: any(named: 'onMessageSent'),
          onStateChanged: any(named: 'onStateChanged'),
          onUnconfirmedTransactionsChanged: any(
            named: 'onUnconfirmedTransactionsChanged',
          ),
        ),
      ).thenAnswer((call) {
        if (call.namedArguments[const Symbol('walletType')] ==
            jsonEncode(asset1.contract.toJson())) {
          return Future.value(tonWrapper1);
        }
        return throwError();
      });
      mockTonWallet(tonWrapper1, asset1);
      mockTonWallet(tonWrapper2, asset2);

      await repository.updateSubscriptions([(asset1, false), (asset2, false)]);

      final wallets = repository.wallets;

      expect(wallets.length, 2);
      expect(wallets.where((e) => e.hasError).length, 1);
      expect(wallets.where((e) => e.hasWallet).length, 1);
    });

    test('retrySubscriptions successfully', () async {
      when(
        () => wallet.onMessageExpiredStream,
      ).thenAnswer((_) => expiredStream);
      when(
        () => wallet.onMessageSentStream,
      ).thenAnswer((_) => messageSentStream);
      when(
        () => wallet.onTransactionsFoundStream,
      ).thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.onStateChangedStream).thenAnswer((_) => stateStream);

      when(() => transport.transport).thenReturn(proto);
      when(() => proto.disposed).thenReturn(false);
      when(() => wallet.address).thenReturn(multisigAddress);
      when(() => proto.transportBox).thenReturn(box);

      when(
        () => bridge.crateApiMergedNtComputeTonWalletAddress(
          publicKey: any(named: 'publicKey'),
          walletType: any(named: 'walletType'),
          workchain: any(named: 'workchain'),
        ),
      ).thenAnswer((_) => '12345');
      when(
        () => bridge.crateApiMergedNtRepackAddress(
          address: any(named: 'address'),
        ),
      ).thenAnswer((_) => '12345');

      when(
        () => bridge.crateApiMergedTonWalletDartWrapperSubscribe(
          publicKey: any(named: 'publicKey'),
          transport: any(named: 'transport'),
          walletType: any(named: 'walletType'),
          workchainId: any(named: 'workchainId'),
          onCustodiansChanged: any(named: 'onCustodiansChanged'),
          onTransactionsFound: any(named: 'onTransactionsFound'),
          onDetailsChanged: any(named: 'onDetailsChanged'),
          onMessageExpired: any(named: 'onMessageExpired'),
          onMessageSent: any(named: 'onMessageSent'),
          onStateChanged: any(named: 'onStateChanged'),
          onUnconfirmedTransactionsChanged: any(
            named: 'onUnconfirmedTransactionsChanged',
          ),
        ),
      ).thenAnswer((_) => throwError());
      mockTonWallet(tonWrapper1, asset1);

      await repository.updateSubscriptions([(asset1, false)]);

      var wallets = repository.wallets;

      expect(wallets.length, 1);
      expect(wallets.where((e) => e.hasError).length, 1);

      when(
        () => bridge.crateApiMergedTonWalletDartWrapperSubscribe(
          publicKey: any(named: 'publicKey'),
          transport: any(named: 'transport'),
          walletType: any(named: 'walletType'),
          workchainId: any(named: 'workchainId'),
          onCustodiansChanged: any(named: 'onCustodiansChanged'),
          onTransactionsFound: any(named: 'onTransactionsFound'),
          onDetailsChanged: any(named: 'onDetailsChanged'),
          onMessageExpired: any(named: 'onMessageExpired'),
          onMessageSent: any(named: 'onMessageSent'),
          onStateChanged: any(named: 'onStateChanged'),
          onUnconfirmedTransactionsChanged: any(
            named: 'onUnconfirmedTransactionsChanged',
          ),
        ),
      ).thenAnswer((_) => Future.value(tonWrapper1));

      await repository.retrySubscriptions(asset1.address);

      wallets = repository.wallets;

      expect(wallets.length, 1);
      expect(wallets.where((e) => e.hasWallet).length, 1);
    });

    test('retrySubscriptions no cached asset', () async {
      when(
        () => wallet.onMessageExpiredStream,
      ).thenAnswer((_) => expiredStream);
      when(
        () => wallet.onMessageSentStream,
      ).thenAnswer((_) => messageSentStream);
      when(
        () => wallet.onTransactionsFoundStream,
      ).thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.onStateChangedStream).thenAnswer((_) => stateStream);

      when(() => transport.transport).thenReturn(proto);
      when(() => wallet.address).thenReturn(multisigAddress);
      when(() => proto.transportBox).thenReturn(box);

      when(
        () => bridge.crateApiMergedTonWalletDartWrapperSubscribe(
          publicKey: any(named: 'publicKey'),
          transport: any(named: 'transport'),
          walletType: any(named: 'walletType'),
          workchainId: any(named: 'workchainId'),
          onCustodiansChanged: any(named: 'onCustodiansChanged'),
          onTransactionsFound: any(named: 'onTransactionsFound'),
          onDetailsChanged: any(named: 'onDetailsChanged'),
          onMessageExpired: any(named: 'onMessageExpired'),
          onMessageSent: any(named: 'onMessageSent'),
          onStateChanged: any(named: 'onStateChanged'),
          onUnconfirmedTransactionsChanged: any(
            named: 'onUnconfirmedTransactionsChanged',
          ),
        ),
      ).thenAnswer((_) => throwError());
      mockTonWallet(tonWrapper1, asset1);

      await repository.retrySubscriptions(asset1.address);

      final wallets = repository.wallets;

      expect(wallets.length, 1);
      expect(wallets.where((e) => e.hasError).length, 1);
      expect(
        wallets.first.error is TonWalletRetrySubscriptionMissedAsset,
        isTrue,
      );
    });

    test('updateSubscriptions with expanding assets list', () async {
      reset(bridge);

      when(
        () => wallet.onMessageExpiredStream,
      ).thenAnswer((_) => expiredStream);
      when(
        () => wallet.onMessageSentStream,
      ).thenAnswer((_) => messageSentStream);
      when(
        () => wallet.onTransactionsFoundStream,
      ).thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.onStateChangedStream).thenAnswer((_) => stateStream);

      when(() => transport.transport).thenReturn(proto);
      when(() => proto.disposed).thenReturn(false);
      when(() => wallet.address).thenReturn(multisigAddress);
      when(() => proto.transportBox).thenReturn(box);

      when(
        () => bridge.crateApiMergedNtComputeTonWalletAddress(
          publicKey: any(named: 'publicKey'),
          walletType: any(named: 'walletType'),
          workchain: any(named: 'workchain'),
        ),
      ).thenAnswer((_) => '12345');
      when(
        () => bridge.crateApiMergedNtRepackAddress(
          address: any(named: 'address'),
        ),
      ).thenAnswer((_) => '12345');

      when(
        () => bridge.crateApiMergedTonWalletDartWrapperSubscribe(
          publicKey: any(named: 'publicKey'),
          transport: any(named: 'transport'),
          walletType: any(named: 'walletType'),
          workchainId: any(named: 'workchainId'),
          onCustodiansChanged: any(named: 'onCustodiansChanged'),
          onTransactionsFound: any(named: 'onTransactionsFound'),
          onDetailsChanged: any(named: 'onDetailsChanged'),
          onMessageExpired: any(named: 'onMessageExpired'),
          onMessageSent: any(named: 'onMessageSent'),
          onStateChanged: any(named: 'onStateChanged'),
          onUnconfirmedTransactionsChanged: any(
            named: 'onUnconfirmedTransactionsChanged',
          ),
        ),
      ).thenAnswer((call) {
        if (call.namedArguments[const Symbol('walletType')] ==
            jsonEncode(asset1.contract.toJson())) {
          return Future.delayed(const Duration(seconds: 1), () => tonWrapper1);
        }
        return Future.value(tonWrapper2);
      });
      mockTonWallet(tonWrapper1, asset1);
      mockTonWallet(tonWrapper2, asset2);

      unawaited(repository.updateSubscriptions([(asset1, false)]));
      await Future<void>.delayed(const Duration(milliseconds: 300));
      await repository.updateSubscriptions([(asset1, false), (asset2, false)]);

      expect(repository.wallets.length, 2);
      verify(
        () => bridge.crateApiMergedTonWalletDartWrapperSubscribe(
          publicKey: any(named: 'publicKey'),
          transport: any(named: 'transport'),
          walletType: jsonEncode(asset1.contract.toJson()),
          workchainId: any(named: 'workchainId'),
          onCustodiansChanged: any(named: 'onCustodiansChanged'),
          onTransactionsFound: any(named: 'onTransactionsFound'),
          onDetailsChanged: any(named: 'onDetailsChanged'),
          onMessageExpired: any(named: 'onMessageExpired'),
          onMessageSent: any(named: 'onMessageSent'),
          onStateChanged: any(named: 'onStateChanged'),
          onUnconfirmedTransactionsChanged: any(
            named: 'onUnconfirmedTransactionsChanged',
          ),
        ),
      ).called(1);
      verify(
        () => bridge.crateApiMergedTonWalletDartWrapperSubscribe(
          publicKey: any(named: 'publicKey'),
          transport: any(named: 'transport'),
          walletType: jsonEncode(asset2.contract.toJson()),
          workchainId: any(named: 'workchainId'),
          onCustodiansChanged: any(named: 'onCustodiansChanged'),
          onTransactionsFound: any(named: 'onTransactionsFound'),
          onDetailsChanged: any(named: 'onDetailsChanged'),
          onMessageExpired: any(named: 'onMessageExpired'),
          onMessageSent: any(named: 'onMessageSent'),
          onStateChanged: any(named: 'onStateChanged'),
          onUnconfirmedTransactionsChanged: any(
            named: 'onUnconfirmedTransactionsChanged',
          ),
        ),
      ).called(1);
    });

    test('updateTransportSubscriptions without side effects', () async {
      when(
        () => wallet.onMessageExpiredStream,
      ).thenAnswer((_) => expiredStream);
      when(
        () => wallet.onMessageSentStream,
      ).thenAnswer((_) => messageSentStream);
      when(
        () => wallet.onTransactionsFoundStream,
      ).thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.onStateChangedStream).thenAnswer((_) => stateStream);

      when(() => transport.transport).thenReturn(proto);
      when(() => proto.disposed).thenReturn(false);
      when(() => wallet.address).thenReturn(multisigAddress);
      when(() => proto.transportBox).thenReturn(box);
      when(() => tokenRepository.closeAllTokenSubscriptions()).thenReturn(null);

      if (GetIt.instance.isRegistered<TokenWalletRepository>()) {
        GetIt.instance.unregister<TokenWalletRepository>();
      }
      GetIt.instance.registerSingleton<TokenWalletRepository>(tokenRepository);

      when(
        () => bridge.crateApiMergedTonWalletDartWrapperSubscribe(
          publicKey: any(named: 'publicKey'),
          transport: any(named: 'transport'),
          walletType: any(named: 'walletType'),
          workchainId: any(named: 'workchainId'),
          onCustodiansChanged: any(named: 'onCustodiansChanged'),
          onTransactionsFound: any(named: 'onTransactionsFound'),
          onDetailsChanged: any(named: 'onDetailsChanged'),
          onMessageExpired: any(named: 'onMessageExpired'),
          onMessageSent: any(named: 'onMessageSent'),
          onStateChanged: any(named: 'onStateChanged'),
          onUnconfirmedTransactionsChanged: any(
            named: 'onUnconfirmedTransactionsChanged',
          ),
        ),
      ).thenAnswer((call) {
        if (call.namedArguments[const Symbol('walletType')] ==
            jsonEncode(asset1.contract.toJson())) {
          return Future.value(tonWrapper1);
        }
        return Future.value(tonWrapper2);
      });
      mockTonWallet(tonWrapper1, asset1);
      mockTonWallet(tonWrapper2, asset2);

      final state = TonWalletState.wallet(wallet);

      repository.walletsMap[asset1.address] = state;
      repository.walletsMap[asset2.address] = state;
      repository.lastUpdatedAssets = [(asset1, false), (asset2, false)];
      await repository.updateTransportSubscriptions();

      verify(wallet.dispose).called(2);
      verify(() => tokenRepository.closeAllTokenSubscriptions()).called(1);

      expect(repository.wallets.length, 2);
    });

    test('simulateTransactionTree', () async {
      const address = Address(address: '0:1234567890abcdef');
      const errors = [
        TxTreeSimulationErrorItem(
          address: address,
          error: TxTreeSimulationError(
            code: 1000,
            type: TxTreeSimulationErrorType.computePhase,
          ),
        ),
        TxTreeSimulationErrorItem(
          address: address,
          error: TxTreeSimulationError(
            code: 1000,
            type: TxTreeSimulationErrorType.actionPhase,
          ),
        ),
      ];
      final message = MockUnsignedMessage();

      when(
        () => wallet.onMessageExpiredStream,
      ).thenAnswer((_) => expiredStream);
      when(
        () => wallet.onMessageSentStream,
      ).thenAnswer((_) => messageSentStream);
      when(
        () => wallet.onTransactionsFoundStream,
      ).thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.onStateChangedStream).thenAnswer((_) => stateStream);

      when(() => transport.transport).thenReturn(proto);
      when(() => proto.disposed).thenReturn(false);
      when(() => wallet.address).thenReturn(multisigAddress);
      when(() => wallet.transport).thenReturn(proto);
      when(() => proto.transportBox).thenReturn(box);

      when(
        () => proto.simulateTransactionTree(
          signedMessage: any(named: 'signedMessage'),
          ignoredComputePhaseCodes: any(named: 'ignoredComputePhaseCodes'),
          ignoredActionPhaseCodes: any(named: 'ignoredActionPhaseCodes'),
        ),
      ).thenAnswer((_) => Future.value(errors));
      when(message.refreshTimeout).thenAnswer((_) async {});
      when(message.signFake).thenAnswer(
        (_) => Future.value(
          SignedMessage(boc: '', hash: '', expireAt: DateTime.now()),
        ),
      );

      repository.addWalletInst(wallet);

      final result1 = await repository.simulateTransactionTree(
        address: wallet.address,
        message: message,
      );
      expect(result1, equals(errors));

      final result2 = await repository.simulateTransactionTree(
        address: wallet.address,
        message: message,
        ignoredComputePhaseCodes: const [
          IgnoreTransactionTreeSimulationError(
            code: 1000,
            address: Address(address: '0:00000000000000000'),
          ),
        ],
        ignoredActionPhaseCodes: const [
          IgnoreTransactionTreeSimulationError(
            code: 1000,
            address: Address(address: '0:00000000000000000'),
          ),
        ],
      );
      expect(result2, equals(errors));

      final result3 = await repository.simulateTransactionTree(
        address: wallet.address,
        message: message,
        ignoredComputePhaseCodes: const [
          IgnoreTransactionTreeSimulationError(code: 1000, address: address),
        ],
      );
      expect(result3.length, 1);
      expect(result3.first.error.type, TxTreeSimulationErrorType.actionPhase);

      final result4 = await repository.simulateTransactionTree(
        address: wallet.address,
        message: message,
        ignoredActionPhaseCodes: const [
          IgnoreTransactionTreeSimulationError(code: 1000, address: address),
        ],
      );
      expect(result4.length, 1);
      expect(result4.first.error.type, TxTreeSimulationErrorType.computePhase);

      final result5 = await repository.simulateTransactionTree(
        address: wallet.address,
        message: message,
        ignoredActionPhaseCodes: const [
          IgnoreTransactionTreeSimulationError(code: 1000),
        ],
        ignoredComputePhaseCodes: const [
          IgnoreTransactionTreeSimulationError(code: 1000),
        ],
      );
      expect(result5, isEmpty);
    });
  });
}
