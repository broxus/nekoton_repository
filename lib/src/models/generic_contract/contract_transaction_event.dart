import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

part 'contract_transaction_event.freezed.dart';

part 'contract_transaction_event.g.dart';

/// Event that contains list of last transactions for [GenericContract].
@freezed
class ContractFoundTransactionEvent with _$ContractFoundTransactionEvent {
  const factory ContractFoundTransactionEvent({
    required Address address,
    required List<Transaction> transactions,
    required TransactionsBatchInfo info,
  }) = _ContractFoundTransactionEvent;

  factory ContractFoundTransactionEvent.fromJson(Map<String, dynamic> json) =>
      _$ContractFoundTransactionEventFromJson(json);
}
