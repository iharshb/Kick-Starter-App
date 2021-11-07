import 'package:flutter/material.dart';
import 'package:kickstarter/utils/z_imports_utils.dart';

class MenuIconWidget extends StatefulWidget {
  Function onTap;
  Color color;

  MenuIconWidget({Key? key, required this.onTap, required this.color}) : super(key: key);

  @override
  State<MenuIconWidget> createState() => _MenuIconWidgetState();
}

class _MenuIconWidgetState extends State<MenuIconWidget> {
  late Screen size;

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return leadingIconWidget(context);
  }

  Padding leadingIconWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(size.getWidthPx(4)),
      child: IconButton(
        onPressed: () {
          return widget.onTap();
        },
        icon: Icon(
          Icons.menu,
          color: widget.color,
        ),
      ),
    );
  }
}
