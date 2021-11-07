import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String? title;
  final String? fontFamily;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  const TitleWidget(
      {Key? key,
      this.title,
      this.color,
      this.fontFamily,
      this.fontSize,
      this.textAlign,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title!,
        textAlign: textAlign ?? TextAlign.left,
        style: Theme.of(context).textTheme.headline6!.copyWith(
            color: color,
            fontWeight: fontWeight,
            fontSize: fontSize,
            fontFamily: fontFamily));
  }
}
