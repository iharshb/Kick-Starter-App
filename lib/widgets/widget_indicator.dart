import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:kickstarter/utils/z_imports_utils.dart';

class ProgressWidget extends StatelessWidget {
  final Widget child;
  final bool isShow;
  final double opacity;
  final Color color;

  const ProgressWidget({
    Key? key,
    required this.child,
    required this.isShow,
    this.opacity = 0.6,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(child);
    if (isShow) {
      final modal = Stack(
        children: [
          Opacity(
            opacity: opacity,
            child: ModalBarrier(dismissible: false, color: color),
          ),
          Center(
            child: Utils.isAndroidPlatform()!
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(ColorConstants.appColor),
                  )
                : const CupertinoActivityIndicator(
                    animating: true,
                  ),
          ),
        ],
      );
      widgetList.add(modal);
    }
    return Stack(
      children: widgetList,
    );
  }
}
