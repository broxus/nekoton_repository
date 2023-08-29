import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:nekoton_repository/nekoton_repository.dart';

/// Subscription item that is used to store [GenericContract] subscription
/// and all related data.
@immutable
class GenericContractSubscriptionItem extends Equatable {
  const GenericContractSubscriptionItem({
    required this.tabId,
    required this.address,
    required this.contract,
    required this.origin,
    required this.updateSubscriptionOptions,
  });

  /// Id of browser's tab
  final String tabId;

  /// Address of wallet that describes contract
  final Address address;

  /// Contract itself
  final GenericContract contract;

  /// Browser url that creates this subscription
  final Uri origin;

  /// Options for subscription
  final ContractUpdatesSubscription updateSubscriptionOptions;

  @override
  List<Object?> get props => [origin, address, tabId];
}
