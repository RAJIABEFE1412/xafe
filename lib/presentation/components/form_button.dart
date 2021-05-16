import 'package:flutter/material.dart';
import 'package:xafe/styles/colors.dart';
import 'package:xafe/utils/dimen.dart';
import 'package:xafe/utils/type_defs.dart';


import 'button_text.dart';

class XafeButton extends StatelessWidget {
  final OnPressed onPressed;
  final Color color;
  final Color disabledColor;
  final Color textColor;
  final String text;
  final bool isDense;
  final bool isFitted;
  final bool isBold;
  final double verticalPadding;
  final double horizontalPadding;
  final double fontSize;
  final double cornerRadius;

  XafeButton({
    @required this.text,
    @required this.onPressed,
    this.color = XafeColors.blue,
    this.textColor = XafeColors.white,
    this.disabledColor,
    this.isDense = false,
    this.isBold = false,
    this.isFitted = true,
    this.verticalPadding,
    this.horizontalPadding,
    this.fontSize = 40,
    this.cornerRadius = 30,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaler = XafeScaleUtil(context);
    return FlatButton(
      disabledColor: disabledColor ?? color.withOpacity(.5),
      padding: scaler.insets.symmetric(
        vertical: verticalPadding ?? (isDense ? 2 : 2.5),
        horizontal: horizontalPadding ?? 8,
      ),
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          scaler.fontSizer.sp(cornerRadius),
        ),
      ),
      child: ButtonText(
        text,
        textColor: onPressed != null ? textColor : textColor.withOpacity(.4),
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontSize: fontSize,
        fitted: isFitted,
      ),
      onPressed: onPressed != null
          ? () {
              FocusScope.of(context).requestFocus(
                new FocusNode(),
              );
              onPressed();
            }
          : null,
    );
  }
}
