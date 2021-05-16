import 'package:flutter/widgets.dart' show TextStyle, FontWeight;


import 'colors.dart';

class XefaFonts {
  ///
  /// FONT-FAMILY MARK PRO
  ///
  static const markPro = "MarkPro";
}

class XafeTextStyle {
  static const TextStyle light = TextStyle(
    fontFamily: XefaFonts.markPro,
    fontWeight: FontWeight.w200,
    color: XafeColors.white,
  );
 static const TextStyle lightGrey = TextStyle(
    fontFamily: XefaFonts.markPro,
    fontWeight: FontWeight.w200,
    color: XafeColors.subTitleColor,
  );
  static const TextStyle medium = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: XefaFonts.markPro,
    color: XafeColors.white,
  );

  static final TextStyle xbold = TextStyle(
    fontWeight: FontWeight.w700,
    color: XafeColors.white,
    fontSize: 70.0,
    fontFamily: XefaFonts.markPro,
  );
  static final TextStyle bold = TextStyle(
    fontWeight: FontWeight.w700,
    color: XafeColors.white,
    fontFamily: XefaFonts.markPro,
  );

   static final TextStyle sbold = TextStyle(
    fontWeight: FontWeight.w700,
    color: XafeColors.white,
    fontSize: 57.0,
    fontFamily: XefaFonts.markPro,
  );

  static final TextStyle black = TextStyle(
    fontWeight: FontWeight.w900,
    fontFamily: XefaFonts.markPro,

  );
}
