import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

part 'get_public_keys_params.freezed.dart';

@freezed
sealed class GetPublicKeysParams with _$GetPublicKeysParams {
  const factory GetPublicKeysParams.derived({
    required PublicKey masterKey,
    required String password,
    required int limit,
    required int offset,
  }) = GetPublicKeysParamsDerived;

  const factory GetPublicKeysParams.ledger({
    required int limit,
    required int offset,
  }) = GetPublicKeysParamsLedger;
}
