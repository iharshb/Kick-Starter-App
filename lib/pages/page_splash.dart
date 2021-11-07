import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kickstarter/pages/authentication/page_login.dart';
import 'package:kickstarter/utils/z_imports_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Screen size;
  late String valueTheme;

  @override
  void initState() {
    super.initState();
    PreferenceManager.getInstance();
    Timer(const Duration(seconds: 1), () {
      navigateFromSplash();
    });
  }

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return Scaffold(
        body: Center(
      child: Container(
        color: ColorConstants.whiteTextColor,
      ),
    ));
  }

  void navigateFromSplash() {
    bool isLoggedIn = PreferenceManager.getBool(AppConstants.isLoggedIn);

    if (!isLoggedIn) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }
}
