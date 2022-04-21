import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reqres_users/config/fun_x/functions/date_time.dart';

/// String extension functions
extension StringExtensions on String {
  String toCapitalize() {
    var text = this.trim();
    if (text.length == 0) return text;
    if (text.length == 1) return text.toUpperCase();
    return text[0].toUpperCase() + text.substring(1);
  }

  String toTitleCase() {
    var text = this.trim();
    if (text.length == 0) return text;
    if (text.length == 1) return text.toUpperCase();
    var words = text.split(' ');
    var capitalized = words.map((word) {
      var first = word.substring(0, 1).toUpperCase();
      var rest = word.substring(1);
      return '$first$rest';
    });
    return capitalized.join(' ').trim();
  }

  int toInt({int defaultValue = 0}) {
    return int.tryParse(this.trim()) ?? defaultValue;
  }

  double toDouble({double defaultValue = 0.0}) {
    return double.tryParse(this.trim()) ?? defaultValue;
  }

  DateTime toDate(
      [String format = "${DateFormats.DD_MM_YYYY} ${TimeFormats.hh_mm_ss_a}"]) {
    assert(this.isNotEmpty, "String should not be empty");
    DateTime rowDate = DateTime.parse(this);
    if (format != null) {
      rowDate.format(format);
    }
    return rowDate;
  }
}

/// TextEditingController extension functions
extension TextEditingControllerExtension on TextEditingController {
  selectAllOnFocus(FocusNode node) {
    node.addListener(() {
      if (node.hasFocus) {
        this.selection =
            TextSelection(baseOffset: 0, extentOffset: this.text.trim().length);
      }
    });
  }

  String getText({String defaultText = ""}) {
    String value = this.text.trim();
    return value.isEmpty ? defaultText : value;
  }

  int getInt({int defaultInteger = 0}) {
    String value = this.text.trim();
    return value.isEmpty
        ? defaultInteger
        : int.tryParse(value) ?? defaultInteger;
  }

  double getDouble({double defaultDouble = 0.0}) {
    String value = this.text.trim();
    return value.isEmpty
        ? defaultDouble
        : double.tryParse(value) ?? defaultDouble;
  }
}

/// double extension functions
extension DoubleExtension on double {
  String format({format: "#,###.00"}) {
    return NumberFormat(format, 'en_US').format(this);
  }
}

/// int extension functions
extension IntExtension on int {
  String format({format: "#,###"}) {
    return NumberFormat(format, 'en_US').format(this);
  }
}

extension NavigatorExtension on State {
  Future<T?> push<T extends Object>(Widget route) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (c) => route,
      ),
    );
  }

  Future<T?> replace<T extends Object>(Widget route) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (c) => route,
      ),
    );
  }

  pop<T extends Object>([T? result]) {
    var canPop = Navigator.canPop(context);
    assert(canPop, "Unable to pop the (initial) route");
    Navigator.of(context).pop<T>(result);
  }

  mustPop<T extends Object>([T? result]) {
    Navigator.of(context).pop<T>(result);
  }
}
