import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

part 'nft_transfer_input.freezed.dart';

@freezed
class NftTransferInput with _$NftTransferInput {
  const factory NftTransferInput({
    required Address to,
    required Address sendGasTo,
    required Map<Address, NftCallbackPayload> callbacks,
  }) = _NftTransferInput;

  const NftTransferInput._();

  Map<String, dynamic> toJson() {
    return {
      'to': to.toJson(),
      'sendGasTo': sendGasTo.toJson(),
      'callbacks': callbacks.entries
          .map((entry) => [entry.key.toJson(), entry.value.toJson()])
          .toList(),
    };
  }
}
