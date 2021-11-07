import 'package:flutter/material.dart';
import 'package:kickstarter/utils/z_imports_utils.dart';
import 'package:kickstarter/widgets/z_imports_widgets.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late Screen size;
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.appColor,
        title: const Text("Dashboard"),
        leading: MenuIconWidget(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            color: Colors.white),
      ),
      body: const Center(
        child: Text("Dashboard"),
      ),
    );
  }
}
