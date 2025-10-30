import 'dart:async';

import 'package:nekoton_repository/nekoton_repository.dart';

abstract interface class LatestLtTracker {
  /// Latest known logical time (lt) or null if unknown.
  BigInt? get latestLt;

  /// Updates the latest known logical time.
  FutureOr<void> updateLatestLt(BigInt maxLt);
}

abstract class NftRepository {
  /// Stream of NFT transfer events for all subscribed wallets.
  Stream<NftTransferEvent> get nftTransferEventStream;

  /// Subscribe to NFT transfer events for the given wallet.
  void subscribeToWalletNftTransfers({
    required TonWallet wallet,
    required LatestLtTracker tracker,
  });

  /// Unsubscribe from NFT transfer events for the given address.
  void unsubscribeFromWalletNftTransfers(Address address);

  /// Scans the specified NFT collections for the given owner and returns
  /// a list of [NftCollection]s that contain any owner's NFT
  ///
  /// On-chain indexes (TIP-4.3) are used to scan the collections.
  ///
  /// - [owner]: The address of NFTs owner.
  /// - [collections]: The list of collection addresses to scan.
  Future<List<NftCollection>> scanNftCollections({
    required Address owner,
    required List<Address> collections,
  });

  /// Attempts to retrieve an [NftCollection] based on the provided parameters.
  /// - [owner]: The address of the NFT owner.
  /// - [address]: The address of the [Nft] or [NftCollection].
  Future<NftCollection?> tryGetNftCollection({
    required Address address,
    required Address owner,
  });

  /// Get a list of NFTs owned by [owner] in the [collection].
  /// Supports pagination with [limit] and [continuation].
  Future<NftList> getNftList({
    required Address collection,
    required Address owner,
    required int limit,
    String? continuation,
  });

  /// Get a single NFT item by its [address] and [owner].
  Future<NftItem> getNftItem({
    required Address address,
    required Address owner,
  });

  /// Get NFT collection info by its [address].
  Future<NftCollection> getNftCollection(Address address);

  /// Get multitoken wallet info for the given [address].
  Future<MultitokenWallet?> getMultitokenWallet(Address address);

  /// Get NFT address by its [id] and [collection].
  Future<Address> getNftAddressById({
    required String id,
    required Address collection,
  });

  /// Prepares an internal message for transferring an NFT.
  ///
  /// Constructs and returns an [InternalMessage] to initiate the transfer.
  ///
  /// - [address]: The address of the NFT to be transferred.
  /// - [owner]: The address of the current owner of the NFT.
  /// - [recipient]: The address of the recipient who will receive the NFT.
  /// - [sendGasTo]: The address of the recipient of remaining gas.
  ///
  /// Returns a [Future] that completes with the prepared [InternalMessage].
  Future<InternalMessage> prepareNftTransfer({
    required Address address,
    required Address owner,
    required Address recipient,
    required Address sendGasTo,
  });

  /// Prepares an [InternalMessage] for transferring NFT tokens (VEP-1155).
  ///
  /// Constructs and returns an [InternalMessage] to initiate the transfer.
  ///
  /// - [id]: The unique identifier of the NFT.
  /// - [count]: The number of tokens to transfer.
  /// - [collection]: The address of the NFT collection contract.
  /// - [owner]: The address of the current owner of the NFT.
  /// - [recipient]: The address to receive the NFT tokens.
  /// - [remainingGasTo]: The address of the recipient of remaining gas.
  ///
  /// Returns a [Future] that completes with the prepared [InternalMessage].
  Future<InternalMessage> prepareNftTokenTransfer({
    required String id,
    required BigInt count,
    required Address collection,
    required Address owner,
    required Address recipient,
    required Address remainingGasTo,
  });
}
