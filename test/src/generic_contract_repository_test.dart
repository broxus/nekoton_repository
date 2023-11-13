import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nekoton_repository/nekoton_repository.dart';
import 'package:nekoton_repository/src/repositories/ton_wallet_repository/ton_wallet_gql_block_poller.dart';
import 'package:nekoton_repository/src/utils/utils.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tuple/tuple.dart';

class MockBridge extends Mock implements NekotonBridge {}

class MockTransport extends Mock implements TransportStrategy {}

class MockContract extends Mock implements GenericContract {}

class MockGqlTransport extends Mock implements GqlTransport {}

class MockProtoTransport extends Mock implements ProtoTransport {}

class MockJrpcTransport extends Mock implements ProtoTransport {}

class GenericContractRepoTest with GenericContractRepositoryImpl {
  GenericContractRepoTest(
    this.currentTransport,
  );

  @override
  final MockTransport currentTransport;
}

void main() {
  late MockTransport transport;
  late MockContract contract;
  late MockGqlTransport gql;
  late MockProtoTransport proto;
  late MockJrpcTransport jrpc;
  late GenericContractRepoTest repository;

  late Stream<Tuple2<PendingTransaction, Transaction?>> messageSentStream;
  late Stream<PendingTransaction> expiredStream;
  late Stream<ContractState> stateStream;
  late Stream<Tuple2<List<Transaction>, TransactionsBatchInfo>>
      transactionsFoundStream;

  const address1 = Address(
    address:
        '0:91b689ad990660249eb00140577e6a98d70043ccaa7f63acfc0436336bdbd80f',
  );
  const address2 = Address(
    address:
        '0:d92c91860621eb5397957ee3f426860e2c21d7d4410626885f35db88a46a87c2',
  );

  final contractState = ContractState(
    balance: BigInt.zero,
    genTimings: const GenTimings(genLt: '', genUtime: 0),
    isDeployed: true,
  );

  final origin1 = Uri.parse('https://octusbridge.io/');
  final origin2 = Uri.parse('https://flatqube.io/');
  const tabId1 = 'TAB1';
  const updateSubsAll =
      ContractUpdatesSubscription(transactions: true, contractState: true);
  const updateNothingSub =
      ContractUpdatesSubscription(transactions: false, contractState: false);

  const batch = TransactionsBatchInfo(
    maxLt: '',
    minLt: '',
    batchType: TransactionsBatchType.newTransactions,
  );

  late TonWalletDartWrapper tonWrapper1;
  late TonWalletDartWrapper tonWrapper2;
  late ArcTonWalletBoxTrait walletBoxTrait;

  late MockBridge bridge;
  late ArcTransportBoxTrait box;

  /// We must use this method except of thenThrow because it will broke
  /// awaiting of refresh method. THIS IS SOME BUG IDK HOW TO FIX IT
  Future<T> throwError<T>() async {
    throw Exception('ERROR');
  }

  setUp(() {
    transport = MockTransport();
    contract = MockContract();
    repository = GenericContractRepoTest(transport);
    gql = MockGqlTransport();
    proto = MockProtoTransport();
    jrpc = MockJrpcTransport();

    bridge = MockBridge();
    box = ArcTransportBoxTrait.fromRaw(0, 0, bridge);
    registerFallbackValue(box);

    walletBoxTrait = ArcTonWalletBoxTrait.fromRaw(0, 0, bridge);
    tonWrapper1 = TonWalletDartWrapper(
      bridge: bridge,
      innerWallet: walletBoxTrait,
    );
    tonWrapper2 = TonWalletDartWrapper(
      bridge: bridge,
      innerWallet: walletBoxTrait,
    );
    registerFallbackValue(walletBoxTrait);
    registerFallbackValue(tonWrapper1);
    registerFallbackValue(tonWrapper2);

    messageSentStream = const Stream.empty();
    expiredStream = const Stream.empty();
    stateStream = const Stream.empty();
    transactionsFoundStream = const Stream.empty();
  });

  group('GenericContractRepository', () {
    test('addContractInst', () {
      when(() => contract.address).thenReturn(address1);

      final sub = GenericContractSubscriptionItem(
        tabId: tabId1,
        address: address1,
        contract: contract,
        origin: origin1,
        updateSubscriptionOptions: updateSubsAll,
      );

      repository.addContractInst(sub);

      expect(repository.allContracts.contains(sub), isTrue);

      verifyNever(() => contract.onMessageExpiredStream);
      verifyNever(() => contract.onMessageSentStream);
      verifyNever(() => contract.onTransactionsFoundStream);
      verifyNever(() => contract.onStateChangedStream);
    });

    test('removeContractInst', () {
      when(() => contract.address).thenReturn(address1);

      final sub = GenericContractSubscriptionItem(
        tabId: tabId1,
        address: address1,
        contract: contract,
        origin: origin1,
        updateSubscriptionOptions: updateSubsAll,
      );
      repository.allContracts.add(sub);

      final removed = repository.removeContractInst(
        address: sub.address,
        origin: sub.origin,
        tabId: sub.tabId,
      );

      expect(removed, sub);
      expect(repository.allContracts.isEmpty, isTrue);
    });

    test('unsubscribe', () {
      when(() => contract.address).thenReturn(address1);
      when(() => contract.dispose()).thenReturn(null);

      final sub = GenericContractSubscriptionItem(
        tabId: tabId1,
        address: address1,
        contract: contract,
        origin: origin1,
        updateSubscriptionOptions: updateSubsAll,
      );

      repository.allContracts.add(sub);
      repository.unsubscribeContract(
        tabId: sub.tabId,
        origin: sub.origin,
        address: sub.address,
      );

      verify(() => contract.dispose()).called(1);
      expect(repository.allContracts.isEmpty, isTrue);
    });

    test('unsubscribeTab', () {
      when(() => contract.address).thenReturn(address1);
      when(() => contract.dispose()).thenReturn(null);

      final sub1 = GenericContractSubscriptionItem(
        tabId: tabId1,
        address: address1,
        contract: contract,
        origin: origin1,
        updateSubscriptionOptions: updateSubsAll,
      );
      final sub2 = GenericContractSubscriptionItem(
        tabId: tabId1,
        address: address2,
        contract: contract,
        origin: origin2,
        updateSubscriptionOptions: updateNothingSub,
      );

      repository.allContracts.addAll([sub1, sub2]);
      repository.unsubscribeContractsTab(tabId1);

      verify(() => contract.dispose()).called(2);
      expect(repository.allContracts.isEmpty, isTrue);
    });

    test('tabSubscriptions', () {
      when(() => contract.address).thenReturn(address1);
      when(() => contract.dispose()).thenReturn(null);

      final sub1 = GenericContractSubscriptionItem(
        tabId: tabId1,
        address: address1,
        contract: contract,
        origin: origin1,
        updateSubscriptionOptions: updateSubsAll,
      );
      final sub2 = GenericContractSubscriptionItem(
        tabId: tabId1,
        address: address2,
        contract: contract,
        origin: origin2,
        updateSubscriptionOptions: updateNothingSub,
      );

      repository.allContracts.addAll([sub1, sub2]);

      final subs = repository.tabSubscriptions(tabId1);

      expect(subs, {
        address1: updateSubsAll,
        address2: updateNothingSub,
      });
    });

    test('tabTransactionsStream', () async {
      transactionsFoundStream =
          Stream.value(const Tuple2(<Transaction>[], batch));
      when(() => contract.onMessageExpiredStream)
          .thenAnswer((_) => expiredStream);
      when(() => contract.onMessageSentStream)
          .thenAnswer((_) => messageSentStream);
      when(() => contract.onTransactionsFoundStream)
          .thenAnswer((_) => transactionsFoundStream);
      when(() => contract.onStateChangedStream).thenAnswer((_) => stateStream);
      when(() => contract.address).thenReturn(address1);
      when(() => contract.dispose()).thenReturn(null);

      final sub1 = GenericContractSubscriptionItem(
        tabId: tabId1,
        address: address1,
        contract: contract,
        origin: origin1,
        updateSubscriptionOptions: updateSubsAll,
      );
      final sub2 = GenericContractSubscriptionItem(
        tabId: tabId1,
        address: address2,
        contract: contract,
        origin: origin2,
        updateSubscriptionOptions: updateNothingSub,
      );

      repository.allContracts.addAll([sub1, sub2]);

      final subs = await repository
          .tabTransactionsStream(tabId1)
          .takeUntil(
            // ignore unstoppable waiting, because this is stream
            Stream.fromFuture(
              Future<void>.delayed(const Duration(milliseconds: 300)),
            ),
          )
          .toList();

      expect(
        subs,
        [
          const ContractFoundTransactionEvent(
            address: address1,
            transactions: [],
            info: batch,
          ),
        ],
      );
    });

    test('tabStateChangesStream', () async {
      stateStream = Stream.value(contractState);
      when(() => contract.onMessageExpiredStream)
          .thenAnswer((_) => expiredStream);
      when(() => contract.onMessageSentStream)
          .thenAnswer((_) => messageSentStream);
      when(() => contract.onTransactionsFoundStream)
          .thenAnswer((_) => transactionsFoundStream);
      when(() => contract.onStateChangedStream).thenAnswer((_) => stateStream);
      when(() => contract.address).thenReturn(address1);
      when(() => contract.dispose()).thenReturn(null);

      final sub1 = GenericContractSubscriptionItem(
        tabId: tabId1,
        address: address1,
        contract: contract,
        origin: origin1,
        updateSubscriptionOptions: updateSubsAll,
      );
      final sub2 = GenericContractSubscriptionItem(
        tabId: tabId1,
        address: address2,
        contract: contract,
        origin: origin2,
        updateSubscriptionOptions: updateNothingSub,
      );

      repository.allContracts.addAll([sub1, sub2]);

      final subs = await repository
          .tabStateChangesStream(tabId1)
          .takeUntil(
            // ignore unstoppable waiting, because this is stream
            Stream.fromFuture(
              Future<void>.delayed(const Duration(milliseconds: 300)),
            ),
          )
          .toList();

      expect(
        subs,
        [ContractStateChangedEvent(address: address1, state: contractState)],
      );
    });
  });

  group('GenericContractRepository.send', () {
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
    registerFallbackValue(signedMessage);
    registerFallbackValue(address1);
    registerFallbackValue(nextBlockTimeout);

    ///--------------------------------------
    ///                  GQL
    ///--------------------------------------

    test('send GQL success', () async {
      // default settings for subscription
      when(() => contract.onMessageExpiredStream)
          .thenAnswer((_) => expiredStream);
      when(() => contract.onMessageSentStream).thenAnswer(
        (_) => Stream.fromFuture(
          Future.delayed(sendDuration, () {
            return Tuple2<PendingTransaction, Transaction?>(
              pendingTransaction,
              transaction,
            );
          }),
        ),
      );
      when(() => contract.onTransactionsFoundStream)
          .thenAnswer((_) => transactionsFoundStream);
      when(() => contract.onStateChangedStream).thenAnswer((_) => stateStream);
      when(() => contract.address).thenReturn(address1);
      when(contract.refresh).thenAnswer((_) => Future<void>.value());
      when(() => contract.refreshDescription).thenReturn('');

      when(() => contract.transport).thenReturn(gql);
      when(
        () => contract.send(
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
          address: address1,
          timeout: any(named: 'timeout'),
        ),
      ).thenAnswer((_) => Future.value(nextBlockId));
      when(() => gql.getBlock(id: any(named: 'id')))
          .thenAnswer((_) => Future.value(block));
      when(() => contract.handleBlock(block: any(named: 'block')))
          .thenAnswer((_) => Future<void>.value());
      final sub = GenericContractSubscriptionItem(
        tabId: tabId1,
        address: address1,
        contract: contract,
        origin: origin1,
        updateSubscriptionOptions: updateSubsAll,
      );
      repository.addContractInst(sub);

      ///----------------------------
      /// Main flow
      ///----------------------------

      final transactionFuture = repository.sendContract(
        address: address1,
        signedMessage: signedMessage,
      );

      /// wait for preparation completed
      await Future<void>.delayed(const Duration(seconds: 1));

      /// Wait for method completion
      final transactionResult = await transactionFuture;

      verify(() => contract.send(signedMessage: signedMessage)).called(1);

      // refresh flow
      verify(() => gql.getLatestBlock(address: address1)).called(1);
      verify(
        () => gql.waitForNextBlock(
          address: address1,
          currentBlockId: latestBlock.id,
          timeout: nextBlockTimeout,
        ),
      ).called(1);
      verify(() => gql.getBlock(id: nextBlockId)).called(1);
      verify(() => contract.handleBlock(block: block)).called(1);

      expect(transactionResult, transaction);
      expect(repository.allContracts.contains(sub), isTrue);
    });

    test('send GQL failed', () async {
      // default settings for subscription
      when(() => contract.onMessageExpiredStream)
          .thenAnswer((_) => expiredStream);
      // this should be avoided
      when(() => contract.onMessageSentStream).thenAnswer(
        (_) => Stream.fromFuture(
          Future.delayed(transactionExpiring, throwError),
        ),
      );
      when(() => contract.onTransactionsFoundStream)
          .thenAnswer((_) => transactionsFoundStream);
      when(() => contract.onStateChangedStream).thenAnswer((_) => stateStream);
      when(() => contract.address).thenReturn(address1);
      when(contract.refresh).thenAnswer((_) => Future<void>.value());
      when(() => contract.refreshDescription).thenReturn('');

      when(() => contract.transport).thenReturn(gql);
      when(
        () => contract.send(
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

      final sub = GenericContractSubscriptionItem(
        tabId: tabId1,
        address: address1,
        contract: contract,
        origin: origin1,
        updateSubscriptionOptions: updateSubsAll,
      );
      repository.addContractInst(sub);

      ///----------------------------
      /// Main flow
      ///----------------------------

      final transactionFuture = repository.sendContract(
        address: address1,
        signedMessage: signedMessage,
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

      verify(() => contract.send(signedMessage: signedMessage)).called(1);

      // refresh flow
      verify(() => gql.getLatestBlock(address: address1)).called(1);
      verifyNever(
        () => gql.waitForNextBlock(
          address: address1,
          currentBlockId: latestBlock.id,
          timeout: nextBlockTimeout,
        ),
      );
      verifyNever(() => gql.getBlock(id: nextBlockId));
      verifyNever(() => contract.handleBlock(block: block));

      expect(repository.allContracts.contains(sub), isTrue);
    });

    ///--------------------------------------
    ///                  PROTO
    ///--------------------------------------

    test('send PROTO success', () async {
      // default settings for subscription
      when(() => contract.onMessageExpiredStream)
          .thenAnswer((_) => expiredStream);
      when(() => contract.onMessageSentStream).thenAnswer(
        (_) => Stream.fromFuture(
          Future.delayed(sendDuration, () {
            return Tuple2<PendingTransaction, Transaction?>(
              pendingTransaction,
              transaction,
            );
          }),
        ),
      );
      when(() => contract.onTransactionsFoundStream)
          .thenAnswer((_) => transactionsFoundStream);
      when(() => contract.onStateChangedStream).thenAnswer((_) => stateStream);
      when(() => contract.address).thenReturn(address1);
      when(() => contract.refresh())
          .thenAnswer((_) => Future<void>.delayed(sendDuration));
      when(() => contract.refreshDescription).thenReturn('');

      when(() => contract.transport).thenReturn(proto);
      when(
        () => contract.send(
          signedMessage: any(named: 'signedMessage', that: isNotNull),
        ),
      ).thenAnswer((_) => Future.value(pendingTransaction));

      // Transport flow
      when(() => proto.networkId).thenReturn(networkId);
      when(() => proto.group).thenReturn(group);

      final sub = GenericContractSubscriptionItem(
        tabId: tabId1,
        address: address1,
        contract: contract,
        origin: origin1,
        updateSubscriptionOptions: updateSubsAll,
      );
      repository.addContractInst(sub);

      ///----------------------------
      /// Main flow
      ///----------------------------

      final transactionFuture = repository.sendContract(
        address: address1,
        signedMessage: signedMessage,
      );

      /// wait for preparation completed
      await Future<void>.delayed(const Duration(seconds: 1));

      /// Wait for method completion
      final transactionResult = await transactionFuture;

      verify(() => contract.send(signedMessage: signedMessage)).called(1);

      verify(() => contract.refresh()).called(1);

      expect(transactionResult, transaction);
      expect(repository.allContracts.contains(sub), isTrue);
    });

    test('send PROTO failed', () async {
      // default settings for subscription
      when(() => contract.onMessageExpiredStream)
          .thenAnswer((_) => expiredStream);
      // this should be avoided
      when(() => contract.onMessageSentStream).thenAnswer(
        (_) => Stream.fromFuture(
          Future.delayed(transactionExpiring, throwError),
        ),
      );
      when(() => contract.onTransactionsFoundStream)
          .thenAnswer((_) => transactionsFoundStream);
      when(() => contract.onStateChangedStream).thenAnswer((_) => stateStream);
      when(() => contract.address).thenReturn(address1);
      when(() => contract.refresh()).thenAnswer(
        (_) => Future<LatestBlock>.delayed(
          const Duration(seconds: 1),
          throwError,
        ),
      );
      when(() => contract.refreshDescription).thenReturn('');

      when(() => contract.transport).thenReturn(proto);
      when(
        () => contract.send(
          signedMessage: any(named: 'signedMessage', that: isNotNull),
        ),
      ).thenAnswer((_) => Future.value(pendingTransaction));

      // Transport flow
      when(() => proto.networkId).thenReturn(networkId);
      when(() => proto.group).thenReturn(group);

      final sub = GenericContractSubscriptionItem(
        tabId: tabId1,
        address: address1,
        contract: contract,
        origin: origin1,
        updateSubscriptionOptions: updateSubsAll,
      );
      repository.addContractInst(sub);

      ///----------------------------
      /// Main flow
      ///----------------------------

      final transactionFuture = repository.sendContract(
        address: address1,
        signedMessage: signedMessage,
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

      verify(() => contract.send(signedMessage: signedMessage)).called(1);

      // refresh flow
      verify(() => contract.refresh()).called(1);
      expect(repository.allContracts.contains(sub), isTrue);
    });

    ///--------------------------------------
    ///                  JRPC
    ///--------------------------------------

    test('send JRPC success', () async {
      // default settings for subscription
      when(() => contract.onMessageExpiredStream)
          .thenAnswer((_) => expiredStream);
      when(() => contract.onMessageSentStream).thenAnswer(
        (_) => Stream.fromFuture(
          Future.delayed(sendDuration, () {
            return Tuple2<PendingTransaction, Transaction?>(
              pendingTransaction,
              transaction,
            );
          }),
        ),
      );
      when(() => contract.onTransactionsFoundStream)
          .thenAnswer((_) => transactionsFoundStream);
      when(() => contract.onStateChangedStream).thenAnswer((_) => stateStream);
      when(() => contract.address).thenReturn(address1);
      when(() => contract.refresh())
          .thenAnswer((_) => Future<void>.delayed(sendDuration));
      when(() => contract.refreshDescription).thenReturn('');

      when(() => contract.transport).thenReturn(jrpc);
      when(
        () => contract.send(
          signedMessage: any(named: 'signedMessage', that: isNotNull),
        ),
      ).thenAnswer((_) => Future.value(pendingTransaction));

      // Transport flow
      when(() => jrpc.networkId).thenReturn(networkId);
      when(() => jrpc.group).thenReturn(group);

      final sub = GenericContractSubscriptionItem(
        tabId: tabId1,
        address: address1,
        contract: contract,
        origin: origin1,
        updateSubscriptionOptions: updateSubsAll,
      );
      repository.addContractInst(sub);

      ///----------------------------
      /// Main flow
      ///----------------------------

      final transactionFuture = repository.sendContract(
        address: address1,
        signedMessage: signedMessage,
      );

      /// wait for preparation completed
      await Future<void>.delayed(const Duration(seconds: 1));

      /// Wait for method completion
      final transactionResult = await transactionFuture;

      verify(() => contract.send(signedMessage: signedMessage)).called(1);

      verify(() => contract.refresh()).called(1);

      expect(transactionResult, transaction);
      expect(repository.allContracts.contains(sub), isTrue);
    });

    test('send JRPC failed', () async {
      // default settings for subscription
      when(() => contract.onMessageExpiredStream)
          .thenAnswer((_) => expiredStream);
      // this should be avoided
      when(() => contract.onMessageSentStream).thenAnswer(
        (_) => Stream.fromFuture(
          Future.delayed(transactionExpiring, throwError),
        ),
      );
      when(() => contract.onTransactionsFoundStream)
          .thenAnswer((_) => transactionsFoundStream);
      when(() => contract.onStateChangedStream).thenAnswer((_) => stateStream);
      when(() => contract.address).thenReturn(address1);
      when(() => contract.refresh()).thenAnswer(
        (_) => Future<LatestBlock>.delayed(
          const Duration(seconds: 1),
          throwError,
        ),
      );
      when(() => contract.refreshDescription).thenReturn('');

      when(() => contract.transport).thenReturn(jrpc);
      when(
        () => contract.send(
          signedMessage: any(named: 'signedMessage', that: isNotNull),
        ),
      ).thenAnswer((_) => Future.value(pendingTransaction));

      // Transport flow
      when(() => jrpc.networkId).thenReturn(networkId);
      when(() => jrpc.group).thenReturn(group);

      final sub = GenericContractSubscriptionItem(
        tabId: tabId1,
        address: address1,
        contract: contract,
        origin: origin1,
        updateSubscriptionOptions: updateSubsAll,
      );
      repository.addContractInst(sub);

      ///----------------------------
      /// Main flow
      ///----------------------------

      final transactionFuture = repository.sendContract(
        address: address1,
        signedMessage: signedMessage,
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

      verify(() => contract.send(signedMessage: signedMessage)).called(1);

      // refresh flow
      verify(() => contract.refresh()).called(1);
      expect(repository.allContracts.contains(sub), isTrue);
    });
  });
}
