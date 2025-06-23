// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ignore_transaction_tree_simulation_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IgnoreTransactionTreeSimulationError
    _$IgnoreTransactionTreeSimulationErrorFromJson(Map<String, dynamic> json) =>
        _IgnoreTransactionTreeSimulationError(
          code: (json['code'] as num).toInt(),
          address: json['address'] == null
              ? null
              : Address.fromJson(json['address'] as String),
        );

Map<String, dynamic> _$IgnoreTransactionTreeSimulationErrorToJson(
        _IgnoreTransactionTreeSimulationError instance) =>
    <String, dynamic>{
      'code': instance.code,
      'address': instance.address?.toJson(),
    };
