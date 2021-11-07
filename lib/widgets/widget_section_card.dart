import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kickstarter/utils/constants/z_import_constants.dart';
import 'package:kickstarter/utils/z_imports_utils.dart';

class SectionWidget extends StatefulWidget {
  final double? childrenPadding;
  final bool? disableDivider;
  final Color backgroundColor;
  final double? borderRadius;
  final Widget? headerWidget;
  final List<Widget> children;
  final Color? borderColor;

  const SectionWidget(
      {Key? key,
      this.headerWidget,
      this.childrenPadding,
      required this.children,
      this.borderRadius,
      this.disableDivider,
      required this.backgroundColor,
      this.borderColor})
      : super(key: key);

  @override
  _SectionWidgetState createState() => _SectionWidgetState();
}

class _SectionWidgetState extends State<SectionWidget> {
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius!),
        side: BorderSide(color: widget.borderColor!, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
              child: widget.headerWidget,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(widget.borderRadius!), topRight: Radius.circular(widget.borderRadius!)),
                color: ColorConstants.appColor,
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: widget.children,
          )
        ],
      ),
    );
  }
}
