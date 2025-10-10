import 'package:nekoton_repository/nekoton_repository.dart';
import 'package:nekoton_repository/src/repositories/ton_wallet_repository/ton_wallet_gql_block_poller.dart';

/// This is a wrapper above [GenericContract] that lets us using
/// [RefreshPollingQueue] without crutches in [GenericContract.refresh] for GQL.
class GenericContractGqlBlockPoller implements RefreshingInterface {
  GenericContractGqlBlockPoller({
    required this.contract,
    required this.transport,
  });

  final GenericContract contract;
  final GqlTransport transport;

  String? currentBlockId;

  @override
  Future<void> refresh() async {
    currentBlockId ??= (await transport.getLatestBlock(
      address: contract.address,
    )).id;

    final nextBlockId = await transport.waitForNextBlock(
      currentBlockId: currentBlockId!,
      address: contract.address,
      timeout: nextBlockTimeout,
    );

    final block = await transport.getBlock(id: nextBlockId);

    await contract.handleBlock(block: block);

    currentBlockId = nextBlockId;
  }

  @override
  String get refreshDescription =>
      'GenericContract ${contract.address.address} GQL block poller';
}
