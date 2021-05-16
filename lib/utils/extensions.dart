import 'package:flutter/widgets.dart';


import 'dimen.dart';

extension WidgetExtensions on Widget {
  List<Widget> operator *(int count) {
    return List.generate(count, (_) => this);
  }
}

extension ScaleExtension on BuildContext {
  XafeScaleUtil get scaler {
    return XafeScaleUtil(this);
  }
}