import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

abstract class FilesPickers {
  final ImagePicker _imagePicker = ImagePicker();
  late final FilePickerResult? _picker;

  Future<void> _initData() async {
    _picker = await FilePicker.platform.pickFiles();
  }

  static Future<File> pickImage({ImageSource? source}) async {
    final ImagePicker imagePicker = ImagePicker();

    final XFile? image = await imagePicker.pickImage(
      source: source ?? ImageSource.gallery,
    );

    if (image == null) {
      throw Exception("No image selected");
    }

    final File imageFile = File(image.path);

    return imageFile;
  }

  static Future<File> pickFile() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result == null) {
      throw Exception("No file selected");
    }

    final File file = File(result.files.single.path!);

    return file;
  }

  FilesPickers() {
    Future.wait(
      [
        _initData(),
      ],
    );
  }
}
