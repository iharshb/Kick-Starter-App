import 'package:flutter/material.dart';

import 'dialog_android_helper.dart';
import 'dialog_ios_helper.dart';

class DialogHelper {
  void showMessage(BuildContext context, String title, String message, VoidCallback onOKPressed, {bool? dismiss}) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      IosDialogHelper().showMessage(context, title, message, onOKPressed, dismiss!);
    } else {
      AndroidDialogHelper().showMessage(context, title, message, onOKPressed, dismiss!);
    }
  }

  void showConfirm(BuildContext context, String title, String message, Function onOkayPressed) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      IosDialogHelper().showConfirm(context, title, message, onOkayPressed);
    } else {
      AndroidDialogHelper().showConfirm(context, title, message, onOkayPressed);
    }
  }
}
