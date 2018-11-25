import 'package:flutter/material.dart';
import 'package:flutter_app_redux/utils/string_util.dart';

class DateTimeUtil {
  /// 比较两个 TimeOfDate 时间
  static int compareTimeOfDate(TimeOfDay source, TimeOfDay target) {
    if (source == target) {
      return 0;
    } else if ((source.hour > target.hour) ||
        (source.hour == target.hour && source.minute > target.minute)) {
      return 1;
    } else {
      return -1;
    }
  }

  static num dateTime2Number(String time) =>
      DateTime.parse(time.replaceFirst('T', ' ')).millisecondsSinceEpoch;

  /// yyyy-MM-dd HH:mm
  static String dateTimeNormal(String time) {
    if (StringUtil.isNullOrBlank(time))
      return '';
    else if (time.length < 16)
      return time;
    else
      return time.replaceAll('T', ' ').substring(0, 16);
  }

  /// yyyy-MM-dd HH:mm:ss
  static String dateTimeLong(String time) {
    if (StringUtil.isNullOrBlank(time))
      return '';
    else if (time.length < 19) return time;
    return time.replaceAll('T', ' ').substring(0, 19);
  }

  static String dateTimeSimple(String time) {
    if (StringUtil.isNullOrBlank(time))
      return '';
    else if (time.indexOf('T') < 0)
      return time;
    else
      return time.substring(0, time.indexOf('T'));
  }

  static String dateTimeNowIso() => DateTime.now().toIso8601String();

  static int dateTimeNowMilli() => DateTime.now().millisecondsSinceEpoch;
}
