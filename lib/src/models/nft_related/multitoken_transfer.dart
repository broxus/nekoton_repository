import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

part 'multitoken_transfer.freezed.dart';
part 'multitoken_transfer.g.dart';

@freezed
abstract class MultitokenTransfer with _$MultitokenTransfer {
  const factory MultitokenTransfer({
    required String tokenId,
    required Address collection,
    required Address sender,
    @amountJsonConverter required BigInt count,
  }) = _MultitokenTransfer;

  factory MultitokenTransfer.fromJson(Map<String, dynamic> json) =>
      _$MultitokenTransferFromJson(json);
}
