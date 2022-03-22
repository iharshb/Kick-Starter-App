import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kickstarter/utils/z_imports_utils.dart';

class ViewStateBusyWidget extends StatelessWidget {
  const ViewStateBusyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Utils.isAndroidPlatform()!
          ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(ColorConstants.appColor),
            )
          : const CupertinoActivityIndicator(
              animating: true,
            ),
    );
  }
}
