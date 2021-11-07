import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kickstarter/widgets/dialog/z_imports_dialog.dart';

class IosDialogHelper {
  void showMessage(BuildContext context, String title, String message, VoidCallback onOKPressed, bool dismiss) {
    showDialog<String>(
        context: context,
        barrierDismissible: dismiss,
        builder: (context) => CupertinoAlertDialog(
              title: Text(title, style: const TextStyle(color: Colors.black)),
              content: Text(message, style: const TextStyle(color: Colors.black)),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.pop(context, 'Discard');

                    return onOKPressed();
                  },
                )
              ],
            ));
  }

  void showConfirm(BuildContext context, String title, String message, Function onOkayPressed) {
    showDialog<String>(
        context: context,
        barrierDismissible: true,
        builder: (context) => CupertinoAlertDialog(
              title: Text(title),
              content: Text(message),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: const Text('Cancel', style: TextStyle(color: Colors.black)),
                  onPressed: () {
                    Navigator.pop(context, 'Discard');
                  },
                ),
                CupertinoDialogAction(
                  child: const Text('OK', style: TextStyle(color: Colors.black)),
                  onPressed: () {
                    Navigator.of(context).pop();
                    onOkayPressed();
                  },
                ),
              ],
            ));
  }
}
