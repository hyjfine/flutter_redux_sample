import 'package:flutter/foundation.dart';
import 'datetime_util.dart';

class PrintUtil {
  /// 通用打印方法，Release 不会打印，超长字符串分段打印
  static print(dynamic message) {
    if (message != null) {
      var content = message.toString();
      if (content == '') {
        debugPrint('${DateTimeUtil.dateTimeNowIso()} ');
        return;
      }
      while (content.length > 800) {
        debugPrint(
            '${DateTimeUtil.dateTimeNowIso()} ${content.substring(0, 800)}');
        content = content.substring(800, content.length);
      }
      if (content != '')
        debugPrint('${DateTimeUtil.dateTimeNowIso()} $content');
    }
  }
}
