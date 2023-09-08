import 'package:nekoton_repository/nekoton_repository.dart';

/// Information about stake logic for transport.
class StakingInformation {
  StakingInformation({
    required this.stakingAPYLink,
    required this.stakingRootContractAddress,
    required this.stakingValutAddress,
    required this.stakeDepositAttachedFee,
    required this.stakeRemovePendingWithdrawAttachedFee,
    required this.stakeWithdrawAttachedFee,
  });

  /// Url to load staking average APY
  final Uri stakingAPYLink;

  /// Address of contract to identify [TokenWallet.rootTokenContract] or to load
  /// currency description.
  final Address stakingRootContractAddress;

  /// Address ot staking contract to stake/unstake or to call other methods
  final Address stakingValutAddress;

  /// Attached fee to call stake method
  final BigInt stakeDepositAttachedFee;

  /// Attached fee to call remove pending withdraw method
  final BigInt stakeRemovePendingWithdrawAttachedFee;

  /// Attached fee to call unstake method
  final BigInt stakeWithdrawAttachedFee;
}
