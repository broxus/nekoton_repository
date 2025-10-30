import 'package:nekoton_repository/nekoton_repository.dart';

// ignore: one_member_abstracts
abstract class NftDataProvider {
  Future<NftList> getNftList({
    required Address collection,
    required Address owner,
    required int limit,
    int? offset,
  });
}
