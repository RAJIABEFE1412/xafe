import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xafe/models/enums/stepper.dart';
import 'package:xafe/state/auth_state.dart';
import 'package:xafe/utils/type_defs.dart';

class XafeStepperListener extends StatelessWidget {
  final ListenerBuilder<XafeStepperEnum> builder;

  XafeStepperListener({@required this.builder});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthState>();
    return ValueListenableBuilder(
      valueListenable: authState.pageIndex,
      builder: (context, _, __) {
        // final userData = statusWithEmploy();
        return builder(context, _);
      },
    );
  }
}
