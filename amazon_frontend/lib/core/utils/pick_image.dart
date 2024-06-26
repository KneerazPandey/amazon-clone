import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

Future<List<File>> pickImages() async {
  List<File> images = [];
  try {
    FilePickerResult? files = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (files != null && files.files.isNotEmpty) {
      for (int i = 0; i < files.files.length; i++) {
        images.add(File(files.files[i].path!));
      }
    }
  } catch (error) {
    debugPrint(error.toString());
  }
  return images;
}
