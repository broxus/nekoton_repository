import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

part 'nft_transfer_event.freezed.dart';

@freezed
sealed class NftTransferEvent with _$NftTransferEvent {
  const factory NftTransferEvent.ownership({
    required TransferDirection direction,
    required String id,
    required Address collection,
    required Address sender,
    required Address recipient,
  }) = NftOwnershipTransferEvent;

  const factory NftTransferEvent.token({
    required TransferDirection direction,
    required String id,
    required Address collection,
    required Address sender,
    required Address recipient,
    required BigInt count,
  }) = NftTokenTransferEvent;
}
