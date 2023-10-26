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
    _$ContractUpdatesSubscriptionImpl instance) {
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
