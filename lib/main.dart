import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:xafe/styles/themedata.dart';
import 'package:xafe/values/routes.dart';
import 'package:xafe/values/state_wrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StateWrapper(
      child: MaterialApp(
        title: 'Xafe Demo',
        debugShowCheckedModeBanner: false,
        theme: XafeThemes.defaultTheme,
        routes: XafeRoutes.staticRoutes,
        onGenerateRoute: XafeRoutes.dynamicRoutes,
        home: XafeRoutes.launch,
      ),
    );
  }
}
