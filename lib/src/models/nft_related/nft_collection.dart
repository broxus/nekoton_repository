import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

part 'nft_collection.freezed.dart';
part 'nft_collection.g.dart';

@freezed
final class NftCollection with _$NftCollection {
  const factory NftCollection({
    required String address,
    required NftJsonData json,
    required List<ContractInterface> interfaces,
  }) = _NftCollection;

  factory NftCollection.fromJson(Map<String, dynamic> json) =>
      _$NftCollectionFromJson(json);

  NftCollection._();

  String get name => json.name ?? 'Unknown';
  String? get description => json.description;
  String? get imageUrl => json.previewUrl;
  bool get isTip422 => interfaces.contains(ContractInterface.tip422Collection);
  bool get isVep1155 =>
      interfaces.contains(ContractInterface.vep1155Collection);
}
