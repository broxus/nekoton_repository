import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

part 'nft_token_transfer_input.freezed.dart';
part 'nft_token_transfer_input.g.dart';

@freezed
abstract class NftTokenTransferInput with _$NftTokenTransferInput {
  const factory NftTokenTransferInput({
    @amountJsonConverter required BigInt count,
    @amountJsonConverter required BigInt deployTokenWalletValue,
    required Address recipient,
    required Address remainingGasTo,
    required String payload,
    required bool notify,
  }) = _NftTokenTransferInput;

  factory NftTokenTransferInput.fromJson(Map<String, dynamic> json) =>
      _$NftTokenTransferInputFromJson(json);
}
