import 'package:flutter/material.dart';
import 'package:xafe/fonts/xafeicons_icons.dart';
import 'package:xafe/styles/colors.dart';

class XafeEditPencil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 40.0,
        height: 40.0,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: XafeColors.white),
        child: Icon(
          XafeIcons.pecncil,
          size: 20.0,
          color: XafeColors.blue,
        ),
      ),
    );
  }
}
