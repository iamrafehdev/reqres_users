import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AppLogger {
  static final AppLogger _singleton = AppLogger._internal();
  Logger? _logger;
  Logger? _plainLogger;
  Logger? _warningLogger;
  Logger? _errorLogger;
  Level logLevel = Level.verbose;

  factory AppLogger() {
    return _singleton;
  }

  AppLogger._internal();

  init({Level? level, LogPrinter? printer}) {
    if (kDebugMode) {
      logLevel = level ?? Level.verbose;
    } else {
      logLevel = Level.nothing;
    }
    _logger = Logger(level: logLevel, printer: printer);
    _plainLogger =
        Logger(level: logLevel, printer: _getPrinter(methodCount: 0));
    _warningLogger =
        Logger(level: logLevel, printer: _getPrinter(methodCount: 1));
    _errorLogger = Logger(level: logLevel, printer: _getPrinter());
  }

  Logger? getLogger() => _logger;

  v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (_shouldLog()) {
      _plainLogger!.v(message, error, stackTrace);
    }
  }

  d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (_shouldLog()) {
      _plainLogger!.d(message, error, stackTrace);
    }
  }

  i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (_shouldLog()) {
      _plainLogger!.i(message, error, stackTrace);
    }
  }

  w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (_shouldLog()) {
      _warningLogger!.w(message, error, stackTrace);
    }
  }

  e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (_shouldLog()) {
      _errorLogger!.e(message, error, stackTrace);
    }
  }

  wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (_shouldLog()) {
      _errorLogger!.wtf(message, error, stackTrace);
    }
  }

  // log(dynamic message, [Level? level, dynamic error, StackTrace? stackTrace]) {
  //   if (_shouldLog()) {
  //     _logger!.log(level ?? logLevel, message, error, stackTrace);
  //   }
  // }

  _shouldLog() {
    assert(_logger != null, "call init(); method first");
    return logLevel != Level.nothing;
  }

  _getPrinter({
    color = true,
    emojis = true,
    time = false,
    methodCount = 2,
    noBoxing = false,
  }) =>
      PrettyPrinter(
        colors: color,
        printEmojis: emojis,
        printTime: time,
        stackTraceBeginIndex: 0,
        errorMethodCount: methodCount,
        lineLength: 150,
        methodCount: methodCount,
        noBoxingByDefault: noBoxing,
        // excludeBox: {
        //   Level.verbose: true,
        //   Level.info: true,
        //   Level.debug: true,
        // },
      );
}
