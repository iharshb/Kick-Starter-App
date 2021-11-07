import 'package:flutter/material.dart';
import 'package:kickstarter/pages/authentication/page_forgotpass.dart';
import 'package:kickstarter/providers/provider_bottom_navigation.dart';
import 'package:kickstarter/providers/provider_login.dart';
import 'package:kickstarter/utils/z_imports_utils.dart';
import 'package:kickstarter/widgets/z_imports_widgets.dart';
import 'package:provider/provider.dart';

import '../page_onboarding.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();
  late Screen size;
  late ThemeData theme;
  late LoginProvider loginProvider;

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    theme = Theme.of(context);
    loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ProgressWidget(
        isShow: false,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.all(size.getWidthPx(60)),
            child: SafeArea(
              child: Form(
                key: _formKey,
                autovalidate: loginProvider.autoValidate,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: size.hp(20)),
                    topHeaderWidgets(),
                    SizedBox(height: size.getHeightPx(140)),
                    _emailWidget(),
                    _passwordWidget(),
                    commonHeight(),
                    textForgotPwd(),
                    SizedBox(height: size.getHeightPx(140)),
                    _loginButtonWidget(),
                    commonHeight(),
                    SizedBox(height: size.getHeightPx(140)),
                    //bottomTextWidget()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector textForgotPwd() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ForgotPasswordPage()),
        );
      },
      child: Text(Strings.forgotPassword,
          textAlign: TextAlign.end,
          style: theme.textTheme.subtitle2!
              .copyWith(fontFamily: FontAssets.semiBoldFont, color: ColorConstants.buttonColor)),
    );
  }

  Widget commonHeight() {
    return SizedBox(height: size.getHeightPx(40));
  }

  Widget topHeaderWidgets() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      headerTextWidget(),
      SizedBox(
        height: size.getHeightPx(40),
      ),
      subHeaderTextWidget(),
    ]);
  }

  Text headerTextWidget() {
    return Text(Strings.hiWelcomeBack,
        textAlign: TextAlign.center,
        style: theme.textTheme.headline5!
            .copyWith(color: ColorConstants.primaryTextColor, fontFamily: FontAssets.semiBoldFont));
  }

  Text subHeaderTextWidget() {
    return Text(Strings.loginNow,
        textAlign: TextAlign.center,
        style: theme.textTheme.headline6!
            .copyWith(color: ColorConstants.buttonColor, fontFamily: FontAssets.semiBoldFont));
  }

  Widget _emailWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.getHeightPx(20)),
      child: TextFormField(
        textAlign: TextAlign.left,
        focusNode: _emailFocusNode,
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        style: theme.textTheme.subtitle1!.copyWith(fontFamily: FontAssets.semiBoldFont, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
            hintText: Strings.email,
            labelText: Strings.email,
            prefixIcon: Icon(
              Icons.email,
              size: size.getWidthPx(60),
            )),
        validator: (value) {
          return ValidationUtils().validateEmail(value!);
        },
        onChanged: (value) {},
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(_passwordFocusNode);
        },
      ),
    );
  }

  Widget _passwordWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.getHeightPx(20)),
      child: TextFormField(
        textAlign: TextAlign.left,
        obscureText: true,
        focusNode: _passwordFocusNode,
        controller: _passwordController,
        keyboardType: TextInputType.visiblePassword,
        style: theme.textTheme.subtitle1!.copyWith(fontFamily: FontAssets.semiBoldFont, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
            hintText: Strings.password,
            labelText: Strings.password,
            prefixIcon: Icon(
              Icons.lock_outline_sharp,
              size: size.getWidthPx(60),
            )),
        validator: (value) {
          return ValidationUtils().validatePassword(value!);
        },
        onChanged: (value) {},
        onFieldSubmitted: (value) {
          FocusScope.of(context).unfocus();
        },
      ),
    );
  }

  Widget _loginButtonWidget() {
    return CustomButton(
      onPressed: () {
        _validateInputs();
      },
      text: Strings.logIn.toUpperCase(),
      color: ColorConstants.appColor,
      textColor: Colors.white,
      borderColor: ColorConstants.appColor,
      borderRadius: size.getWidthPx(12),
      padding: EdgeInsets.symmetric(horizontal: size.wp(20), vertical: size.getHeightPx(32)),
    );
  }

  void _validateInputs() async {
    Utils.hideKeyboard(context);
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Provider.of<NavigationProvider>(context, listen: false).updateNavigationScreen(1);

      PreferenceManager.putString(AppConstants.userData, _emailController.text.trim());

      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => const OnBoardingPage()), (r) => false);
    } else {
      Provider.of<LoginProvider>(context, listen: false).setAutoValidate(true);
    }
  }

  Widget bottomTextWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(Strings.dontHaveAcc),
        SizedBox(width: size.getWidthPx(10)),
        GestureDetector(
          onTap: () {},
          child: Text(Strings.register,
              style: theme.textTheme.subtitle2!
                  .copyWith(fontFamily: FontAssets.semiBoldFont, color: ColorConstants.buttonColor)),
        ),
      ],
    );
  }
}
