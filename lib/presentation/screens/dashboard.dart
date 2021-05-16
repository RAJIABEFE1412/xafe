import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xafe/presentation/components/bottom_nav/bottom_nav_icon.dart';
import 'package:xafe/presentation/components/bottom_nav/bottom_nav_text.dart';
import 'package:xafe/state/dashboard_state.dart';
import 'package:xafe/styles/colors.dart';
class DashboardPage extends StatelessWidget with WidgetsBindingObserver {
  final PageController ctrl = PageController(
    initialPage: DashboardState?.instance?.pageIndex?.value ?? 0,
  );

  @override
  Widget build(BuildContext context) {
    final model = context.watch<DashboardState>();

    return WillPopScope(
      onWillPop: () async {
        if (model.pageStack.length > 1) {
          model.pageStack.removeLast();
          ctrl.jumpToPage(model.pageStack.last);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: model.pageIndex,
          builder: (context, int index, _) {
            return BottomNavigationBar(
              currentIndex: index,
              onTap: (int index) {
                ctrl.jumpToPage(index);
              },
              showUnselectedLabels: true,
              backgroundColor: index == 3 ? XafeColors.grayScaffold.withOpacity(.2) : XafeColors.white,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              items: [
                for (final item in model.pages)
                  BottomNavigationBarItem(
                    icon: BottomNavIcon(
                      item.icon,
                      index == model.pages.indexOf(item),
                    ),
                    // ignore: deprecated_member_use
                    title: BottomNavText(
                      item.name,
                      index == model.pages.indexOf(item),
                    ),
                  ),
              ],
            );
          },
        ),
        body: PageView.custom(
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (int page) => model.handlePageChange(page: page),
          controller: ctrl,
          childrenDelegate: SliverChildBuilderDelegate(
            (context, idx) {
              return model?.pages[idx]?.page;
            },
            childCount: model?.pages?.length ?? 0,
          ),
        ),
      ),
    );
  }
}
