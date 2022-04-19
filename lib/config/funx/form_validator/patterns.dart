/// regex patterns
class Patterns {
  static const String PATTERN_EMAIL =
      r"^[a-zA-Z0-9\+\.\_\%\-\+]{3,256}@[a-zA-Z0-9\-]{2,64}(\.[a-zA-Z\-]{2,25}){0,64}\.[a-zA-Z\-]{2,25}$";
  static const String PATTERN_USERNAME = r"^([a-zA-Z0-9.\-_]+){3,255}$";
  static const String PATTERN_NAME = r"^([a-zA-Z .\-_]+){3,255}$";
  static const String PATTERN_PASSWORD =
      r"^(?:(?=.*[a-z])(?=.*\W)(?=.*[A-Z])(?=.*\d)).{8,}$";
  static const String PATTERN_NUMBER = r"^-?\d+(\.\d+)?$";
  static const String PATTERN_POSITIVE_NUMBER = r"^\d+(\.\d+)?$";
  static const String PATTERN_FLOAT = r"^-?\d+\.\d+$";
  static const String PATTERN_POSITIVE_FLOAT = r"^\d+\.\d+$";
  static const String PATTERN_DOUBLE = PATTERN_FLOAT;
  static const String PATTERN_POSITIVE_DOUBLE = PATTERN_POSITIVE_FLOAT;
}
