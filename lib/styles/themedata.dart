import 'package:flutter/material.dart';
import 'package:xafe/styles/text.dart';

import 'colors.dart';

class XafeThemes {
  static final base = ThemeData.light();
  static final ThemeData defaultTheme = base.copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    backgroundColor: XafeColors.white,
    scaffoldBackgroundColor: XafeColors.white,
    primaryColor: XafeColors.primary,
    accentColor: XafeColors.secondary,
    primaryColorBrightness: Brightness.light,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline6: TextStyle(
          color: XafeColors.black,
        ),
      ),
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: XafeColors.black),
      color: XafeColors.white,
      elevation: 0,
    ),
    dividerColor: XafeColors.black.withOpacity(.3),
    bottomAppBarColor: XafeColors.white,
    bottomAppBarTheme: base.bottomAppBarTheme.copyWith(
      elevation: 0,
      color: XafeColors.white,
    ),
    buttonTheme: base.buttonTheme.copyWith(
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      buttonColor: XafeColors.purple,
      disabledColor: XafeColors.purple.withOpacity(.5),
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
      backgroundColor: XafeColors.purple,
      foregroundColor: Colors.white,
    ),
    cardColor: XafeColors.white,
    textSelectionColor: XafeColors.purple.withOpacity(.3),
    errorColor: XafeColors.red,
    textTheme: base.textTheme.apply(
      displayColor: XafeColors.black,
      bodyColor: XafeColors.black,
      fontFamily: XefaFonts.markPro,
    ),
    indicatorColor: XafeColors.purple,
    textSelectionHandleColor: XafeColors.purple.withOpacity(.3),
    cursorColor: XafeColors.purple,
    iconTheme: base.iconTheme.copyWith(
      color: XafeColors.black,
      size: 30,
    ),
    inputDecorationTheme: InputDecorationTheme(
      errorMaxLines: 3,
      helperMaxLines: 3,
      isDense: true,
      filled: false,
      fillColor: XafeColors.transparent,
      suffixStyle: TextStyle(
        color: XafeColors.grayBorder,
      ),
      prefixStyle: TextStyle(
        color: XafeColors.grayBorder,
      ),
      labelStyle: TextStyle(
        color: XafeColors.black.withOpacity(.4),
        fontSize: base.textTheme.bodyText1.fontSize,
        fontWeight: FontWeight.w100,
      ),
      helperStyle: TextStyle(
        color: XafeColors.black.withOpacity(.4),
        fontSize: base.textTheme.bodyText1.fontSize,
        fontWeight: FontWeight.w100,
      ),
      hintStyle: TextStyle(
        color: XafeColors.black.withOpacity(.4),
        fontSize: base.textTheme.bodyText1.fontSize,
        fontWeight: FontWeight.w100,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: XafeColors.grayBorder, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: XafeColors.red, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: XafeColors.transparent,
          width: 0,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: XafeColors.grayBorder.withOpacity(.7), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: XafeColors.blueBorder, width: 1.2),
      ),
    ),
  );
}
