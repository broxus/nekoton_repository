/// Max number of seeds that can be displayed as "last viewed"
const maxLastSelectedSeeds = 4;

/// Default workchain for loading accounts
const defaultWorkchainId = 0;

extension ExpireAtToTimeout on DateTime {
  /// Convert timeout duration from current moment and int microseconds
  Duration toTimeout() => difference(DateTime.now());
}
