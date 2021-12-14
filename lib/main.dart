//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kickstarter/providers/provider_bottom_navigation.dart';
import 'package:kickstarter/providers/provider_login.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:kickstarter/pages/page_splash.dart';
import 'package:kickstarter/theme/theme_provider.dart';
import 'package:kickstarter/theme/z_imports_theme.dart';
import 'package:kickstarter/utils/z_imports_utils.dart';
import 'utils/managers/manager_notification.dart';

/*// Receive message when app is in background solution for on message
Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  //FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(const RootApp());
  });
}

class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Kick Starter App ', home: KickStarterApp());
  }
}

class KickStarterApp extends StatefulWidget {
  const KickStarterApp({Key? key}) : super(key: key);

  @override
  _KickStarterAppState createState() => _KickStarterAppState();
}

class _KickStarterAppState extends State<KickStarterApp> {
  @override
  void initState() {
    //LocalNotificationService.initialize(context);
    notificationNavigation();
    super.initState();
  }

  notificationNavigation() {
    ///gives you the message on which user taps
    ///and it opened the app from terminated state
    /* FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final routeFromMessage = message.data["route"];

        Navigator.of(context).pushNamed(routeFromMessage);
      }
    });*/

    ///forground work
    /* FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print(message.notification!.body);
        print(message.notification!.title);
      }

      //LocalNotificationService.display(message);
    });*/

    ///When the app is in background but opened and user taps
    ///on the notification
    /*FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data["route"];

      Navigator.of(context).pushNamed(routeFromMessage);
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: LayoutBuilder(builder: (context, constraints) {
        ScreenUtil.instance = ScreenUtil()..init(context);

        return Consumer<ThemeProvider>(builder: (context, data, _) {
          return MaterialApp(
              title: 'Kick Starter App',
              debugShowCheckedModeBanner: false,
              theme: getAppTheme(data),
              home: const SplashScreen());
        });
      }),
    );
  }

  ThemeData getAppTheme(ThemeProvider data) {
    return ThemeData(
      fontFamily: FontAssets.appFont,
      primaryColor: data.isDarkMode ? Colors.cyanAccent : ColorConstants.appColor,
      scaffoldBackgroundColor: data.isDarkMode ? Colors.black12 : Colors.white,
      canvasColor: data.isDarkMode ? Colors.black26 : Colors.white,
      brightness: data.isDarkMode ? Brightness.dark : Brightness.light,
      primaryColorDark: data.isDarkMode ? Colors.cyanAccent : ColorConstants.appColor,
      dialogBackgroundColor: ColorConstants.appColor,
      buttonTheme: data.isDarkMode ? buttonThemeDark() : buttonThemeLight(),
      textTheme: data.isDarkMode ? textThemeDark() : textThemeLight(),
      inputDecorationTheme: inputDecorationThemeLight(),
      appBarTheme: AppBarTheme(
        color: data.isDarkMode ? ColorConstants.appColor : ColorConstants.whiteTextColor,
      ),
      tabBarTheme: TabBarTheme(
          indicator: UnderlineTabIndicator(
        borderSide: const BorderSide(width: 2.0, color: Colors.white),
        insets: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
      )),
    );
  }
}
