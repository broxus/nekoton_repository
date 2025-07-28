import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

part 'nft_item.freezed.dart';

/// Represents an [Nft] item with its associated [MultitokenWallet]
/// information (VEP-1155).
@freezed
abstract class NftItem with _$NftItem {
  const factory NftItem({
    required Nft nft,
    MultitokenWallet? wallet,
  }) = _NftItem;
}
