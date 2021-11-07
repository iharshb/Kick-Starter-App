import 'package:flutter/material.dart';
import 'package:kickstarter/utils/z_imports_utils.dart';
import 'package:kickstarter/widgets/z_imports_widgets.dart';
import 'z_imports_services.dart';

class ApiServices {
  final ApiBaseHelper _helper = ApiBaseHelper();

  // If Some One is logged In in another device then forcefully Log Out in App.
  logout(BuildContext context) {
    DialogHelper()
        .showMessage(context, AppConstants.appName, "Some one Logged-In with another device. Please login again.", () {
      Navigator.pop(context);
      PreferenceManager.clear();
      //  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), (r) => false);
    });
  }

  AppException handleException(AppException e, BuildContext context) {
    return e;
  }
}
