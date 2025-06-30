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
    final ImagePicker _imagePicker = ImagePicker();

    final XFile? image = await _imagePicker.pickImage(
      source: source ?? ImageSource.gallery,
    );

    if (image == null) {
      throw Exception("No image selected");
    }

    final File imageFile = File(image.path);

    return imageFile;
  }

  FilesPickers() {
    Future.wait(
      [
        _initData(),
      ],
    );
  }
}
