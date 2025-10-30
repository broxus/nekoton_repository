import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:logging/logging.dart';
import 'package:nekoton_repository/nekoton_repository.dart';
import 'package:rxdart/rxdart.dart';

const _indexCode =
    'te6ccgECHQEAA1UAAgaK2zUcAQQkiu1TIOMDIMD/4wIgwP7jAvILGQMCGwOK7UTQ10nDAfhmifhpIds80wABn4ECANcYIPkBWPhC+RDyqN7TPwH4QyG58rQg+COBA+iogggbd0CgufK0+GPTHwHbPPI8DgsEA3rtRNDXScMB+GYi0NMD+kAw+GmpOAD4RH9vcYIImJaAb3Jtb3Nwb3T4ZNwhxwDjAiHXDR/yvCHjAwHbPPI8GBgEAzogggujrde64wIgghAWX5bBuuMCIIIQR1ZU3LrjAhMPBQRCMPhCbuMA+EbycyGT1NHQ3vpA0fhBiMjPjits1szOyds8CxwIBgJqiCFus/LoZiBu8n/Q1PpA+kAwbBL4SfhKxwXy4GT4ACH4a/hs+kJvE9cL/5Mg+GvfMNs88gAHFAA8U2FsdCBkb2Vzbid0IGNvbnRhaW4gYW55IHZhbHVlAhjQIIs4rbNYxwWKiuIJCgEK103Q2zwKAELXTNCLL0pA1yb0BDHTCTGLL0oY1yYg10rCAZLXTZIwbeICFu1E0NdJwgGOgOMNDBcCSnDtRND0BXEhgED0Do6A34kg+Gz4a/hqgED0DvK91wv/+GJw+GMNDgECiQ4AQ4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAD/jD4RvLgTPhCbuMA0x/4RFhvdfhk0ds8I44mJdDTAfpAMDHIz4cgznHPC2FeIMjPkll+WwbOWcjOAcjOzc3NyXCOOvhEIG8TIW8S+ElVAm8RyM+EgMoAz4RAzgH6AvQAcc8LaV4gyPhEbxXPCx/OWcjOAcjOzc3NyfhEbxTi+wAXEhABCOMA8gARACjtRNDT/9M/MfhDWMjL/8s/zsntVAAi+ERwb3KAQG90+GT4S/hM+EoDNjD4RvLgTPhCbuMAIZPU0dDe+kDR2zww2zzyABcVFAA6+Ez4S/hK+EP4QsjL/8s/z4POWcjOAcjOzc3J7VQBMoj4SfhKxwXy6GXIz4UIzoBvz0DJgQCg+wAWACZNZXRob2QgZm9yIE5GVCBvbmx5AELtRNDT/9M/0wAx+kDU0dD6QNTR0PpA0fhs+Gv4avhj+GIACvhG8uBMAgr0pCD0oRsaABRzb2wgMC41OC4yAAAADCD4Ye0e2Q==';

const _transferAbiParams = [
  AbiParam(name: 'id', type: 'string'),
  AbiParam(name: 'collection', type: 'address'),
];

