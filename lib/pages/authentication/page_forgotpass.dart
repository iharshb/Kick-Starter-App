import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kickstarter/providers/provider_login.dart';
import 'package:kickstarter/utils/z_imports_utils.dart';
import 'package:kickstarter/widgets/z_imports_widgets.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPage createState() => _ForgotPasswordPage();
}

class _ForgotPasswordPage extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
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
      body: ProgressWidget(
        isShow: loginProvider.isLoading,
        child: Container(
          padding: EdgeInsets.all(size.getWidthPx(60)),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidate: loginProvider.passAutoValidate,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: size.hp(20)),
                  topHeaderWidgets(),
                  SizedBox(height: size.getHeightPx(40)),
                  SizedBox(height: size.getHeightPx(40)),
                  _emailWidget(),
                  SizedBox(height: size.getHeightPx(40)),
                  SizedBox(height: size.getHeightPx(80)),
                  _forgotPasswordButtonWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget topHeaderWidgets() {
    return Column(children: [
      CircleAvatar(
        maxRadius: size.getWidthPx(120),
        child: Icon(
          FontAwesomeIcons.userLock,
          size: size.getWidthPx(100),
        ),
      ),
      SizedBox(
        height: size.getHeightPx(30),
      ),
      headerText(),
      SizedBox(
        height: size.hp(6),
      ),
      subHeaderTextWidget(),
    ]);
  }

  Text subHeaderTextWidget() {
    return Text(Strings.enterEmail,
        textAlign: TextAlign.center,
        style: theme.textTheme.subtitle1!
            .copyWith(color: ColorConstants.secondaryTextColor, fontFamily: FontAssets.appFont));
  }

  Text headerText() {
    return Text(Strings.forgotPassword,
        textAlign: TextAlign.center,
        style: theme.textTheme.headline6!
            .copyWith(color: ColorConstants.primaryTextColor, fontFamily: FontAssets.semiBoldFont));
  }

  TextFormField _emailWidget() {
    return TextFormField(
      textAlign: TextAlign.left,
      focusNode: _emailFocusNode,
      controller: _emailController,
      keyboardType: TextInputType.phone,
      style: theme.textTheme.subtitle1!.copyWith(fontFamily: FontAssets.semiBoldFont, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        hintText: Strings.email,
        labelText: Strings.email,
      ),
      validator: (value) {
        return ValidationUtils().validateEmail(value!);
      },
      onChanged: (value) {},
      onFieldSubmitted: (value) {
        FocusScope.of(context).unfocus();
      },
    );
  }

  Widget _forgotPasswordButtonWidget() {
    return CustomButton(
      onPressed: () {
        _validateInputs();
      },
      text: Strings.submit.toUpperCase(),
      color: ColorConstants.buttonColor,
      textColor: Colors.white,
      borderColor: ColorConstants.buttonColor,
      borderRadius: size.getWidthPx(12),
      padding: EdgeInsets.symmetric(horizontal: size.wp(20), vertical: size.getHeightPx(32)),
    );
  }

  void _validateInputs() async {
    Utils.hideKeyboard(context);
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // loginProvider.callForgetPassword(context, _emailController.text);
    } else {
      loginProvider.setAutoValidate(true);
      // loginProvider.callForgetPassword(context, _emailController.text);
    }
  }
}
