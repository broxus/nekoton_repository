import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

part 'contract_state_changed_event.freezed.dart';
part 'contract_state_changed_event.g.dart';

/// Event that contains actual contract state for [GenericContract].
@freezed
abstract class ContractStateChangedEvent with _$ContractStateChangedEvent {
  const factory ContractStateChangedEvent({
    required Address address,
    required ContractState state,
  }) = _ContractStateChangedEvent;

  factory ContractStateChangedEvent.fromJson(Map<String, dynamic> json) =>
      _$ContractStateChangedEventFromJson(json);
}
