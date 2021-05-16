import 'package:flutter/material.dart';
import 'package:xafe/styles/colors.dart';
import 'package:xafe/styles/text.dart';

import '../xafe_text.dart';

class BottomNavText extends StatelessWidget {
  final String label;
  final bool isActive;

  const BottomNavText(this.label, this.isActive);
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: XafeText(
        label,
        style: XafeTextStyle.light.copyWith(
          color: isActive ? XafeColors.black : XafeColors.darkGray,
          fontSize: 45,
        ),
      ),
    );
  }
}
