import 'package:flutter/material.dart';
import 'package:xafe/presentation/components/xafe_text.dart';


class ButtonText extends StatelessWidget {
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;
  final String text;
  final bool fitted;

  ButtonText(
    this.text, {
    this.fontSize = 50,
    this.textColor,
    this.fontWeight = FontWeight.w500,
    this.fitted = true
  });

  Widget _child(TextStyle btnTheme) {
    return XafeText(
        text ?? "Tap",
        textAlign: TextAlign.center,
        style: btnTheme.copyWith(
          fontSize: fontSize,
          color: textColor,
          fontWeight: fontWeight,
        ),
        maxLines: 1,
      );
  }

  @override
  Widget build(BuildContext context) {
    final btnTheme = Theme.of(context).textTheme.button;
    return fitted ?  FittedBox(
      child: _child(btnTheme)
    ) : _child(btnTheme);
  }
}
