import 'package:flutter/services.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

class AbiLoader {
  AbiLoader(this._bundle);

  final AssetBundle _bundle;
  final _cache = <AbiType, Future<String>>{};

  Future<String> load(AbiType type) {
    return _cache.putIfAbsent(type, () => _bundle.loadString(type.path));
  }
}
