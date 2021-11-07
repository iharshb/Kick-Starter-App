import 'package:flutter/material.dart';
import 'package:kickstarter/utils/z_imports_utils.dart';

textThemeLight() {
  return TextTheme(
    subtitle1: TextStyle(color: ColorConstants.primaryTextColor, fontFamily: FontAssets.appFont),
  );
}

textThemeDark() {
  return TextTheme(
      subtitle1: TextStyle(
    color: Colors.white70,
    fontFamily: FontAssets.appFont,
  ));
}
