import 'package:flutter/material.dart';
import 'package:xafe/styles/colors.dart';

class BottomNavIcon extends StatelessWidget {
  final IconData svg;
  final bool isActive;

  const BottomNavIcon(this.svg, this.isActive);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        svg,
        color: isActive ? XafeColors.background : XafeColors.darkGray,
      ),
    );
  }
}