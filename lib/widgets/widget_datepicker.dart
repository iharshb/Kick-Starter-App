import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:kickstarter/utils/z_imports_utils.dart';

class DatePickerWidget extends StatefulWidget {
  final TextEditingController controller;
  final String validateString;
  final String hintText;
  final ValueChanged<String> onChanged;

  const DatePickerWidget(
      {Key? key,
      required this.controller,
      required this.validateString,
      required this.hintText,
      required this.onChanged})
      : super(key: key);

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  late Screen size;

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return TextFormField(
      obscureText: false,
      enableInteractiveSelection: false,
      focusNode: FocusNode(),
      onTap: openDatePicker,
      controller: widget.controller,
      onChanged: (value) => widget.onChanged(value),
      decoration: InputDecoration(hintText: widget.hintText, labelText: widget.hintText, isDense: true, enabled: false),
    );
  }

  void openDatePicker() async {
    if (Platform.isAndroid) {
      final DateTime? picked = await showDatePicker(
          context: context, initialDate: DateTime.now(), firstDate: DateTime(1901, 1), lastDate: DateTime.now());
      if (picked != null) {
        setState(() {
          widget.controller.text = picked.day.toString() + "-" + picked.month.toString() + "-" + picked.year.toString();
        });
      }
    } else {
      DatePicker.showDatePicker(context, showTitleActions: true, onChanged: (date) {}, onConfirm: (date) {
        widget.controller.text = date.day.toString() + "-" + date.month.toString() + "-" + date.year.toString();
      }, currentTime: DateTime.now(), locale: LocaleType.en);
    }
  }
}
