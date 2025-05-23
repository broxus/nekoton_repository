import 'package:nekoton_repository/nekoton_repository.dart';

final class NftList {
  const NftList({
    required this.items,
    this.continuation,
  });

  final List<NftItem> items;
  final String? continuation;
}
