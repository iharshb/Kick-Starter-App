import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:kickstarter/utils/z_imports_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  static Future<bool> checkConnection() async {
    return await check() ? true : false;
  }

  static Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  static hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  static String convertStringFromDate(DateTime date) {
    print(formatDate(date, [yyyy, '-', mm, '-', dd]));
    return formatDate(date, [yyyy, '-', mm, '-', dd]);
  }

  static DateTime stringToDate(String date) {
    return DateFormat('yyyy-mm-dd').parse(date).toLocal();
  }

  static bool? isAndroidPlatform() {
    if (Platform.isAndroid) {
      return true;
      // Android-specific code
    } else if (Platform.isIOS) {
      // iOS-specific code
      return false;
    }
  }
}
