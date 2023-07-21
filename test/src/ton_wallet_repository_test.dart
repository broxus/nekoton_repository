import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nekoton_repository/nekoton_repository.dart';
import 'package:nekoton_repository/src/repositories/ton_wallet_repository/ton_wallet_gql_block_poller.dart';
import 'package:tuple/tuple.dart';

class MockTransport extends Mock implements TransportStrategy {}

class MockKeystore extends Mock implements KeyStore {}

class MockWalletStorage extends Mock implements TonWalletTransactionsStorage {}

class MockWallet extends Mock implements TonWallet {}

class MockGqlTransport extends Mock implements GqlTransport {}

class MockJrpcTransport extends Mock implements JrpcTransport {}

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
  late MockJrpcTransport jrpc;

  late TonWalletRepoTest repository;

  late Stream<Tuple2<PendingTransaction, Transaction?>> messageSentStream;
  late Stream<PendingTransaction> expiredStream;
  late Stream<ContractState> stateStream;
  late Stream<
      Tuple2<List<TransactionWithData<TransactionAdditionalInfo?>>,
          TransactionsBatchInfo>> transactionsFoundStream;

  const address = Address(address: '0:1111111111111');
  const duplicateAddress = Address(address: '0:22222222222');

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
    jrpc = MockJrpcTransport();

    messageSentStream = const Stream.empty();
    expiredStream = const Stream.empty();
    stateStream = const Stream.empty();
    transactionsFoundStream = const Stream.empty();
  });

  group('TonWalletRepository', () {
    test('addWallet', () {
      when(() => wallet.onMessageExpiredStream)
          .thenAnswer((_) => expiredStream);
      when(() => wallet.onMessageSentStream)
          .thenAnswer((_) => messageSentStream);
      when(() => wallet.onTransactionsFoundStream)
          .thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.onStateChangedStream).thenAnswer((_) => stateStream);
      when(() => wallet.address).thenReturn(address);

      repository.addWalletInst(wallet);

      expect(repository.walletsMap[address], wallet);
      expect(repository.walletSubscriptions[address], isNotNull);

      verify(() => wallet.onMessageExpiredStream).called(1);
      verify(() => wallet.onMessageSentStream).called(1);
      verify(() => wallet.onTransactionsFoundStream).called(1);
      verify(() => wallet.onStateChangedStream).called(1);
    });

    test('removeWallet', () {
      when(() => wallet.onMessageExpiredStream)
          .thenAnswer((_) => expiredStream);
      when(() => wallet.onMessageSentStream)
          .thenAnswer((_) => messageSentStream);
      when(() => wallet.onTransactionsFoundStream)
          .thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.onStateChangedStream).thenAnswer((_) => stateStream);
      when(() => wallet.address).thenReturn(address);

      repository
        ..addWalletInst(wallet)
        ..removeWalletInst(address);

      expect(repository.walletsMap[address], isNull);
      expect(repository.walletSubscriptions[address], isNull);
    });

    test('unsubscribe', () {
      when(() => wallet.onMessageExpiredStream)
          .thenAnswer((_) => expiredStream);
      when(() => wallet.onMessageSentStream)
          .thenAnswer((_) => messageSentStream);
      when(() => wallet.onTransactionsFoundStream)
          .thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.onStateChangedStream).thenAnswer((_) => stateStream);
      when(() => wallet.address).thenReturn(address);
      when(wallet.dispose).thenReturn(null);
      when(wallet.refresh).thenAnswer((_) => Future<void>.value());
      when(() => wallet.refreshDescription).thenReturn('');

      final poller = RefreshPollingQueue(
        refresher: wallet,
        refreshInterval: tonWalletRefreshInterval,
      )..startPolling();

      repository.pollingQueues[address] = poller;

      repository
        ..addWalletInst(wallet)
        ..unsubscribe(address);

      expect(repository.walletsMap[address], isNull);
      expect(repository.walletSubscriptions[address], isNull);
      expect(repository.pollingQueues[address], isNull);
      expect(poller.isPolling, isFalse);

      verify(wallet.dispose).called(1);
    });

    test('stopPolling', () {
      when(() => wallet.onMessageExpiredStream)
          .thenAnswer((_) => expiredStream);
      when(() => wallet.onMessageSentStream)
          .thenAnswer((_) => messageSentStream);
      when(() => wallet.onTransactionsFoundStream)
          .thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.onStateChangedStream).thenAnswer((_) => stateStream);
      when(() => wallet.address).thenReturn(address);
      when(wallet.refresh).thenAnswer((_) => Future<void>.value());
      when(() => wallet.refreshDescription).thenReturn('');

      final poller1 = RefreshPollingQueue(
        refresher: wallet,
        refreshInterval: tonWalletRefreshInterval,
      )..startPolling();
      final poller2 = RefreshPollingQueue(
        refresher: wallet,
        refreshInterval: tonWalletRefreshInterval,
      )..startPolling();

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

    test('startPolling with clearing previous', () {
      when(() => wallet.onMessageExpiredStream)
          .thenAnswer((_) => expiredStream);
      when(() => wallet.onMessageSentStream)
          .thenAnswer((_) => messageSentStream);
      when(() => wallet.onTransactionsFoundStream)
          .thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.onStateChangedStream).thenAnswer((_) => stateStream);
      when(() => wallet.address).thenReturn(address);

      when(wallet.refresh).thenAnswer((_) => Future<void>.value());
      when(() => wallet.refreshDescription).thenReturn('');

      final oldPoller = RefreshPollingQueue(
        refresher: wallet,
        refreshInterval: tonWalletRefreshInterval,
      )..startPolling();

      repository.pollingQueues[duplicateAddress] = oldPoller;

      repository
        ..addWalletInst(wallet)
        ..startPolling(address);

      expect(repository.pollingQueues[address], isNotNull);
      expect(repository.pollingQueues[address]!.isPolling, isTrue);
      expect(repository.pollingQueues[duplicateAddress], isNull);
      expect(oldPoller.isPolling, false);
    });

    test('startPolling without clearing previous', () {
      when(() => wallet.onMessageExpiredStream)
          .thenAnswer((_) => expiredStream);
      when(() => wallet.onMessageSentStream)
          .thenAnswer((_) => messageSentStream);
      when(() => wallet.onTransactionsFoundStream)
          .thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.onStateChangedStream).thenAnswer((_) => stateStream);
      when(() => wallet.address).thenReturn(address);

      final oldPoller = RefreshPollingQueue(
        refresher: wallet,
        refreshInterval: tonWalletRefreshInterval,
      )..startPolling();

      repository.pollingQueues[duplicateAddress] = oldPoller;

      repository
        ..addWalletInst(wallet)
        ..startPolling(address, stopPrevious: false);

      expect(repository.pollingQueues[address], isNotNull);
      expect(repository.pollingQueues[address]!.isPolling, isTrue);
      expect(repository.pollingQueues[duplicateAddress], isNotNull);
      expect(oldPoller.isPolling, true);
    });
  });

  group('TonWallet.send', () {
    // 1 ever
    final amount = BigInt.parse('1000000000');
    const transactionExpiring = Duration(seconds: 10);
    final pendingTransaction = PendingTransaction(
      messageHash: 'messageHash',
      expireAt: DateTime.now().add(transactionExpiring),
    );
    const sendDuration = Duration(seconds: 3);
    final signedMessage = SignedMessage(
      hash: 'hash',
      expireAt: DateTime.now(),
      boc: 'boc',
    );
    const latestBlock = LatestBlock(
      id: 'latest',
      endLt: 0,
      genUtime: 0,
    );
    const nextBlockId = 'next';
    const block = 'block';
    const networkId = 111;
    const group = 'group';
    final transaction = Transaction(
      id: const TransactionId(hash: 'hash', lt: 'lt'),
      createdAt: DateTime.now(),
      aborted: false,
      origStatus: AccountStatus.active,
      endStatus: AccountStatus.active,
      totalFees: amount,
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
      createdAt: DateTime.now(),
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
      when(() => wallet.onMessageExpiredStream)
          .thenAnswer((_) => expiredStream);
      when(() => wallet.onMessageSentStream).thenAnswer(
        (_) => Stream.fromFuture(
          Future.delayed(sendDuration, () {
            return Tuple2<PendingTransaction, Transaction?>(
              pendingTransaction,
              transaction,
            );
          }),
        ),
      );
      when(() => wallet.onTransactionsFoundStream)
          .thenAnswer((_) => transactionsFoundStream);
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
      when(() => gql.getLatestBlock(address: any(named: 'address')))
          .thenAnswer((_) => Future.value(latestBlock));
      when(
        () => gql.waitForNextBlock(
          currentBlockId: any(named: 'currentBlockId'),
          address: address,
          timeout: any(named: 'timeout'),
        ),
      ).thenAnswer((_) => Future.value(nextBlockId));
      when(() => gql.getBlock(id: any(named: 'id')))
          .thenAnswer((_) => Future.value(block));
      when(() => wallet.handleBlock(block: any(named: 'block')))
          .thenAnswer((_) => Future<void>.value());

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
        refreshInterval: tonWalletRefreshInterval,
      )..startPolling();
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
      expect(repository.walletsMap[address], isNotNull);
      expect(repository.walletSubscriptions[address], isNotNull);
      expect(repository.pollingQueues[address], isNotNull);
      expect(oldPoller.isPolling, isTrue);
    });

    test('send GQL failed', () async {
      // default settings for subscription
      when(() => wallet.onMessageExpiredStream)
          .thenAnswer((_) => expiredStream);
      // this should be avoided
      when(() => wallet.onMessageSentStream).thenAnswer(
        (_) => Stream.fromFuture(
          Future.delayed(transactionExpiring, throwError),
        ),
      );
      when(() => wallet.onTransactionsFoundStream)
          .thenAnswer((_) => transactionsFoundStream);
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
        (_) => Future<LatestBlock>.delayed(
          const Duration(seconds: 1),
          throwError,
        ),
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
        refreshInterval: tonWalletRefreshInterval,
      )..startPolling();
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

      expect(repository.walletsMap[address], isNotNull);
      expect(repository.walletSubscriptions[address], isNotNull);
      expect(repository.pollingQueues[address], isNotNull);
      expect(oldPoller.isPolling, isTrue);
    });

    ///--------------------------------------
    ///                  JRPC
    ///--------------------------------------

    test('send JRPC success', () async {
      // default settings for subscription
      when(() => wallet.onMessageExpiredStream)
          .thenAnswer((_) => expiredStream);
      when(() => wallet.onMessageSentStream).thenAnswer(
        (_) => Stream.fromFuture(
          Future.delayed(sendDuration, () {
            return Tuple2<PendingTransaction, Transaction?>(
              pendingTransaction,
              transaction,
            );
          }),
        ),
      );
      when(() => wallet.onTransactionsFoundStream)
          .thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.onStateChangedStream).thenAnswer((_) => stateStream);
      when(() => wallet.address).thenReturn(address);
      when(() => wallet.refresh())
          .thenAnswer((_) => Future<void>.delayed(sendDuration));
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
      expect(repository.walletsMap[address], isNotNull);
      expect(repository.walletSubscriptions[address], isNotNull);
      expect(repository.pollingQueues[address], isNull);
    });

    test('send JRPC failed', () async {
      // default settings for subscription
      when(() => wallet.onMessageExpiredStream)
          .thenAnswer((_) => expiredStream);
      // this should be avoided
      when(() => wallet.onMessageSentStream).thenAnswer(
        (_) => Stream.fromFuture(
          Future.delayed(transactionExpiring, throwError),
        ),
      );
      when(() => wallet.onTransactionsFoundStream)
          .thenAnswer((_) => transactionsFoundStream);
      when(() => wallet.onStateChangedStream).thenAnswer((_) => stateStream);
      when(() => wallet.address).thenReturn(address);
      when(() => wallet.refresh()).thenAnswer(
        (_) => Future<LatestBlock>.delayed(
          const Duration(seconds: 1),
          throwError,
        ),
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

      expect(repository.walletsMap[address], isNotNull);
      expect(repository.walletSubscriptions[address], isNotNull);
      expect(repository.pollingQueues[address], isNull);
    });
  });
}
