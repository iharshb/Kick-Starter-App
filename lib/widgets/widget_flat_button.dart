import 'package:flutter/material.dart';
import 'package:kickstarter/utils/z_imports_utils.dart';

class FlatButtonWidget extends StatefulWidget {
  final VoidCallback onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final Color? borderColor;
  final String text;
  final double? borderRadius;
  final TextStyle? textTheme;
  final double? minWidth;
  final double? height;
  final Widget? icon;

  const FlatButtonWidget(
      {Key? key,
      required this.onPressed,
      this.buttonColor,
      this.icon,
      this.textColor,
      this.borderColor,
      required this.text,
      this.borderRadius,
      this.textTheme,
      this.minWidth,
      this.height})
      : super(key: key);

  @override
  _FlatButtonWidgetState createState() => _FlatButtonWidgetState();
}

class _FlatButtonWidgetState extends State<FlatButtonWidget> {
  late Screen size;
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    theme = Theme.of(context);

    return Center(
      child: ButtonTheme(
        minWidth: widget.minWidth!,
        height: widget.height!,
        child: RaisedButton(
          padding: EdgeInsets.zero,
          textColor: widget.textColor,
          onPressed: widget.onPressed,
          color: widget.buttonColor,
          child: widget.icon ??
              Text(
                widget.text,
                style: widget.textTheme,
              ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius!), side: BorderSide(color: widget.borderColor!)),
        ),
      ),
    );
  }
}
