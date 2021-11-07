import 'package:flutter/material.dart';
import 'package:kickstarter/utils/z_imports_utils.dart';
import 'package:kickstarter/widgets/z_imports_widgets.dart';

class PageSomethingWentWrong extends StatelessWidget {
  const PageSomethingWentWrong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Screen size = Screen(MediaQuery.of(context).size);
    ThemeData theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              IconAssets.icWentWrong,
              width: size.wp(50),
              height: size.getHeightPx(200),
            ),
            SizedBox(height: size.getHeightPx(20)),
            TitleWidget(
              title: Strings.somethingWentWrong,
              fontFamily: FontAssets.semiBoldFont,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: size.getHeightPx(30)),
            Text(
              Strings.techIssue,
              textAlign: TextAlign.center,
              style: theme.textTheme.caption!.copyWith(fontSize: size.setSp(42)),
            )
          ],
        ),
      ),
    );
  }
}
