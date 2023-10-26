// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_state_changed_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContractStateChangedEventImpl _$$ContractStateChangedEventImplFromJson(
        Map<String, dynamic> json) =>
    _$ContractStateChangedEventImpl(
      address: Address.fromJson(json['address'] as String),
      state: ContractState.fromJson(json['state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ContractStateChangedEventImplToJson(
        _$ContractStateChangedEventImpl instance) =>
    <String, dynamic>{
      'address': instance.address.toJson(),
      'state': instance.state.toJson(),
    };
