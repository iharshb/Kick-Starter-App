import 'package:flutter/material.dart';
import 'package:kickstarter/utils/z_imports_utils.dart';

class CustomButton extends StatefulWidget {
  final Function onPressed;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final double? borderSize;
  final double? borderRadius;
  final String text;
  final Widget? child;
  final EdgeInsetsGeometry? padding;

  const CustomButton(
      {Key? key,
      required this.onPressed,
      this.color,
      this.textColor,
      this.borderColor,
      this.borderSize,
      this.borderRadius,
      this.padding,
      this.child,
      required this.text})
      : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  late Screen size;

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return ElevatedButton(
      onPressed: () => widget.onPressed(),
      child: widget.child ??
          Text(
            widget.text,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: widget.textColor, fontFamily: FontAssets.semiBoldFont),
          ),
      style: ElevatedButton.styleFrom(
        primary: widget.color ?? ColorConstants.appColor,
        padding: widget.padding,
        side: BorderSide(width: widget.borderSize ?? 2, color: widget.borderColor ?? ColorConstants.appColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 2),
        ),
      ),
    );
  }
}
