import 'package:flutter/material.dart';

import 'package:xafe/styles/colors.dart';

class MeasureCanvas extends CustomPainter {
  int length;
  Color color;

  MeasureCanvas(this.length,this.color);
  @override
  void paint(Canvas cv, Size size) {
    Paint paintBackground = Paint()
      ..strokeCap = StrokeCap.round
      ..color = XafeColors.gray
      ..style = PaintingStyle.fill;
    Paint paintForeground = Paint()
      ..strokeCap = StrokeCap.round
      ..color = color
      ..style = PaintingStyle.fill;

    cv.drawRRect(
        RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height),
            Radius.circular(40.0)),
        paintBackground);
    cv.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(0, 0, (size.width / (length / 10)), size.height),
            Radius.circular(40.0)),
        paintForeground);
  }

  @override
  bool shouldRepaint(covariant MeasureCanvas oldDelegate) =>
      oldDelegate.length != length;
}
