import 'package:flutter/material.dart';
import 'package:xafe/models/enums/stepper.dart';
import 'package:xafe/styles/colors.dart';

class StepCanvas extends CustomPainter {
  XafeStepperEnum length;

  StepCanvas(this.length);
  @override
  void paint(Canvas cv, Size size) {
    Paint paintBackground = Paint()
      ..strokeCap = StrokeCap.round
      ..color = XafeColors.gray
      ..style = PaintingStyle.fill;
    Paint paintForeground = Paint()
      ..strokeCap = StrokeCap.round
      ..color = XafeColors.background
      ..style = PaintingStyle.fill;

    cv.drawRRect(
        RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height),
            Radius.circular(40.0)),
        paintBackground);
    cv.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(
                0,
                0,
                (size.width /
                    (length == XafeStepperEnum.IS_FIRST
                        ? 3
                        : length == XafeStepperEnum.IS_SECOND
                            ? (3 / 2)
                            : 1)),
                size.height),
            Radius.circular(40.0)),
        paintForeground);
  }

  @override
  bool shouldRepaint(covariant StepCanvas oldDelegate) =>
      oldDelegate.length != length;
}
