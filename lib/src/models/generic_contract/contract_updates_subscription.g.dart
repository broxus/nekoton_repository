// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_updates_subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContractUpdatesSubscription _$ContractUpdatesSubscriptionFromJson(
  Map<String, dynamic> json,
) => _ContractUpdatesSubscription(
  contractState: json['state'] as bool?,
  transactions: json['transactions'] as bool?,
);

Map<String, dynamic> _$ContractUpdatesSubscriptionToJson(
  _ContractUpdatesSubscription instance,
) => <String, dynamic>{
  'state': ?instance.contractState,
  'transactions': ?instance.transactions,
};
