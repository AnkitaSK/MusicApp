import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
}

Future<File?> pickAudio() async {
  try {
    final filePickersRes =
        await FilePicker.platform.pickFiles(type: FileType.audio);
    if (filePickersRes != null) {
      return File(filePickersRes.files.first.xFile.path);
    }
    return null;
  } catch (e) {
    return null;
  }
}

Future<File?> pickImage() async {
  try {
    final filePickersRes =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (filePickersRes != null) {
      return File(filePickersRes.files.first.xFile.path);
    }
    return null;
  } catch (e) {
    return null;
  }
}
