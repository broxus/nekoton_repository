class NtpTime {
  NtpTime._();

  static Duration offset = Duration.zero;

  /// Returns current time of the system clock with offset from the NTP server
  /// Use this method instead of [DateTime.now] to get the correct time
  static DateTime now() => DateTime.now().add(offset);
}
