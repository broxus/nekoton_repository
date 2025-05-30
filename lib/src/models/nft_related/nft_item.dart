import 'package:nekoton_repository/nekoton_repository.dart';

/// Represents an [Nft] item with its associated [MultitokenWallet]
/// information (VEP-1155).
class NftItem {
  const NftItem({
    required this.nft,
    this.wallet,
  });

  final Nft nft;
  final MultitokenWallet? wallet;
}
