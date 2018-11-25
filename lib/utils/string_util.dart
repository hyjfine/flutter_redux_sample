class StringUtil {
  static bool isValidPhone(String input) {
    return input != null && input.startsWith('1') && input.length == 11;
  }

  static bool isNullOrBlank(String content) =>
      content == null || content.isEmpty;

  static String getMaskPhone(String input) {
    if (!isValidPhone(input)) return '手机号不合法';
    return input.replaceAllMapped(
        RegExp(r'(\d{3})\d{4}(\d{4})'), (Match m) => '${m[1]}****${m[2]}');
  }
}
