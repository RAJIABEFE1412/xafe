import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xafe/state/auth_state.dart';
import 'package:xafe/utils/scroll_behaviour.dart';

class StateWrapper extends StatelessWidget {
  final Widget child;

  StateWrapper({
    @required this.child,

  });
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthState.instance,
          lazy: true,
        ),
        // ChangeNotifierProvider(
        //   create: (_) => DashboardState.instance,
        //   lazy: true,
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => ProfileState.instance,
        //   lazy: true,
        // ),
       
      ],
      child: ScrollConfiguration(
        behavior: XafeScrollAttitude(),
        child: child,
      ),
    );
  }
}
