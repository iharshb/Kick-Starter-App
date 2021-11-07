import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kickstarter/pages/authentication/page_login.dart';
import 'package:kickstarter/providers/provider_bottom_navigation.dart';
import 'package:kickstarter/utils/z_imports_utils.dart';
import 'package:kickstarter/widgets/z_imports_widgets.dart';
import 'package:provider/provider.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> with AfterLayoutMixin {
  late Screen size;
  late ThemeData theme;
  late NavigationProvider navigationProvider;

  @override
  void afterFirstLayout(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    theme = Theme.of(context);
    navigationProvider = Provider.of<NavigationProvider>(context);
    return Scaffold(
      drawer: Drawer(
          child: SafeArea(
        child: Column(children: <Widget>[
          profileTileWidget(),
          drawerItem(context, drawerNumber: 1, iconLeading: IconAssets.iconDashboard, title: Strings.dashboard),
          drawerItem(context, drawerNumber: 2, iconLeading: IconAssets.iconSignOut, title: Strings.signOut),
        ]),
      )),
      body: Consumer<NavigationProvider>(builder: (context, navigationProvider, _) => navigationProvider.getNavigation),
    );
  }

  Widget profileTileWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.getWidthPx(20), vertical: size.getHeightPx(20)),
      decoration: BoxDecoration(
          border: Border.all(color: ColorConstants.appColor),
          color: ColorConstants.appColor,
          borderRadius: BorderRadius.all(Radius.circular(size.getWidthPx(15)))),
      child: ListTile(
        dense: true,
        tileColor: ColorConstants.appColor,
        contentPadding: EdgeInsets.symmetric(vertical: size.getHeightPx(20), horizontal: size.getWidthPx(30)),
        title: Text(
          PreferenceManager.getString(AppConstants.userData),
          style: theme.textTheme.subtitle2!
              .copyWith(fontFamily: FontAssets.semiBoldFont, color: ColorConstants.whiteTextColor),
        ),
        leading: CircleAvatar(
          radius: size.wp(6),
          backgroundColor: ColorConstants.appColor,
          child: CircleAvatar(
            radius: size.wp(6),
            backgroundColor: ColorConstants.whiteTextColor,
            child: Icon(
              FontAwesomeIcons.user,
              size: size.wp(6),
            ),
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: size.getWidthPx(50),
          color: ColorConstants.whiteTextColor,
        ),
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  Widget drawerItem(BuildContext context, {String? iconLeading, String? title, int? drawerNumber}) {
    return Column(
      children: [
        ListTile(
          dense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: size.getWidthPx(80)),
          title: Row(children: <Widget>[
            Image.asset(
              iconLeading!,
              color: ColorConstants.buttonColor,
              width: size.getWidthPx(52),
              height: size.getWidthPx(52),
            ),
            SizedBox(
              width: size.getWidthPx(60),
            ),
            Text(
              title!,
              style: theme.textTheme.subtitle2!.copyWith(fontFamily: FontAssets.semiBoldFont),
            ),
          ]),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: size.getWidthPx(40),
            color: ColorConstants.buttonColor,
          ),
          onTap: () {
            Navigator.of(context).pop();
            if (drawerNumber == 2) {
              DialogHelper().showConfirm(
                  context, AppConstants.appName, "Are you sure? You want to logging out from app? ", () async {
                PreferenceManager.clear();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const LoginPage()), (Route<dynamic> route) => false);
              });
            } else {
              navigationProvider.updateNavigationScreen(drawerNumber!);
            }
          },
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: size.getWidthPx(40)),
          color: ColorConstants.secondaryTextColor,
          height: 1,
        )
      ],
    );
  }
}
