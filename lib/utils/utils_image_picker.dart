import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kickstarter/utils/constants/z_import_constants.dart';
import 'package:kickstarter/utils/z_imports_utils.dart';

Widget bottomSheetForSelectionFile(BuildContext context, Screen size, ValueChanged<PickedFile> onFileSelection) {
  return SafeArea(
    child: Container(
      padding: EdgeInsets.only(left: size.getWidthPx(8)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(size.getWidthPx(16)), topRight: Radius.circular(size.getWidthPx(16)))),
      child: Wrap(
        children: <Widget>[
          ListTile(
              leading: const Icon(Icons.camera),
              title: Text(Strings.takePhoto),
              onTap: () async {
                Navigator.pop(context);

                PickedFile? _documentFile = await ImagePicker().getImage(source: ImageSource.camera, imageQuality: 30);
                onFileSelection(_documentFile!);
              }),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: Text(Strings.pickFromGallery),
            onTap: () async {
              Navigator.pop(context);
              PickedFile? _documentFile = await ImagePicker().getImage(source: ImageSource.gallery, imageQuality: 40);

              onFileSelection(_documentFile!);
            },
          ),
        ],
      ),
    ),
  );
}
