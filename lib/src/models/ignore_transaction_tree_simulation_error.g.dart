// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ignore_transaction_tree_simulation_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IgnoreTransactionTreeSimulationErrorImpl
    _$$IgnoreTransactionTreeSimulationErrorImplFromJson(
            Map<String, dynamic> json) =>
        _$IgnoreTransactionTreeSimulationErrorImpl(
          code: (json['code'] as num).toInt(),
          address: json['address'] == null
              ? null
              : Address.fromJson(json['address'] as String),
        );

Map<String, dynamic> _$$IgnoreTransactionTreeSimulationErrorImplToJson(
        _$IgnoreTransactionTreeSimulationErrorImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'address': instance.address?.toJson(),
    };
