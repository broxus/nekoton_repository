import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

part 'nft_transfer_input.freezed.dart';
part 'nft_transfer_input.g.dart';

@freezed
final class NftTransferInput with _$NftTransferInput {
  const factory NftTransferInput({
    required Address to,
    required Address sendGasTo,
    // json_serializable wont work with Address keys
    required Map<String, NftCallbackPayload> callbacks,
  }) = _NftTransferInput;

  factory NftTransferInput.fromJson(Map<String, dynamic> json) =>
      _$NftTransferInputFromJson(json);
}
