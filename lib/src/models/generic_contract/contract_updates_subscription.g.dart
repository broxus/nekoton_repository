// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_updates_subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContractUpdatesSubscriptionImpl _$$ContractUpdatesSubscriptionImplFromJson(
        Map<String, dynamic> json) =>
    _$ContractUpdatesSubscriptionImpl(
      contractState: json['state'] as bool?,
      transactions: json['transactions'] as bool?,
    );

Map<String, dynamic> _$$ContractUpdatesSubscriptionImplToJson(
        _$ContractUpdatesSubscriptionImpl instance) =>
    <String, dynamic>{
      if (instance.contractState case final value?) 'state': value,
      if (instance.transactions case final value?) 'transactions': value,
    };
