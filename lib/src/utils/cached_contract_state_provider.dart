import 'package:nekoton_repository/nekoton_repository.dart';

class CachedContractStateProvider {
  CachedContractStateProvider({
    this.expiration = const Duration(minutes: 1),
  });

  final Duration expiration;

  final Map<Address, _Entry<Future<FullContractState>>> _cache = {};
  int? _networkId;

  Future<FullContractState> get({
    required Address address,
    required Transport transport,
  }) {
    if (transport.networkId != _networkId) {
      clear();
      _networkId = transport.networkId;
    }

    var entry = _getEntry(address);

    if (entry == null) {
      entry = _Entry(
        _getFullContractState(address: address, transport: transport),
      );
      _cache[address] = entry;
    }

    return entry.value;
  }

  void remove(Address address) => _cache.remove(address);

  void clear() => _cache.clear();

  _Entry<Future<FullContractState>>? _getEntry(Address address) {
    final entry = _cache[address];
    if (entry == null || entry.isExpired(expiration)) {
      return null;
    }
    return entry;
  }

  Future<FullContractState> _getFullContractState({
    required Address address,
    required Transport transport,
  }) async {
    final state = await transport.getFullContractState(address);
    if (state == null) throw ContractNotExistsException(address);
    return state;
  }
}

class _Entry<T> {
  _Entry(this.value) : createdAt = DateTime.now();

  final T value;
  final DateTime createdAt;

  bool isExpired(Duration expiration) {
    return DateTime.now().difference(createdAt) > expiration;
  }
}
