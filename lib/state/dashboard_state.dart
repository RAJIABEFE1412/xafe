import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show ChangeNotifier, ValueNotifier;
import 'package:flutter/material.dart';
import 'package:xafe/fonts/xafeicons_icons.dart';
import 'package:xafe/models/dashboard/dashboard.dart';
import 'package:xafe/presentation/screens/dashboard/budget.dart';
import 'package:xafe/presentation/screens/dashboard/categories.dart';
import 'package:xafe/presentation/screens/dashboard/home.dart';

class DashboardState extends ChangeNotifier {
  static DashboardState _instance;
  ValueNotifier<int> pageIndex = ValueNotifier(0);
  List<int> pageStack = [0];
  final List<DashbaordPageData> pages = [
    DashbaordPageData(
      page: Home(),
      name: "Home",
      icon: XafeIcons.home,
    ),
    DashbaordPageData(
      page: Categories(),
      name: "Categories",
      icon: CupertinoIcons.search,
    ),
    DashbaordPageData(
      page: Budget(),
      name: "Budget",
      icon: XafeIcons.budget,
    ),
   
  ];

  clearData() {
    pageIndex.value = 0;
    pageStack = [0];
  }

  static DashboardState get instance {
    if (_instance == null) {
      _instance = DashboardState();
    }
    return _instance;
  }

  handlePageChange({int page}) {
    if (pageStack.last != page) {
      pageStack.add(page);
    }
    pageIndex.value = page;
    notifyListeners();
  }
}
