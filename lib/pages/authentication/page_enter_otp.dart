import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kickstarter/utils/z_imports_utils.dart';
import 'package:kickstarter/widgets/z_imports_widgets.dart';
import 'package:provider/provider.dart';

class VerifyOTPPage extends StatefulWidget {
  const VerifyOTPPage({Key? key}) : super(key: key);

  @override
  _VerifyOTPPageState createState() => _VerifyOTPPageState();
}

class _VerifyOTPPageState extends State<VerifyOTPPage> {
  late Screen size;
  late ThemeData theme;

  final TextEditingController _otpController = TextEditingController(text: "");
  String thisText = "";
  int pinLength = 6;
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConstants.whiteTextColor,
        iconTheme: IconThemeData(color: ColorConstants.hintLightColor),
      ),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        children: [
          ProgressWidget(
            isShow: false,
            child: Container(
              padding: EdgeInsets.all(size.getWidthPx(60)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      topHeaderWidgets(),
                      SizedBox(height: size.getHeightPx(40)),
                      otpTextFieldWidget(),
                      SizedBox(height: size.getHeightPx(40)),
                      bottomTextWidget(),
                      SizedBox(height: size.hp(6)),
                      _verifyButton(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget topHeaderWidgets() {
    return Column(children: [
      CircleAvatar(
        maxRadius: size.wp(14),
        child: Icon(
          FontAwesomeIcons.userCheck,
          size: size.wp(12),
        ),
      ),
      SizedBox(height: size.hp(4)),
      headerTextWidget(),
      SizedBox(height: size.hp(6)),
      subHeaderTextWidget(),
      SizedBox(height: size.hp(4)),
    ]);
  }

  Text headerTextWidget() {
    return Text(Strings.otpVerification,
        textAlign: TextAlign.center,
        style: theme.textTheme.headline5!
            .copyWith(color: ColorConstants.primaryTextColor, fontFamily: FontAssets.semiBoldFont));
  }

  Text subHeaderTextWidget() {
    return Text(Strings.verificationMsg,
        textAlign: TextAlign.center,
        style:
            theme.textTheme.subtitle1!.copyWith(color: ColorConstants.secondaryTextColor, fontWeight: FontWeight.w500));
  }

  Widget _verifyButton() {
    return CustomButton(
      onPressed: () {
        _validateInputs();
      },
      text: Strings.verify.toUpperCase(),
      color: ColorConstants.buttonColor,
      textColor: Colors.white,
      borderColor: ColorConstants.buttonColor,
      borderRadius: size.getWidthPx(12),
      padding: EdgeInsets.symmetric(horizontal: size.wp(20), vertical: size.getHeightPx(32)),
    );
  }

  void _validateInputs() async {
    Utils.hideKeyboard(context);
    if (_otpController.text.trim().length == 6) {
    } else {
      DialogHelper().showMessage(context, AppConstants.appName, "Invalid OTP", () {
        Navigator.pop(context);
      }, dismiss: true);
    }
  }

  Center otpTextFieldWidget() {
    return Center(
      child: PinCodeTextField(
        autofocus: false,
        controller: _otpController,
        hideCharacter: false,
        highlight: true,
        highlightColor: ColorConstants.buttonColor,
        defaultBorderColor: ColorConstants.appColor,
        hasTextBorderColor: ColorConstants.buttonColor,
        maxLength: pinLength,
        pinBoxRadius: size.getWidthPx(6),
        hasError: hasError,
        pinBoxHeight: size.getWidthPx(120),
        pinBoxWidth: size.getWidthPx(120),
        pinBoxOuterPadding: EdgeInsets.all(size.getWidthPx(20)),
        onTextChanged: (text) {},
        highlightPinBoxColor: ColorConstants.whiteTextColor,
        isCupertino: true,
        onDone: (text) {},
        pinBoxBorderWidth: 1.0,
        wrapAlignment: WrapAlignment.end,
        pinBoxDecoration: ProvidedPinBoxDecoration.defaultPinBoxDecoration,
        pinBoxColor: ColorConstants.dividerColor,
        pinTextStyle: theme.textTheme.subtitle1!.copyWith(fontFamily: FontAssets.semiBoldFont),
        pinTextAnimatedSwitcherTransition: ProvidedPinBoxTextAnimation.scalingTransition,
        pinTextAnimatedSwitcherDuration: const Duration(milliseconds: 100),
        highlightAnimationBeginColor: ColorConstants.appColor,
        highlightAnimationEndColor: ColorConstants.appColor,
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget bottomTextWidget() {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(Strings.didntReceivedOTP,
              style: theme.textTheme.subtitle2!
                  .copyWith(fontFamily: FontAssets.semiBoldFont, color: ColorConstants.hintLightColor)),
          SizedBox(width: size.getWidthPx(10)),
          GestureDetector(
            onTap: () {},
            child: Text(Strings.resend,
                style: theme.textTheme.subtitle2!
                    .copyWith(fontFamily: FontAssets.semiBoldFont, color: ColorConstants.buttonColor)),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }
}
