import 'package:injectable/injectable.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

/// This is a hack module that will be used in codegen.
/// This helps register [NekotonRepository] as a different types.
@module
abstract class NekotonRepositoryModule {
  @singleton
  TransportRepository registerTransport(NekotonRepository repository) =>
      repository;

  @singleton
  SeedKeyRepository registerSeedKey(NekotonRepository repository) => repository;

  @singleton
  AccountRepository registerAccounts(NekotonRepository repository) =>
      repository;

  @singleton
  TonWalletRepository registerTonWallet(NekotonRepository repository) =>
      repository;

  @singleton
  TokenWalletRepository registerTokenWallet(NekotonRepository repository) =>
      repository;

  @singleton
  GenericContractRepository registerGenericContract(
    NekotonRepository repository,
  ) => repository;

  @singleton
  NftRepository registerNft(NekotonRepository repository) => repository;
}
