import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

part 'derive_keys_params.freezed.dart';

@freezed
sealed class DeriveKeysParams with _$DeriveKeysParams {
  const factory DeriveKeysParams.derived({
    required int accountId,
    required PublicKey masterKey,
    required String password,
  }) = DeriveKeysParamsDerived;

  const factory DeriveKeysParams.ledger({required int accountId}) =
      DeriveKeysParamsLedger;
}
