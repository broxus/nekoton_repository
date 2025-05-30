import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

import 'package:nekoton_repository/nekoton_repository.dart';
import 'package:nekoton_repository/src/repositories/generic_contract_repository/contract_gql_block_poller.dart';
import 'package:rxdart/rxdart.dart';

mixin GenericContractRepositoryImpl implements GenericContractRepository {
  final _logger = Logger('GenericContractRepositoryImpl');

  /// Current transport of application
  TransportStrategy get currentTransport;

  /// Stream of all contract that were created for any browser tab via
  /// [subscribeContract].
  final _contractSubscriptions =
      BehaviorSubject<List<GenericContractSubscriptionItem>>.seeded([]);

  List<GenericContractSubscriptionItem> get allContracts =>
      _contractSubscriptions.value;

  @override
  Map<Address, ContractUpdatesSubscription>? tabSubscriptions(String tabId) => {
        for (final item in allContracts.where((c) => c.tabId == tabId))
          item.address: item.updateSubscriptionOptions,
      };

  @override
  Stream<ContractFoundTransactionEvent> tabTransactionsStream(String tabId) =>
      _contractSubscriptions
          .expand((list) => list)
          .where(
            (c) =>
                c.tabId == tabId &&
                (c.updateSubscriptionOptions.transactions ?? false),
          )
          .flatMap(
            (c) => c.contract.onTransactionsFoundStream.map(
              (event) => ContractFoundTransactionEvent(
                address: c.address,
                transactions: event.$1,
                info: event.$2,
              ),
            ),
          );

  @override
  Stream<ContractStateChangedEvent> tabStateChangesStream(String tabId) =>
      _contractSubscriptions
          .expand((list) => list)
          .where(
            (c) =>
                c.tabId == tabId &&
                (c.updateSubscriptionOptions.contractState ?? false),
          )
          .flatMap(
            (c) => c.contract.onStateChangedStream.map(
              (state) => ContractStateChangedEvent(
                address: c.address,
                state: state,
              ),
            ),
          );

  @override
  Future<GenericContract> subscribeContract({
    required String tabId,
    required Uri origin,
    required Address address,
    required ContractUpdatesSubscription contractUpdatesSubscription,
  }) async {
    final transport = currentTransport.transport;
    final contract = await GenericContract.subscribe(
      transport: transport,
      address: address,
      preloadTransactions: false,
    );

    addContractInst(
      GenericContractSubscriptionItem(
        tabId: tabId,
        address: address,
        contract: contract,
        origin: origin,
        updateSubscriptionOptions: contractUpdatesSubscription,
      ),
    );

    return contract;
  }

  @override
  void unsubscribeContract({
    required String tabId,
    required Uri origin,
    required Address address,
  }) {
    removeContractInst(
      tabId: tabId,
      origin: origin,
      address: address,
    )?.contract.dispose();
  }

  @override
  void unsubscribeAllContracts() {
    final contracts = allContracts;

    if (contracts.isEmpty) return;

    for (final contract in contracts) {
      contract.contract.dispose();
    }

    _contractSubscriptions.add([]);
  }

  @override
  void unsubscribeContractsTab(String tabId) {
    // copy list to avoid concurrent modification
    final possible = List<GenericContractSubscriptionItem>.from(
      _contractSubscriptions.value.where((c) => c.tabId == tabId),
    );

    for (final contract in possible) {
      removeContractInst(
        tabId: tabId,
        origin: contract.origin,
        address: contract.address,
      )?.contract.dispose();
    }
  }

  @override
  void updateContractTransportSubscriptions() {
    final contractListClone =
        List<GenericContractSubscriptionItem>.from(allContracts);
    for (final contract in contractListClone) {
      unsubscribeContract(
        tabId: contract.tabId,
        origin: contract.origin,
        address: contract.address,
      );
    }
  }

  @override
  Future<Transaction> executeTransactionLocally({
    required Address address,
    required SignedMessage signedMessage,
    required TransactionExecutionOptions options,
  }) {
    final contract = getContractByAddress(address);

    return contract.executeTransactionLocally(
      signedMessage: signedMessage,
      options: options,
    );
  }

  @override
// ignore: long-method
  Future<Transaction> waitContractSending({
    required Address address,
    required PendingTransaction pending,
  }) async {
    final contract = getContractByAddress(address);
    final transport = contract.transport;

    final completer = Completer<Transaction>();

    // This is a poller, that lets subscribe for next pending transaction
    // in code below.
    late RefreshPollingQueue poller;

    // Stop this poller sending any requests
    void completePolling() {
      poller.stop();
    }

    void createPoller(RefreshingInterface refresher) {
      poller = RefreshPollingQueue(
        refresher: refresher,
        refreshInterval: intensivePollingInterval,
        refreshCompleteCallback: ([(Object, StackTrace)? err]) {
          if (err != null) {
            _logger.severe(
              '${transport.runtimeType} GenericContract Reliable polling error',
              err.$1,
              err.$2,
            );
            completePolling();
            if (!completer.isCompleted) completer.completeError(err.$1, err.$2);
          }
          if (contract.pollingMethod != PollingMethod.reliable) {
            // Being here means, that onMessageSentStream got data
            completePolling();
          }
        },
        // refresh immediately to start polling without delay
      )..start(refreshImmediately: true);
    }

    if (transport is GqlTransport) {
      createPoller(
        GenericContractGqlBlockPoller(contract: contract, transport: transport),
      );
    } else if (transport is ProtoTransport || transport is JrpcTransport) {
      createPoller(contract);
    } else {
      completer.completeError(Exception('Invalid transport'));

      // avoid starting listening if transport is wrong, typically impossible
      return completer.future;
    }

    void onStreamCompletedError(OperationCanceledException err, StackTrace st) {
      if (!completer.isCompleted) completer.completeError(err, st);
      completePolling();
    }

    void onError(Object err, StackTrace st) {
      _logger.severe(
        'Generic contract send transaction ${transport.runtimeType}',
        err,
        st,
      );
      if (!completer.isCompleted) completer.completeError(err, st);
      completePolling();
    }

    void onSent((PendingTransaction, Transaction?) v) {
      if (!completer.isCompleted) completer.complete(v.$2);
      completePolling();
    }

    unawaited(
      contract.onMessageSentStream
          .firstWhere(
            (e) => e.$1 == pending && e.$2 != null,
            orElse: () => throw const OperationCanceledException(),
          )
          .timeout(pending.expireAt.toTimeout())
          .then(onSent)
          .onError<OperationCanceledException>(onStreamCompletedError)
          .onError<Object>(onError),
    );

    return completer.future;
  }

  @override
  Future<PendingTransaction> sendContractUnawaited({
    required Address address,
    required SignedMessage signedMessage,
  }) async {
    final contract = getContractByAddress(address);

    return contract.send(signedMessage: signedMessage);
  }

  @override
  Future<Transaction> sendContract({
    required Address address,
    required SignedMessage signedMessage,
  }) async {
    final pendingTransaction = await sendContractUnawaited(
      address: address,
      signedMessage: signedMessage,
    );

    return waitContractSending(
      address: address,
      pending: pendingTransaction,
    );
  }

  @override
  GenericContract getContractByAddress(Address address) =>
      _contractSubscriptions.value
          .firstWhere((c) => c.address == address)
          .contract;

  /// This is internal method to add contract to cache.
  /// You must not call this method directly form app, use [subscribeContract].
  @protected
  @visibleForTesting
  void addContractInst(GenericContractSubscriptionItem item) {
    final created = allContracts;
    final updated = [...created, item];
    _contractSubscriptions.add(updated);
  }

  /// This is internal method to remove contract from cache.
  /// You must not call this method directly form app, use [unsubscribeContract]
  @protected
  @visibleForTesting
  GenericContractSubscriptionItem? removeContractInst({
    required String tabId,
    required Uri origin,
    required Address address,
  }) {
    final contracts = allContracts;
    final toRemoveIndex = contracts.indexWhere(
      (item) =>
          item.address == address &&
          item.tabId == tabId &&
          item.origin == origin,
    );
    if (toRemoveIndex == -1) return null;

    return contracts.removeAt(toRemoveIndex);
  }
}
