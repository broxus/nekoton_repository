import 'package:nekoton_repository/generated/generated.dart';

enum AbiType {
  /// https://docs.everscale.network/standard/TIP-6.1/
  tip61,

  /// https://docs.everscale.network/standard/TIP-4.3/
  tip43,

  /// https://docs.venom.foundation/standards/VEP/vep-1155/#collection
  vep1155Collection,

  /// https://docs.venom.foundation/standards/VEP/vep-1155/#nft
  vep1155Nft,

  /// https://docs.venom.foundation/standards/VEP/vep-1155/#callbacks
  vep1155Transfer,

  /// https://docs.venom.foundation/standards/VEP/vep-1155/#multitoken-wallet
  vep1155Wallet,

  /// https://docs.venom.foundation/standards/TIP/TIP-4/TIP-4.2.2#tip4_2_2collection
  tip422Collection,

  /// https://docs.venom.foundation/standards/TIP/TIP-4/TIP-4.2.2#tip4_2_2nft
  tip422Nft,

  /// https://docs.everscale.network/standard/TIP-4.1#collection
  collection,

  /// https://docs.everscale.network/standard/TIP-4.1#nft
  nft,

  /// https://docs.everscale.network/standard/TIP-4.1#transfer-callback-processing
  nftTransfer;

  String get path => switch (this) {
    tip61 => Assets.abi.tip61Abi,
    tip43 => Assets.abi.tip43Abi,
    vep1155Collection => Assets.abi.vep1155CollectionAbi,
    vep1155Nft => Assets.abi.vep1155NftAbi,
    vep1155Transfer => Assets.abi.vep1155TransferAbi,
    vep1155Wallet => Assets.abi.vep1155WalletAbi,
    tip422Collection => Assets.abi.tip422CollectionAbi,
    tip422Nft => Assets.abi.tip422NftAbi,
    nftTransfer => Assets.abi.nftTransferAbi,
    collection => Assets.abi.collectionAbi,
    nft => Assets.abi.nftAbi,
  };
}
