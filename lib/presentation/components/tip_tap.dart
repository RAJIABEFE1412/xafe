import 'package:flutter/material.dart';
import 'package:xafe/styles/colors.dart';
import 'package:xafe/styles/text.dart';
import 'package:xafe/utils/type_defs.dart';

class XafeTipTap extends StatelessWidget {
  final String hint;
  final OnPressed tap;
  const XafeTipTap({Key key, this.hint, this.tap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: tap,
        child: Text(
          '$hint',
          style: XafeTextStyle.medium.copyWith(
            color: XafeColors.background,
          ),
        ),
      ),
    );
  }
}
