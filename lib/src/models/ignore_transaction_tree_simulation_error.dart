import 'package:flutter_nekoton_bridge/flutter_nekoton_bridge.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ignore_transaction_tree_simulation_error.freezed.dart';
part 'ignore_transaction_tree_simulation_error.g.dart';

@freezed
sealed class IgnoreTransactionTreeSimulationError
    with _$IgnoreTransactionTreeSimulationError {
  const factory IgnoreTransactionTreeSimulationError({
    required final int code,
    final Address? address,
  }) = _IgnoreTransactionTreeSimulationError;

  const IgnoreTransactionTreeSimulationError._();

  factory IgnoreTransactionTreeSimulationError.fromJson(
    Map<String, dynamic> json,
  ) => _$IgnoreTransactionTreeSimulationErrorFromJson(json);

  bool shouldIgnore(TxTreeSimulationErrorItem item) =>
      code == item.error.code && (address == null || address == item.address);
}
