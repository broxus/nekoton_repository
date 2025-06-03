import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

part 'nft.freezed.dart';

@freezed
class Nft with _$Nft {
  const factory Nft({
    required Address address,
    required NftInfo info,
    required NftJsonData json,
    BigInt? supply,
  }) = _Nft;

  const Nft._();

  String get id => info.id;

  Address get owner => info.owner;

  Address get manager => info.manager;

  Address get collection => info.collection;

  String? get name => json.name;

  String? get description => json.description;

  String? get previewUrl => json.previewUrl;

  String? get imageUrl => json.imageUrl;

  bool get canTransfer => owner == manager;
}
