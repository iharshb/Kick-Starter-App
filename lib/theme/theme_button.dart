import 'package:flutter/material.dart';
import 'package:kickstarter/utils/z_imports_utils.dart';

buttonThemeLight() {
  return ButtonThemeData(
      padding: EdgeInsets.all(ScreenUtil().setWidth(40)),
      textTheme: ButtonTextTheme.primary,
      buttonColor: ColorConstants.buttonColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(ScreenUtil().setWidth(2))));
}

buttonThemeDark() {
  return ButtonThemeData(
      padding: EdgeInsets.all(ScreenUtil().setWidth(40)),
      textTheme: ButtonTextTheme.primary,
      buttonColor: Colors.lightGreen,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(ScreenUtil().setWidth(2))));
}
