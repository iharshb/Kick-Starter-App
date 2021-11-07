import 'package:flutter/material.dart';
import 'package:kickstarter/utils/z_imports_utils.dart';

inputDecorationThemeLight() {
  return InputDecorationTheme(
      hintStyle: TextStyle(
          color: ColorConstants.hintLightColor, fontFamily: FontAssets.regularFont, fontSize: ScreenUtil().setSp(40)),
      labelStyle: TextStyle(
          fontFamily: FontAssets.regularFont, color: ColorConstants.hintLightColor, fontSize: ScreenUtil().setSp(40)),
      focusColor: ColorConstants.buttonColor,
      helperStyle: TextStyle(
          color: ColorConstants.primaryTextColor, fontFamily: FontAssets.regularFont, fontSize: ScreenUtil().setSp(40)),
      focusedBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(16))),
        borderSide: BorderSide(color: ColorConstants.appLightColor, width: 2.0),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(16))),
        borderSide: BorderSide(color: ColorConstants.appColor, width: 2.0),
      ),
      errorStyle: const TextStyle(color: Colors.redAccent),
      contentPadding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30)),
      errorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(16))),
        borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
      ),
      disabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(16))),
        borderSide: BorderSide(color: ColorConstants.appLightColor, width: 2.0),
      ),
      enabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(16))),
        borderSide: BorderSide(color: ColorConstants.appLightColor, width: 2.0),
      ));
}

inputDecorationThemeDark() {
  return InputDecorationTheme(
      hintStyle: TextStyle(
          color: ColorConstants.hintDarkColor, fontFamily: FontAssets.regularFont, fontSize: ScreenUtil().setSp(40)),
      labelStyle: TextStyle(fontFamily: FontAssets.regularFont, fontSize: ScreenUtil().setSp(40)),
      helperStyle: TextStyle(
          color: ColorConstants.hintDarkColor, fontFamily: FontAssets.regularFont, fontSize: ScreenUtil().setSp(40)),
      focusedBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(20))),
        borderSide: BorderSide(color: ColorConstants.appColor, width: 1.0),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(20))),
        borderSide: BorderSide(color: ColorConstants.appColor, width: 1.0),
      ),
      errorStyle: const TextStyle(color: Colors.redAccent),
      contentPadding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30)),
      errorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(20))),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1.0),
      ),
      disabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(20))),
        borderSide: BorderSide(color: ColorConstants.borderLightColor, width: 1.0),
      ),
      enabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(20))),
        borderSide: BorderSide(color: ColorConstants.borderLightColor, width: 1.0),
      ));
}
