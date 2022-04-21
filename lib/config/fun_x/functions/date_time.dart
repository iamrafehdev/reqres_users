import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';

/// date formats
class DateFormats {
  static const D_MM_YY = "d MM yy"; // 4 07 17
  static const DD_MM_YY = "dd MM yy"; // 04 07 17
  static const D_MMM_YY = "d MMM yy"; // 4 Jul 17
  static const D_MMM_YYYY = "d MMM yyyy"; // 4 Jul 2017
  static const DD_MM_YYYY = "dd MM yyyy"; // 04 07 2017
  static const DD_MMM_YY = "dd MMM yy"; // 04 Jul 17
  static const DD_MMM_YYYY = "dd MMM yyyy"; // 04 Jul 2017
  static const DD_MMMM_YY = "dd MMMM yy"; // 04 July 17
  static const DD_MMMM_YYYY = "dd MMMM yyyy"; // 04 July 2017
  static const EEE_DD_MM_YY = "EEE, dd MM yy"; // WED, 04 07 17
  static const EEE_DD_MM_YYYY = "EEE, dd MM yyyy"; // WED, 04 07 2017
  static const EEE_D_MMM_YYYY = "EEE, d MMM yyyy"; // WED, 4 Jul 2017
  static const EEE_DD_MMM_YY = "EEE, dd MMM yy"; // WED, 04 Jul 17
  static const EEE_DD_MMM_YYYY = "EEE, dd MMM yyyy"; // WED, 04 Jul 2017
  static const EEE_DD_MMMM_YYYY = "EEE, dd MMMM yyyy"; // WED, 04 July 2017

  static const SQL_DATE_FORMAT = "yyyy-MM-dd"; // 2017-07-17
  static const SQL_DATE_TIME_FORMAT =
      "yyyy-MM-dd HH:mm:ss"; // 2017-07-17 16:05:30

  static const SQL_START_DATE_FORMAT =
      "yyyy-MM-dd 00:00:00"; // 2017-07-17 16:05:30
  static const SQL_END_DATE_FORMAT =
      "yyyy-MM-dd 23:59:59"; // 2017-07-17 16:05:30
}

/// time formats
class TimeFormats {
  static const h_mm_a = "h:mm a"; // 2:08 AM
  static const hh_mm_a = "hh:mm a"; // 02:08 AM
  static const hh_mm_ss_a = "hh:mm:ss a"; // 02:08:30 AM
  static const hh_mm_ss_S_a = "hh:mm:ss.S a"; // 02:08:30.956 AM
  static const HH_mm = "HH:mm"; // 21:08
  static const HH_mm_ss = "HH:mm:ss"; // 21:08:30
}

/// datetime extension functions
extension DateTimeExtension on DateTime {
  String toSqlDateFormat() {
    return formatDate(this, [yyyy, '-', mm, '-', dd]);
  }

  String toSqlDateTimeFormat() {
    return formatDate(
        this, [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss]);
  }

  String toSqlStartDateTimeFormat() {
    return formatDate(
        this, [yyyy, '-', mm, '-', dd, ' ', '00', ':', '00', ':', '00']);
  }

  String toSqlEndDateTimeFormat() {
    return formatDate(
        this, [yyyy, '-', mm, '-', dd, ' ', '23', ':', '59', ':', '59']);
  }

  DateTime lastDateOfMonth() {
    return DateTime(this.year, this.month + 1, 0);
  }

  DateTime firstDateOfMonth() {
    return DateTime(this.year, this.month, 1);
  }

  String format(
      [String format = "${DateFormats.DD_MM_YYYY} ${TimeFormats.hh_mm_ss_a}"]) {
    return DateFormat(format).format(this);
  }

  DateTime addDay(int days) {
    return this.add(Duration(days: days));
  }

  DateTime subtractDay(int days) {
    return this.subtract(Duration(days: days));
  }

  DateTime addMonth(DateTime dateTime, int months) {
    return DateTime(dateTime.year, dateTime.month + months, dateTime.day,
        dateTime.hour, dateTime.minute, dateTime.second, dateTime.millisecond);
  }

  DateTime subtractMonth(DateTime dateTime, int months) {
    return DateTime(dateTime.year, dateTime.month - months, dateTime.day,
        dateTime.hour, dateTime.minute, dateTime.second, dateTime.millisecond);
  }

  DateTime addYear(DateTime dateTime, int years) {
    return DateTime(dateTime.year + years, dateTime.month, dateTime.day,
        dateTime.hour, dateTime.minute, dateTime.second, dateTime.millisecond);
  }

  DateTime subtractYear(DateTime dateTime, int years) {
    return DateTime(dateTime.year - years, dateTime.month, dateTime.day,
        dateTime.hour, dateTime.minute, dateTime.second, dateTime.millisecond);
  }

  Duration difference(DateTime firstDate, DateTime afterDate) {
    return afterDate.difference(firstDate);
  }
}
