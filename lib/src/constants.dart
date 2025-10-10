import 'package:nekoton_repository/src/utils/utils.dart';

/// Max number of seeds that can be displayed as "last viewed"
const maxLastSelectedSeeds = 4;

extension ExpireAtToTimeout on DateTime {
  /// Convert timeout duration from current moment
  Duration toTimeout() => difference(NtpTime.now());
}
