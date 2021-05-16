import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:xafe/utils/dimen.dart';
import 'package:xafe/utils/type_defs.dart';


class XafeRichText extends StatelessWidget {
  final String data;
  final String boldData;
  final TextStyle style;
  final TextStyle styleData;
  final TextAlign textAlign;
  final Locale locale;
  final OnPressed tap;
  final StrutStyle strutStyle;
  final bool softWrap;
  final int maxLines;
  final TextDirection textDirection;
  final TextOverflow overflow;

  const XafeRichText(
    this.data,
    this.boldData, {
    this.style,
    this.tap,
    this.styleData,
    this.textAlign,
    this.locale,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _style =
        style != null ? style : Theme.of(context).textTheme.bodyText2;
    final _styleData =
        styleData != null ? styleData : Theme.of(context).textTheme.bodyText1;
    final _fontSize = style != null ? _style.fontSize ?? 45.0 : 45.0;
    // final _fontWeight =
    //     style != null ? _style.fontWeight ?? FontWeight.w100 : FontWeight.w100;
    final fontSizer = XafeScaleUtil(context).fontSizer;

    return RichText(
      text: TextSpan(
          text: data ?? "",
          style: _style.copyWith(
            fontSize: fontSizer.sp(_fontSize),
          ),
          // strutStyle: strutStyle,
          // textAlign: textAlign,
          // locale: locale,
          // maxLines: maxLines,
          // overflow: overflow,
          // softWrap: softWrap,
          // textDirection: textDirection,
          // textWidthBasis: TextWidthBasis.parent,

          children: <TextSpan>[
            TextSpan(
              text: ' ${boldData ?? ''}',
              style: _styleData.copyWith(
                fontSize: fontSizer.sp(_fontSize + 1.5),
              ),
              recognizer: TapGestureRecognizer()..onTap = tap,
            ),
          ]),
    );
  }
}
