import 'package:flutter/material.dart';
import 'package:kickstarter/pages/page_dashboard.dart';
import 'package:kickstarter/widgets/widget_something_went_wrong.dart';

class NavigationProvider extends ChangeNotifier {
  int currentScreen = 2;
  int mediaPage = 1;

  Widget get getNavigation {
    switch (currentScreen) {
      case 0:
        return const PageSomethingWentWrong();

      case 1:
        return const DashboardPage();

      case 2:
        return const PageSomethingWentWrong();

      case 3:
        return const PageSomethingWentWrong();

      default:
        return const PageSomethingWentWrong();
    }
  }

  void updateNavigationScreen(int navigationScreen) {
    currentScreen = navigationScreen;
    notifyListeners();
  }
}
