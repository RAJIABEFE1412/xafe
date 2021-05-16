import 'package:flutter/material.dart';

class XafeColors {
  static const MaterialColor primary = const MaterialColor(
    0xFFFFFFFF,
    const <int, Color>{
      50: const Color(0xFFFFFFFF),
      100: const Color(0xFFFFFFFF),
      200: const Color(0xFFFFFFFF),
      300: const Color(0xFFFFFFFF),
      400: const Color(0xFFFFFFFF),
      500: const Color(0xFFFFFFFF),
      600: const Color(0xFFFFFFFF),
      700: const Color(0xFFFFFFFF),
      800: const Color(0xFFFFFFFF),
      900: const Color(0xFFFFFFFF),
    },
  );

  static const MaterialColor secondary = const MaterialColor(
    0xFF051C3F,
    const <int, Color>{
      50: const Color.fromRGBO(77, 59, 145, 0.1),
      100: const Color.fromRGBO(77, 59, 145, 0.2),
      200: const Color.fromRGBO(77, 59, 145, 0.3),
      300: const Color.fromRGBO(77, 59, 145, 0.4),
      400: const Color.fromRGBO(77, 59, 145, 0.5),
      500: const Color.fromRGBO(77, 59, 145, 0.6),
      600: const Color.fromRGBO(77, 59, 145, 0.7),
      700: const Color.fromRGBO(77, 59, 145, 0.8),
      800: const Color.fromRGBO(77, 59, 145, 0.9),
      900: const Color.fromRGBO(77, 59, 145, 1),
    },
  );
  static const Color blue = Color(0xFF0047FF);
  static const Color background = Color(0xFF0F0627);
  static const Color subTitleColor = Color(0xFF9A96A4);
  static const Color pink50 = Color(0xFFFF529B);
  static const Color green = Color(0xFF02B474);
  static const Color orange = Color(0xFFFF8514);
  static const Color fillColor = Color(0xffF8F8F9);
  static const Color white = Color(0xFFFFFFFF);
  static const Color transparent = Color(0x00);
  static const Color purple = Color(0xFF4D3B91);
  static const Color purpleLight = Color(0xFF5166FF);
  static const Color purplePale = Color(0xFFF2EFFF);
  static const Color purplePaleDark = Color(0xFFE8E2FF);
  static const Color gray = Color(0xFFE0E0E0);
  static const Color darkGray = Color(0xFF8A8A8F);
  static const Color grayBorder = Color(0xFFEFEFEF);
  static const Color grayBtn = Color(0xFFF3F3F3);
  static const Color grayScaffold = Color(0xFFE5E5E5);

  static const Color navy = Color(0xFF03435F);
  static const Color blueSky = Color(0xFFE9F3FF);
  static const Color blueBorder = Color(0xFF007AFF);
  static const Color yellow = Color(0xFFFFE3AC);
  static const Color yellowPale = Color(0xFFFFF6DB);
  static const Color yellowPaleDark = Color(0xFFFFEEBB);
  static const Color red = Color(0xFFF35656);
  static const Color redLight = Color(0xFFFEB9B9);
  static const Color velvet = Color(0xFFCB2026);
  static const Color pink = Color(0xFFFFDDFC);
  static const Color greenPale = Color(0xFFDEFFEC);
  static const Color greenPaleDark = Color(0xFFB9FFD7);
  static const Color black = Color(0xFF212121);
  static const Color divider = Color(0xFFDADADA);
  static const Color dividerDark = Color(0xFFB9B9B9);
  static const Color darkGrey = Color(0xFF656F78);

  static const purpleGradient = LinearGradient(
    colors: [
      Color(0xFF2C1B68),
      Color.fromRGBO(66, 27, 104, 0.85),
    ],
    stops: [
      0,
      1.14,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
