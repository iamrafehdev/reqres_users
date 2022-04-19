import 'package:flutter/material.dart';
import 'package:reqres_users/config/funx/form_validator/patterns.dart';

/// form field validator
class Validator {
  /// required validation
  static FormFieldValidator<String> required(String errorMsg) {
    return (value) {
      if (value == null || value.trim().isEmpty)
        return errorMsg;
      else
        return null;
    };
  }

  /// email validation
  static FormFieldValidator<String> email(String errorMsg, {optional: false}) {
    return (value) {
      if (value == null || value.trim().isEmpty) {
        return optional ? null : errorMsg;
      } else {
        RegExp regExp = new RegExp(Patterns.PATTERN_EMAIL);
        var v = regExp.hasMatch(value.trim());
        return (!v) ? errorMsg : null;
      }
    };
  }

  /// number validation
  static FormFieldValidator<String> number(String errorMsg,
      {optional: false, double? min, double? max}) {
    return (value) {
      if (value == null || value.trim().isEmpty) {
        return optional ? null : errorMsg;
      } else {
        var v = double.tryParse(value.trim());
        if (v == null) return errorMsg;
        if (min != null && v < min) return errorMsg;
        if (max != null && v > max) return errorMsg;
      }
      return null;
    };
  }

  /// text validation
  static FormFieldValidator<String> text(String errorMsg,
      {optional: false, int? minLength, int? maxLength}) {
    return (value) {
      if (value == null || value.trim().isEmpty) {
        return optional ? null : errorMsg;
      } else {
        var l = value.trim().length;
        if (minLength != null && l < minLength) return errorMsg;
        if (maxLength != null && l > maxLength) return errorMsg;
      }
      return null;
    };
  }

  /*
	* ********************************************************************************************************************
	* Other Static functions
	* ********************************************************************************************************************
	*/

  /// isMatch validation
  static bool isMatch(String text, String text2) {
    return text == text2;
  }

  /// isValidUsername validation
  static bool isValidUsername(String text) {
    RegExp regExp = new RegExp(Patterns.PATTERN_USERNAME);
    return regExp.hasMatch(text.trim());
  }

  /// isValidEmail validation
  static bool isValidEmail(String text) {
    RegExp regExp = new RegExp(Patterns.PATTERN_EMAIL);
    return regExp.hasMatch(text.trim());
  }

  /// isValidUsernameOrEmail validation
  static bool isValidUsernameOrEmail(String text) {
    return isValidUsername(text.trim()) || isValidEmail(text.trim());
  }

  /// isValidPassword validation
  static bool isValidPassword(String text) {
    RegExp regExp = new RegExp(Patterns.PATTERN_PASSWORD);
    return regExp.hasMatch(text.trim());
  }

  /// isValidNumber validation
  static bool isValidNumber(String text, {bool negative = false}) {
    RegExp regExp = new RegExp(
        negative ? Patterns.PATTERN_NUMBER : Patterns.PATTERN_POSITIVE_NUMBER);
    return regExp.hasMatch(text.trim());
  }

  /// isValidFloat validation
  static bool isValidFloat(String text, {bool negative = false}) {
    RegExp regExp = new RegExp(
        negative ? Patterns.PATTERN_FLOAT : Patterns.PATTERN_POSITIVE_FLOAT);
    return regExp.hasMatch(text.trim());
  }

  /// isValidDouble validation
  static bool isValidDouble(String text, {bool negative = false}) {
    return isValidFloat(text.trim(), negative: negative);
  }
}
