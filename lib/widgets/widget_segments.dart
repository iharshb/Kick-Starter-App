import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kickstarter/utils/z_imports_utils.dart';

class SegmentsWidget extends StatefulWidget {
  @override
  _SegmentsWidgetState createState() => _SegmentsWidgetState();

  final List selectionsList;
  final ValueChanged<int> onSelectTab;
  final VoidCallback onTap;
  final int selectedValue;

  const SegmentsWidget(
      {Key? key,
      required this.selectionsList,
      required this.onSelectTab,
      required this.onTap,
      required this.selectedValue})
      : super(key: key);
}

class _SegmentsWidgetState extends State<SegmentsWidget> {
  Map<int, Widget> tabWidget = <int, Widget>{};
  int selectedTab = 0;

  late Screen size;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    setState(() {
      widget.selectionsList.asMap().forEach((index, value) {
        tabWidget.addAll({
          index: Container(
              height: size.getWidthPx(40),
              child: Center(
                child: Text(
                  widget.selectionsList[index],
                ),
              ))
        });
      });
    });
  }

  @override
  void didUpdateWidget(SegmentsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    theme = Theme.of(context);

    return Row(
      children: <Widget>[
        Expanded(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: CupertinoSegmentedControl<int>(
              padding: EdgeInsets.symmetric(vertical: size.getWidthPx(8)),
              children: tabWidget,
              onValueChanged: (int index) {
                setState(() {
                  selectedTab = index;
                });
                widget.onSelectTab(index);
              },
              groupValue: widget.selectedValue,
            ),
          ),
        )
      ],
    );
  }
}
