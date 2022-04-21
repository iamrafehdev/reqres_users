/// delay function for any action
delay(Duration duration, Function function) {
  return Future.delayed(
    duration,
    () {
      function();
    },
  );
}

/// delay in seconds function for any action
delayInSeconds(int seconds, Function function) {
  delay(
    Duration(seconds: seconds),
    () {
      function();
    },
  );
}

/// delay in milliseconds function for any action
delayInMilliseconds(int milliseconds, Function function) {
  delay(
    Duration(milliseconds: milliseconds),
    () {
      function();
    },
  );
}
