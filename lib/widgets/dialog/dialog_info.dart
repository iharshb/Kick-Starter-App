import 'package:flutter/material.dart';
import 'package:kickstarter/utils/z_imports_utils.dart';
import 'package:kickstarter/widgets/z_imports_widgets.dart';

class InfoDialog extends StatelessWidget {
  final String content, positiveBtnText, negativeBtnText;
  final GestureTapCallback positiveBtnPressed;
  final Color? positiveButtonColor;
  final Color? negativeButtonColor;
  final Color? lineColor;
  final IconData? topIcon;
  final Color? iconColor;
  final Color? iconBackgroundColor;
  final bool? isOnlyMessage;
  late Screen size;

  late ThemeData theme;

  InfoDialog({
    Key? key,
    required this.content,
    required this.positiveBtnText,
    required this.negativeBtnText,
    required this.positiveBtnPressed,
    this.positiveButtonColor,
    this.lineColor,
    this.negativeButtonColor,
    this.iconBackgroundColor,
    this.iconColor,
    this.isOnlyMessage = true,
    this.topIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    theme = Theme.of(context);
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildDialogContent(context),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          // Bottom rectangular box
          margin: EdgeInsets.only(top: size.getHeightPx(80)),
          // to push the box half way below circle
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(size.getWidthPx(12)),
          ),
          padding: EdgeInsets.all(size.getWidthPx(40)),
          // spacing inside the box
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: size.getHeightPx(100),
              ),
              Text(
                content,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontFamily: FontAssets.regularFont, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: size.getHeightPx(90),
              ),
              isOnlyMessage!
                  ? ButtonBar(
                      alignment: MainAxisAlignment.spaceEvenly,
                      buttonMinWidth: size.wp(26),
                      children: <Widget>[
                        CustomButton(
                          onPressed: () => Navigator.of(context).pop(),
                          text: negativeBtnText.toUpperCase(),
                          color: negativeButtonColor,
                          textColor: Colors.black54,
                          borderColor: Colors.black54,
                          borderRadius: size.getWidthPx(12),
                          padding: EdgeInsets.symmetric(horizontal: size.wp(8)),
                        ),
                        CustomButton(
                          onPressed: positiveBtnPressed,
                          text: positiveBtnText.toUpperCase(),
                          color: positiveButtonColor,
                          textColor: Colors.white,
                          borderColor: ColorConstants.appColor,
                          borderRadius: size.getWidthPx(12),
                          padding: EdgeInsets.symmetric(horizontal: size.wp(8)),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        CustomButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          text: negativeBtnText.toUpperCase(),
                          color: ColorConstants.appColor,
                          textColor: Colors.white,
                          borderColor: ColorConstants.appColor,
                          borderRadius: size.getWidthPx(12),
                          padding: EdgeInsets.symmetric(horizontal: size.wp(10)),
                        ),
                      ],
                    ),
            ],
          ),
        ),
        Container(
          color: lineColor ?? positiveButtonColor,
          height: size.getHeightPx(10),
          margin: EdgeInsets.only(top: size.getHeightPx(80)),
          padding: EdgeInsets.all(size.getWidthPx(40)),
        ),
        CircleAvatar(
          backgroundColor: iconBackgroundColor,
          radius: size.getWidthPx(82),
          child: CircleAvatar(
            backgroundColor: iconBackgroundColor,
            radius: size.getWidthPx(80),
            child: Icon(
              topIcon ?? Icons.info_outline_rounded,
              size: size.getWidthPx(160),
              color: iconColor,
            ),
          ),
        ),
      ],
    );
  }
}
