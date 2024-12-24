import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

part 'pending_transaction_with_data.freezed.dart';
part 'pending_transaction_with_data.g.dart';

@freezed
sealed class PendingTransactionWithData
    with _$PendingTransactionWithData
    implements Comparable<PendingTransactionWithData> {
  const factory PendingTransactionWithData({
    required final PendingTransaction transaction,
    required final Address destination,
    @amountJsonConverter required final BigInt amount,
    required final DateTime createdAt,
  }) = _PendingTransactionWithAdditionalInfo;

  factory PendingTransactionWithData.fromJson(Map<String, dynamic> json) =>
      _$PendingTransactionWithDataFromJson(json);

  const PendingTransactionWithData._();

  @override
  int compareTo(PendingTransactionWithData other) =>
      -createdAt.compareTo(other.createdAt);
}
