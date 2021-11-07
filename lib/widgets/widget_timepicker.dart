import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:kickstarter/utils/z_imports_utils.dart';

class TimePickerWidget extends StatefulWidget {
  final TextEditingController controller;
  final String validateString;
  final String hintText;
  final ValueChanged<String> onChanged;

  const TimePickerWidget(
      {Key? key,
      required this.controller,
      required this.validateString,
      required this.hintText,
      required this.onChanged})
      : super(key: key);

  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  late Screen size;

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return TextFormField(
      obscureText: false,
      enableInteractiveSelection: false,
      focusNode: FocusNode(),
      onTap: openTimePicker,
      controller: widget.controller,
      validator: widget.validateString.isEmpty
          ? null
          : (String? arg) {
              if (arg!.isEmpty) {
                return widget.validateString;
              } else {
                return null;
              }
            },
      onChanged: (value) => widget.onChanged(value),
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.hintText,
        isDense: true,
        enabled: false,
      ),
    );
  }

  void openTimePicker() async {
    if (Platform.isAndroid) {
      final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!,
          );
        },
      );
      if (picked != null) {
        setState(() {
          widget.controller.text =
              picked.hour.toString().padLeft(2, '0') + ":" + picked.minute.toString().padLeft(2, '0');
        });
      }
    } else {
      DatePicker.showTimePicker(context, showTitleActions: true, onChanged: (date) {}, onConfirm: (date) {
        widget.controller.text = date.hour.toString().padLeft(2, '0') + ":" + date.minute.toString().padLeft(2, '0');
      }, currentTime: DateTime.now(), locale: LocaleType.en);
    }
  }
}
