import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kickstarter/core/z_core.dart';

class LoginProvider extends ViewStateModel {
  bool isLoading = false;
  bool autoValidate = false;
  bool passAutoValidate = false;

  LoginProvider({ViewState? viewState}) : super(viewState);

  callLogin(BuildContext context, body) async {
    try {
      setBusy();
      //  await WebServices().postCallLogin(context, body);
      setIdle();
    } catch (e, s) {
      setError(e, s);
    }
  }

  void setLoading(loading) {
    isLoading = loading;
    notifyListeners();
  }

  void setAutoValidate(validate) {
    autoValidate = validate;
    notifyListeners();
  }

  void setPassAutoValidate(validate) {
    passAutoValidate = validate;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
