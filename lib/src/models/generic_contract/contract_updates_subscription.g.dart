// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_updates_subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContractUpdatesSubscription _$$_ContractUpdatesSubscriptionFromJson(
        Map<String, dynamic> json) =>
    _$_ContractUpdatesSubscription(
      contractState: json['state'] as bool?,
      transactions: json['transactions'] as bool?,
    );

Map<String, dynamic> _$$_ContractUpdatesSubscriptionToJson(
    _$_ContractUpdatesSubscription instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('state', instance.contractState);
  writeNotNull('transactions', instance.transactions);
  return val;
}
