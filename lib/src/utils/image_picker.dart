import 'dart:io';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImage() async {
  File? file;

  // Pick the image :
  final pickedImage = await ImagePicker().pickImage(
    source: ImageSource.gallery,
    maxWidth: 500,
    imageQuality: 70,
  );

  // Out if file null :
  if (pickedImage == null) {
    return null;
  } else {
    file = File(pickedImage.path);
    return file;
  }
}
