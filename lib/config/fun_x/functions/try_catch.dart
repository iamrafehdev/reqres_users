import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// try catch function
tryCatch(
  BuildContext context, {
  required void Function() action,
  void Function(SocketException, StackTrace)? socketException,
  void Function(FormatException, StackTrace)? formatException,
  void Function(PlatformException, StackTrace)? platformException,
  void Function(Exception, StackTrace)? exception,
  void Function(Error, StackTrace)? error,
  void Function(dynamic, StackTrace)? otherCatch,
}) async {
  try {
    action();
  } on SocketException catch (e, s) {
    if (socketException != null) socketException(e, s);
  } on FormatException catch (e, s) {
    if (formatException != null) formatException(e, s);
  } on PlatformException catch (e, s) {
    if (platformException != null) platformException(e, s);
  } on Exception catch (e, s) {
    if (exception != null) exception(e, s);
  } on Error catch (e, s) {
    if (error != null) error(e, s);
  } catch (e, s) {
    if (otherCatch != null) otherCatch(e, s);
  }
}
