class MLogger {
  const MLogger._();

  static void log(Object? message) {
    // ignore: avoid_print
    print('MLogger => $message');
  }
}
