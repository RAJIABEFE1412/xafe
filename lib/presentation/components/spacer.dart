import 'package:flutter/widgets.dart';
import 'package:xafe/utils/dimen.dart';

class XafeSizedBox extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;

  const XafeSizedBox({this.height = 0, this.width = 0, this.child});

  @override
  Widget build(BuildContext context) {
    final sizer = XafeScaleUtil(context).sizer;
    return SizedBox(
      height: sizer.setHeight(height),
      width: sizer.setWidth(width),
      child: child,
    );
  }
}
