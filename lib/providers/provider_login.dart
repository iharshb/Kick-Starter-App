import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;
  bool autoValidate = false;
  bool passAutoValidate = false;

  callLogin(BuildContext context, body) async {
    try {
      setLoading(true);
      //  await WebServices().postCallLogin(context, body);
      setLoading(false);
    } catch (err) {
      setLoading(false);
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
