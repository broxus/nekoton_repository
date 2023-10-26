// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_transaction_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContractFoundTransactionEventImpl
    _$$ContractFoundTransactionEventImplFromJson(Map<String, dynamic> json) =>
        _$ContractFoundTransactionEventImpl(
          address: Address.fromJson(json['address'] as String),
          transactions: (json['transactions'] as List<dynamic>)
              .map((e) => Transaction.fromJson(e as Map<String, dynamic>))
              .toList(),
          info: TransactionsBatchInfo.fromJson(
              json['info'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$ContractFoundTransactionEventImplToJson(
        _$ContractFoundTransactionEventImpl instance) =>
    <String, dynamic>{
      'address': instance.address.toJson(),
      'transactions': instance.transactions.map((e) => e.toJson()).toList(),
      'info': instance.info.toJson(),
    };
