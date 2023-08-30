// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_state_changed_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContractStateChangedEvent _$$_ContractStateChangedEventFromJson(
        Map<String, dynamic> json) =>
    _$_ContractStateChangedEvent(
      address: Address.fromJson(json['address'] as String),
      state: ContractState.fromJson(json['state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ContractStateChangedEventToJson(
        _$_ContractStateChangedEvent instance) =>
    <String, dynamic>{
      'address': instance.address.toJson(),
      'state': instance.state.toJson(),
    };
