import 'package:flutter/material.dart';
import 'package:kickstarter/utils/z_imports_utils.dart';

import 'dialog_info.dart';

class AndroidDialogHelper {
  void showMessage(BuildContext context, String title, String message, VoidCallback onOKPressed, bool dismiss,
      {String positiveBtnText = "OK", String negativeBtnText = "Discard"}) {
    showGeneralDialog(
      barrierDismissible: false,
      context: context,
      barrierColor: Colors.black54,
      // space around dialog
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (mContext, a1, a2, child) {
        return ScaleTransition(
          scale: CurvedAnimation(parent: a1, curve: Curves.elasticOut, reverseCurve: Curves.easeOutCubic),
          child: InfoDialog(
            // our custom dialog
            content: message,
            positiveBtnText: positiveBtnText,
            negativeBtnText: negativeBtnText,
            isOnlyMessage: false,
            positiveButtonColor: ColorConstants.buttonColor,
            lineColor: ColorConstants.buttonColor,
            negativeButtonColor: ColorConstants.buttonColor,
            iconBackgroundColor: ColorConstants.buttonColor,
            iconColor: ColorConstants.whiteTextColor,
            topIcon: Icons.info_outline_rounded,
            positiveBtnPressed: () async {
              Navigator.pop(context, 'Discard');
              return onOKPressed();
            },
          ),
        );
      },
      pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
        return Container();
      },
    );
  }

  void showConfirm(BuildContext context, String title, String message, Function onOkayPressed,
      {String positiveBtnText = "Submit", String negativeBtnText = "Discard"}) {
    showGeneralDialog(
      barrierDismissible: false,
      context: context,
      barrierColor: Colors.black54,
      // space around dialog
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (mContext, a1, a2, child) {
        return ScaleTransition(
          scale: CurvedAnimation(parent: a1, curve: Curves.elasticOut, reverseCurve: Curves.easeOutCubic),
          child: InfoDialog(
            // our custom dialog
            content: message,
            positiveBtnText: positiveBtnText,
            negativeBtnText: negativeBtnText,
            positiveButtonColor: ColorConstants.appColor,
            negativeButtonColor: ColorConstants.hintDarkColor,
            iconBackgroundColor: ColorConstants.whiteTextColor,
            iconColor: ColorConstants.appColor,
            topIcon: Icons.help,
            positiveBtnPressed: () async {
              // Do something here
              Navigator.of(mContext).pop();
              return onOkayPressed();
            },
          ),
        );
      },
      pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
        return Container();
      },
    );
  }
}
