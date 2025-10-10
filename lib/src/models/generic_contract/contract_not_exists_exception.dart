import 'package:nekoton_repository/nekoton_repository.dart';

/// Exception thrown when attempting to interact with a contract instance
/// that does not exist. This typically happens when methods are called before
/// proper contract initialization / or when accessing a contract
/// that hasn't been deployed to the blockchain.
class ContractNotExistsException implements Exception {
  const ContractNotExistsException(this.address);

  final Address address;

  @override
  String toString() =>
      '''
Contract state does not exist. Please ensure the contract is properly initialized
before calling this method. Address: $address
''';
}
