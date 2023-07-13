// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_transaction_with_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PendingTransactionWithAdditionalInfo
    _$$_PendingTransactionWithAdditionalInfoFromJson(
            Map<String, dynamic> json) =>
        _$_PendingTransactionWithAdditionalInfo(
          transaction: PendingTransaction.fromJson(
              json['transaction'] as Map<String, dynamic>),
          destination: Address.fromJson(json['destination'] as String),
          amount: amountJsonConverter.fromJson(json['amount'] as String),
          createdAt: DateTime.parse(json['createdAt'] as String),
        );

Map<String, dynamic> _$$_PendingTransactionWithAdditionalInfoToJson(
        _$_PendingTransactionWithAdditionalInfo instance) =>
    <String, dynamic>{
      'transaction': instance.transaction.toJson(),
      'destination': instance.destination.toJson(),
      'amount': amountJsonConverter.toJson(instance.amount),
      'createdAt': instance.createdAt.toIso8601String(),
    };
