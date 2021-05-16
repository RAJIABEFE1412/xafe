import 'package:flutter/material.dart';
import 'package:xafe/canvas/measure.dart';
import 'package:xafe/presentation/components/spacer.dart';
import 'package:xafe/presentation/components/xafe_text.dart';
import 'package:xafe/styles/colors.dart';
import 'package:xafe/styles/text.dart';
import 'package:xafe/utils/extensions.dart';

class XafeBudgetCard extends StatelessWidget {
  final int length;

  const XafeBudgetCard({Key key, this.length}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final sizer = context.scaler;
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Container(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            XafeSizedBox(height: 1.5),
            XafeText(
              'grocies',
              style: XafeTextStyle.lightGrey,
            ),
            XafeText(
              '\$40/month',
              style: XafeTextStyle.bold.copyWith(
                color: XafeColors.background,
              ),
            ),
            XafeSizedBox(height: 2),
            XafeSizedBox(
              height: 1.31,
              width: sizer.sizer.width * 0.014,
              child: CustomPaint(
                painter: MeasureCanvas(length, XafeColors.green),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
