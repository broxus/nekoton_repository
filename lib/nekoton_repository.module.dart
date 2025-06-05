//@GeneratedMicroModule;NekotonRepositoryPackageModule;package:nekoton_repository/nekoton_repository.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:injectable/injectable.dart' as _i526;
import 'package:nekoton_repository/nekoton_repository.dart' as _i771;
import 'package:nekoton_repository/src/nekoton_repository.dart' as _i668;
import 'package:nekoton_repository/src/nekoton_repository_module.dart' as _i258;

class NekotonRepositoryPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final nekotonRepositoryModule = _$NekotonRepositoryModule();
    gh.singleton<_i668.NekotonRepository>(() => _i668.NekotonRepository());
    gh.singleton<_i771.TransportRepository>(() => nekotonRepositoryModule
        .registerTransport(gh<_i771.NekotonRepository>()));
    gh.singleton<_i771.SeedKeyRepository>(() =>
        nekotonRepositoryModule.registerSeedKey(gh<_i771.NekotonRepository>()));
    gh.singleton<_i771.AccountRepository>(() => nekotonRepositoryModule
        .registerAccounts(gh<_i771.NekotonRepository>()));
    gh.singleton<_i771.TonWalletRepository>(() => nekotonRepositoryModule
        .registerTonWallet(gh<_i771.NekotonRepository>()));
    gh.singleton<_i771.TokenWalletRepository>(() => nekotonRepositoryModule
        .registerTokenWallet(gh<_i771.NekotonRepository>()));
    gh.singleton<_i771.GenericContractRepository>(() => nekotonRepositoryModule
        .registerGenericContract(gh<_i771.NekotonRepository>()));
    gh.singleton<_i771.NftRepository>(() =>
        nekotonRepositoryModule.registerNft(gh<_i771.NekotonRepository>()));
  }
}

class _$NekotonRepositoryModule extends _i258.NekotonRepositoryModule {}
