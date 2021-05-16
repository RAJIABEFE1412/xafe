import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'
    show BuildContext, Widget, MaterialPageRoute, Route, RouteSettings;
import 'package:xafe/presentation/screens/auth/sign_up.dart';
import 'package:xafe/presentation/screens/auth/login.dart';
import 'package:xafe/presentation/screens/dashboard.dart';
import 'package:xafe/presentation/screens/dashboard/budget.dart';
import 'package:xafe/presentation/screens/dashboard/categories.dart';
import 'package:xafe/presentation/screens/dashboard/home.dart';
import 'package:xafe/presentation/screens/launch_screen.dart';

class XafeRoutes {
  static Widget launch = LaunchScreen();

  /// Splash Routes
  static const welcome = "/launch";

  /// password Routes
  static const password = "/password";

  /// email
  static const email = "/email";

  /// Auth
  static const login = "/login";
  static const dashboard = "/dashboard";

  /// Dasboard Recovery
  static const home = "/dasboard/home";
  static const categories = "/dasboard/categories";
  static const budget = "/dasboard/budget";

  /// Profile Information
  // static const profileBvn = "/profile/bvn";
  


  static Map<String, Widget Function(BuildContext)> staticRoutes = {
    welcome: (BuildContext context) => LaunchScreen(),
    login: (BuildContext context) => LoginPage(),
    email: (BuildContext context) => EmailPage(),
    dashboard: (BuildContext context) => DashboardPage(),
    home: (BuildContext context) => Home(),
    categories: (BuildContext context) => Categories(),
    budget: (BuildContext context) =>  Budget(),
  };

  static Route<dynamic> dynamicRoutes(RouteSettings settings) {
    switch (settings.name) {
      
    }
  }
}
