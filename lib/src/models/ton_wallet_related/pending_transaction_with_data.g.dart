// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_transaction_with_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PendingTransactionWithAdditionalInfoImpl
    _$$PendingTransactionWithAdditionalInfoImplFromJson(
            Map<String, dynamic> json) =>
        _$PendingTransactionWithAdditionalInfoImpl(
          transaction: PendingTransaction.fromJson(
              json['transaction'] as Map<String, dynamic>),
          destination: Address.fromJson(json['destination'] as String),
          amount: amountJsonConverter.fromJson(json['amount'] as String),
          createdAt: DateTime.parse(json['createdAt'] as String),
        );

Map<String, dynamic> _$$PendingTransactionWithAdditionalInfoImplToJson(
        _$PendingTransactionWithAdditionalInfoImpl instance) =>
    <String, dynamic>{
      'transaction': instance.transaction.toJson(),
      'destination': instance.destination.toJson(),
      'amount': amountJsonConverter.toJson(instance.amount),
      'createdAt': instance.createdAt.toIso8601String(),
    };