mixin NftRepositoryImpl implements NftRepository {
  TransportStrategy get currentTransport;
  AbiLoader get abiLoader;
  NftDataProvider get nftDataProvider;

  final _logger = Logger('NftRepositoryImpl');
  final _cachedContractStateProvider = CachedContractStateProvider();
  final _walletSubscriptions = <Address, TonWalletSubscription>{};
  final _transferEventSubject = PublishSubject<NftTransferEvent>();

  @override
  Stream<NftTransferEvent> get nftTransferEventStream =>
      _transferEventSubject.stream;

  @override
  void subscribeToWalletNftTransfers({
    required TonWallet wallet,
    required LatestLtTracker tracker,
  }) {
    unsubscribeFromWalletNftTransfers(wallet.address);

    _walletSubscriptions[wallet.address] = TonWalletSubscription(
      tonWallet: wallet,
      onTransactionsFound: (event) => _handleTransactions(
        address: wallet.address,
        transactions: event.$1,
        batchInfo: event.$2,
        tracker: tracker,
      ),
    );
  }

  @override
  void unsubscribeFromWalletNftTransfers(Address address) {
    final subscription = _walletSubscriptions.remove(address);
    subscription?.close();
  }

  @override
  Future<List<NftCollection>> scanNftCollections({
    required Address owner,
    required List<Address> collections,
  }) {
    return currentTransport.transport.use(() async {
      final apiBaseUrl = currentTransport.nftApiBaseUrl;
      final result = await Future.wait(
        collections.map((collection) async {
          try {
            if (apiBaseUrl != null && apiBaseUrl.isNotEmpty) {
              final list = await nftDataProvider.getNftList(
                collection: collection,
                owner: owner,
                limit: 1,
              );

              return list.items.isNotEmpty
                  ? getNftCollection(collection)
                  : null;
            }

            final [nft, fungible] = await Future.wait([
              _getNftIndexes(
                type: NftType.nft,
                collection: collection,
                owner: owner,
                limit: 1,
              ),
              _getNftIndexes(
                type: NftType.fungible,
                collection: collection,
                owner: owner,
                limit: 1,
              ),
            ]);

            if (nft.accounts.isEmpty && fungible.accounts.isEmpty) return null;

            return getNftCollection(collection);
          } catch (e) {
            _logger.warning('Failed to scan NFT collection: $e');
            return null;
          }
        }),
      );

      return result.nonNulls.toList();
    });
  }

  @override
  Future<NftCollection?> tryGetNftCollection({
    required Address address,
    required Address owner,
  }) {
    return currentTransport.transport.use(() async {
      NftItem? nftItem;
      try {
        nftItem = await getNftItem(address: address, owner: owner);
      } catch (_) {}

      if (nftItem != null &&
          nftItem.nft.owner != owner &&
          (nftItem.wallet == null || nftItem.wallet!.balance == BigInt.zero)) {
        // not the owner of the NFT and don't have balance/wallet if VEP-1155
        return null;
      }

      try {
        return await getNftCollection(nftItem?.nft.collection ?? address);
      } catch (e) {
        _logger.warning('Failed to get NFT collection: $e');
        return null;
      }
    });
  }

  @override
  Future<NftList> getNftList({
    required Address collection,
    required Address owner,
    required int limit,
    String? continuation,
  }) {
    final apiBaseUrl = currentTransport.nftApiBaseUrl;
    if (apiBaseUrl != null && apiBaseUrl.isNotEmpty) {
      return nftDataProvider.getNftList(
        collection: collection,
        owner: owner,
        limit: limit,
        offset: continuation != null ? int.tryParse(continuation) : null,
      );
    }

    return currentTransport.transport.use(() async {
      final isVep1155 = await _supportsInterface(
        address: collection,
        interface: ContractInterface.vep1155Collection,
      );
      final list = await _getNftIndexes(
        type: isVep1155 ? NftType.fungible : NftType.nft,
        collection: collection,
        owner: owner,
        limit: limit,
        continuation: continuation,
      );

      final items = await Future.wait(
        list.accounts.map((account) async {
          try {
            final result = await _callContract(
              type: AbiType.tip43,
              address: Address(address: account),
              methodId: 'getInfo',
              responsible: true,
              input: {'answerId': 0},
            );
            final address = Address(address: result['nft'] as String);

            if (!isVep1155) {
              return NftItem(nft: await _getNft(address));
            }

            // For VEP-1155, returned address is multitoken wallet
            // and we need to get NFT address from it
            final wallet = await getMultitokenWallet(address);
            if (wallet == null) {
              throw Exception('Multitoken wallet not found: $address');
            }

            final nftAddress = await getNftAddressById(
              id: wallet.info.id,
              collection: collection,
            );

            return NftItem(nft: await _getNft(nftAddress), wallet: wallet);
          } catch (e) {
            _logger.warning('Failed to get NFT: $e');
            return null;
          }
        }),
      );

      return NftList(
        items: items.nonNulls.toList(),
        continuation: list.continuation,
      );
    });
  }

  @override
  Future<NftItem> getNftItem({
    required Address address,
    required Address owner,
  }) {
    return currentTransport.transport.use(() async {
      MultitokenWallet? wallet;
      final nft = await _getNft(address);
      final isVep1155 = await _supportsInterface(
        address: address,
        interface: ContractInterface.vep1155Nft,
      );

      if (isVep1155) {
        final result = await _callContract(
          type: AbiType.vep1155Collection,
          address: nft.collection,
          methodId: 'multiTokenWalletAddress',
          responsible: true,
          input: {'answerId': 0, 'id': nft.id, 'owner': owner},
        );
        final walletAddress = result['token'] as String;

        wallet = await getMultitokenWallet(Address(address: walletAddress));
      }

      return NftItem(nft: nft, wallet: wallet);
    });
  }

  @override
  Future<NftCollection> getNftCollection(Address address) {
    return currentTransport.transport.use(() async {
      final interfaces = await _getSupportedInterfaces(
        address: address,
        interfaces: [
          ContractInterface.tip41Collection,
          ContractInterface.tip422Collection,
          ContractInterface.vep1155Collection,
        ],
      );

      final json = interfaces.contains(ContractInterface.tip422Collection)
          ? await _getTip422CollectionJson(address)
          : await _getJsonFromContract(address, AbiType.collection);

      return NftCollection(
        address: address,
        json: json ?? NftJsonData.empty(),
        interfaces: interfaces,
      );
    });
  }

  @override
  Future<MultitokenWallet?> getMultitokenWallet(Address address) async {
    try {
      return currentTransport.transport.use(() async {
        final [info, balance] = await Future.wait([
          _callContract(
            type: AbiType.vep1155Wallet,
            address: address,
            methodId: 'getInfo',
            responsible: true,
            input: {'answerId': 0},
          ),
          _callContract(
            type: AbiType.vep1155Wallet,
            address: address,
            methodId: 'balance',
            responsible: true,
            input: {'answerId': 0},
          ),
        ]);

        return MultitokenWallet(
          address: address,
          info: MultitokenWalletInfo.fromJson(info),
          balance: BigInt.parse(balance['value'] as String),
        );
      });
    } catch (e) {
      _logger.warning('Failed to get multitoken wallet: $e');
      return null;
    }
  }

  @override
  Future<Address> getNftAddressById({
    required String id,
    required Address collection,
  }) async {
    final result = await _callContract(
      type: AbiType.collection,
      address: collection,
      methodId: 'nftAddress',
      responsible: true,
      input: {'answerId': 0, 'id': id},
    );

    return Address(address: result['nft'] as String);
  }

  @override
  Future<InternalMessage> prepareNftTransfer({
    required Address address,
    required Address owner,
    required Address recipient,
    required Address sendGasTo,
  }) async {
    return currentTransport.transport.use(() async {
      final body = await encodeInternalInput(
        contractAbi: await abiLoader.load(AbiType.nft),
        method: 'transfer',
        input: NftTransferInput(
          to: recipient,
          sendGasTo: sendGasTo,
          callbacks: {
            owner: NftCallbackPayload(
              value: BigInt.parse('100000000'),
              payload: '',
            ),
            recipient: NftCallbackPayload(
              value: BigInt.parse('100000000'),
              payload: '',
            ),
          },
        ).toJson(),
      );

      return InternalMessage(
        source: owner,
        body: body,
        destination: address,
        amount: BigInt.parse('3000000000'),
        bounce: true,
      );
    });
  }

  @override
  Future<InternalMessage> prepareNftTokenTransfer({
    required String id,
    required BigInt count,
    required Address collection,
    required Address owner,
    required Address recipient,
    required Address remainingGasTo,
  }) async {
    return currentTransport.transport.use(() async {
      final (payload, _) = packIntoCell(
        params: _transferAbiParams,
        tokens: NftTokenTransferPayload(
          id: id,
          collection: collection,
        ).toJson(),
      );
      final body = await encodeInternalInput(
        contractAbi: await abiLoader.load(AbiType.vep1155Wallet),
        method: 'transfer',
        input: NftTokenTransferInput(
          count: count,
          deployTokenWalletValue: BigInt.parse('1000000000'),
          recipient: recipient,
          remainingGasTo: remainingGasTo,
          payload: payload,
          notify: true,
        ).toJson(),
      );

      final result = await _callContract(
        type: AbiType.vep1155Collection,
        address: collection,
        methodId: 'multiTokenWalletAddress',
        responsible: true,
        input: {'answerId': 0, 'id': id, 'owner': owner},
      );

      return InternalMessage(
        source: owner,
        body: body,
        destination: Address(address: result['token'] as String),
        amount: BigInt.parse('2000000000'),
        bounce: true,
      );
    });
  }

  Future<Nft> _getNft(Address address) async {
    final [isTip422, isVep1155] = await Future.wait([
      _supportsInterface(
        address: address,
        interface: ContractInterface.tip422Nft,
      ),
      _supportsInterface(
        address: address,
        interface: ContractInterface.vep1155Nft,
      ),
    ]);
    final info = NftInfo.fromJson(
      await _callContract(
        type: AbiType.nft,
        address: address,
        methodId: 'getInfo',
        responsible: true,
        input: {'answerId': 0},
      ),
    );

    final supply = isVep1155 ? await _getMultitokenSupply(address) : null;
    final json = isTip422
        ? await _getTip422NftJson(address: address, collection: info.collection)
        : await _getJsonFromContract(address, AbiType.nft);

    return Nft(
      address: address,
      info: info,
      json: json ?? NftJsonData.empty(),
      supply: supply,
    );
  }

  Future<NftJsonData?> _getTip422CollectionJson(Address address) async {
    try {
      final result = await _callContract(
        type: AbiType.tip422Collection,
        address: address,
        methodId: 'getCollectionUrl',
        responsible: true,
        input: {'answerId': 0},
      );
      final url = result['collectionUrl'] as String;
      final json = await currentTransport.fetchJson(url);

      return json != null ? NftJsonData.fromJson(json) : null;
    } catch (e) {
      _logger.warning('Failed to get TIP-422 collection JSON: $e');
      return null;
    }
  }

  Future<NftJsonData?> _getJsonFromContract(
    Address address,
    AbiType type,
  ) async {
    try {
      final result = await _callContract(
        type: type,
        address: address,
        methodId: 'getJson',
        responsible: true,
        input: {'answerId': 0},
      );

      return NftJsonData.fromJson(
        jsonDecode(result['json'] as String) as Map<String, dynamic>,
      );
    } catch (e) {
      _logger.warning('Failed to get JSON: $e');
      return null;
    }
  }

  Future<BigInt?> _getMultitokenSupply(Address address) async {
    try {
      final result = await _callContract(
        type: AbiType.vep1155Nft,
        address: address,
        methodId: 'multiTokenSupply',
        responsible: true,
        input: {'answerId': 0},
      );
      return BigInt.parse(result['count'] as String);
    } catch (_) {
      return null;
    }
  }

  Future<NftJsonData?> _getTip422NftJson({
    required Address address,
    required Address collection,
  }) async {
    try {
      final parts = await _callContract(
        type: AbiType.tip422Nft,
        address: address,
        methodId: 'getUrlParts',
        responsible: true,
        input: {'answerId': 0},
      );
      final result = await _callContract(
        type: AbiType.tip422Collection,
        address: collection,
        methodId: 'getNftUrl',
        responsible: true,
        input: {'answerId': 0, 'parts': parts['part']},
      );
      final url = result['nftUrl'] as String;
      final json = await currentTransport.fetchJson(url);

      return json != null ? NftJsonData.fromJson(json) : null;
    } catch (e) {
      _logger.warning('Failed to get TIP-422 collection JSON: $e');
      return null;
    }
  }

  Future<AccountsList> _getNftIndexes({
    required NftType type,
    required Address collection,
    required Address owner,
    required int limit,
    String? continuation,
  }) async {
    final (boc, _) = packIntoCell(
      abiVersion: '2.0', // !!! abi version 2.0; do not change
      params: switch (type) {
        NftType.nft => const [
          AbiParam(name: 'collection', type: 'address'),
          AbiParam(name: 'owner', type: 'address'),
          AbiParam(name: 'stamp', type: 'fixedbytes3'),
        ],
        NftType.fungible => const [
          AbiParam(name: 'collection', type: 'address'),
          AbiParam(name: 'owner', type: 'address'),
          AbiParam(name: 'stamp', type: 'fixedbytes8'),
        ],
      },
      tokens: {
        'collection': collection.toString(),
        'owner': owner.toString(),
        'stamp': base64.encode(utf8.encode(type.name)),
      },
    );
    final (_, hash) = setCodeSalt(code: _indexCode, salt: boc);

    return currentTransport.transport.getAccountsByCodeHash(
      codeHash: hash,
      limit: limit,
      continuation: continuation,
    );
  }

  Future<List<ContractInterface>> _getSupportedInterfaces({
    required Address address,
    required List<ContractInterface> interfaces,
  }) async {
    final result = await Future.wait<bool>(
      interfaces.map(
        (interface) =>
            _supportsInterface(address: address, interface: interface),
      ),
    );

    return interfaces.whereIndexed((index, _) => result[index]).toList();
  }

  Future<bool> _supportsInterface({
    required Address address,
    required ContractInterface interface,
  }) async {
    final result = await _callContract(
      type: AbiType.tip61,
      address: address,
      methodId: 'supportsInterface',
      responsible: true,
      input: {'answerId': 0, 'interfaceID': interface.id},
    );

    return result['value0'] as bool;
  }

  Future<Map<String, dynamic>> _callContract({
    required AbiType type,
    required Address address,
    required String methodId,
    Map<String, dynamic>? input,
    bool responsible = false,
  }) async {
    final contractState = await _cachedContractStateProvider.get(
      address: address,
      transport: currentTransport.transport,
    );
    final result = await runLocal(
      accountStuffBoc: contractState.boc,
      contractAbi: await abiLoader.load(type),
      methodId: methodId,
      input: input ?? {},
      responsible: responsible,
    );

    if (result.code != 0) throw TvmException(result.code);

    return result.output ?? {};
  }

  Future<void> _handleTransactions({
    required Address address,
    required List<TransactionWithData<TransactionAdditionalInfo?>> transactions,
    required TransactionsBatchInfo batchInfo,
    required LatestLtTracker tracker,
  }) async {
    final latestLt = tracker.latestLt ?? BigInt.zero;
    final maxLt = BigInt.parse(batchInfo.maxLt);

    if (latestLt >= maxLt) return;

    await tracker.updateLatestLt(maxLt);

    final [
      nftTransfer,
      multitokenTransfer,
      multitokenWallet,
    ] = await Future.wait([
      abiLoader.load(AbiType.nftTransfer),
      abiLoader.load(AbiType.vep1155Transfer),
      abiLoader.load(AbiType.vep1155Wallet),
    ]);

    // reverse order: from older to newer
    for (final item in transactions.reversed) {
      final transaction = item.transaction;
      final lt = BigInt.parse(transaction.id.lt);

      if (lt <= latestLt) continue; // skip already processed transactions

      try {
        NftTransferEvent? event;
        final decoded = await decodeTransaction(
          transaction: transaction,
          contractAbi: nftTransfer,
          method: 'onNftTransfer',
        );

        if (decoded != null) {
          final transfer = NftTransfer.fromJson(decoded.input);

          if (transfer.newOwner == address) {
            // incomeing nft transfer
            event = NftTransferEvent.ownership(
              direction: TransferDirection.incoming,
              id: transfer.id,
              collection: transfer.collection,
              sender: transfer.oldOwner,
              recipient: transfer.newOwner,
            );
          } else if (transfer.oldOwner == address) {
            // outgoing nft transfer
            event = NftTransferEvent.ownership(
              direction: TransferDirection.outgoing,
              id: transfer.id,
              collection: transfer.collection,
              sender: transfer.oldOwner,
              recipient: transfer.newOwner,
            );
          }

          if (event != null) {
            _transferEventSubject.add(event);
          }

          continue;
        }
      } catch (_) {}

      try {
        final recipient = transaction.inMessage.dst;
        final decoded = await decodeTransaction(
          transaction: transaction,
          contractAbi: multitokenTransfer,
          method: 'onMultiTokenTransfer',
        );

        if (decoded != null && recipient != null) {
          final transfer = MultitokenTransfer.fromJson(decoded.input);

          _transferEventSubject.add(
            NftTransferEvent.token(
              direction: TransferDirection.incoming,
              id: transfer.tokenId,
              collection: transfer.collection,
              sender: transfer.sender,
              recipient: recipient,
              count: transfer.count,
            ),
          );

          continue;
        }
      } catch (_) {}

      try {
        final message = transaction.outMessages.firstOrNull;
        final sender = message?.src;
        final body = message?.body;

        if (body == null || sender == null) continue;

        final decoded = await decodeInput(
          messageBody: body,
          contractAbi: multitokenWallet,
          method: 'transfer',
          internal: true,
        );

        if (decoded == null) continue;

        final input = NftTokenTransferInput.fromJson(decoded.input);
        final payload = NftTokenTransferPayload.fromJson(
          unpackFromCell(
            params: _transferAbiParams,
            boc: input.payload,
            allowPartial: true,
          ),
        );

        _transferEventSubject.add(
          NftTransferEvent.token(
            direction: TransferDirection.outgoing,
            id: payload.id,
            collection: payload.collection,
            sender: sender,
            recipient: input.recipient,
            count: input.count,
          ),
        );
      } catch (_) {}
    }
  }
}
