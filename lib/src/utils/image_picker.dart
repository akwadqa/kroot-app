import 'dart:io';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImage() async {
  File? file;

  final pickedImage = await ImagePicker().pickImage(
    source: ImageSource.gallery,
    maxWidth: 500,
    imageQuality: 70,
  );

  if (pickedImage == null) {
    return null;
  } else {
    file = File(pickedImage.path);
    return file;
  }
}
