import 'package:flutter/material.dart';
import 'package:flutter_app_redux/typings/border_style.dart';

class HStyles {
  static const borderStyle = const CommonBorderStyle(HColors.border, 0.5);
  static const positiveDialogActionStyle =
      TextStyle(fontSize: HFontSizes.small, color: HColors.primary);
  static const negativeDialogActionStyle =
      TextStyle(fontSize: HFontSizes.small, color: HColors.mediumGrey);
  static const titleBarHeight = 56.0;
  static const itemHeight = 44.0;
}

class HIconSizes {
  static const large = 56.0;
  static const medium = 24.0;
  static const normal = 18.0;
  static const small = 12.0;
}

class HFontSizes {
  static const huger = 30.0;
  static const huge = 26.0;
  static const large = 20.0;
  static const medium = 18.0;
  static const normal = 16.0;
  static const small = 14.0;
  static const smaller = 12.0;
  static const min = 10.0;
}

class HColors {
  static const Color primary = Color(0xFF448AFF);
  static const Color lightPrimary = Color(0xFFE3F3FF);
  static const Color lighterPrimary = Color(0xFFA3C4FC);
  static const Color darkPrimary = Color(0xFF67A4FA);

  static const Color secondary = Color(0xFFE95E3D);
  static const Color border = Color(0xFFE0E0E0);
  static const Color background = Color(0xFFF9F9F9);
  static const Color disabled = Color(0xFFD1D6DC);
  static const Color orange = Color(0xFFF5A523);
  static const Color lightGreen = Color(0xFF65EFD2);
  static const Color darkGreen = Color(0xFF079770);

  static const Color pink = Color(0xFFFF7C9E);
  static const Color darkGrey = Color(0xFF36475A);
  static const Color mediumGrey = Color(0xFF86919C);
  static const Color lightGrey = Color(0xFFAFB5BD);
  static const Color lighterGrey = Color(0xFFDEE4EC);

  static const MaterialColor theme = MaterialColor(
    0xFF448AFF,
    <int, Color>{
      50: Color(0xFF448AFF), // TODO: 色板需要重新计算 rgb 值
      100: Color(0xFF448AFF),
      200: Color(0xFF448AFF),
      300: Color(0xFF448AFF),
      400: Color(0xFF448AFF),
      500: Color(0xFF448AFF), // primary
      600: Color(0xFF448AFF),
      700: Color(0xFF448AFF),
      800: Color(0xFF448AFF),
      900: Color(0xFF448AFF),
    },
  );
}
