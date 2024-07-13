import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// Picks an image from the given [ImageSource] and returns the image bytes.
///
/// Example:
/// ```dart
/// final imageBytes = await pickImage(ImageSource.camera);
/// ```
Future<Uint8List?> pickImage(ImageSource source) async {
  final ImagePicker _picker = ImagePicker();

  XFile? file = await _picker.pickImage(source: source);

  if (file != null) {
    return await file.readAsBytes();
  }
  print('No image selected');
}

/// Shows a snack bar with the given [content] in the given [BuildContext].
///
/// Example:
/// ```dart
/// showSnackBar('Image uploaded successfully!', context);
/// ```
void showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
  ));
}



// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// pickImage(ImageSource source) async {
//   final ImagePicker _picker = ImagePicker();

//   XFile? file = await _picker.pickImage(source: source);

//   if (_file != null) {
//     return await _file.readAsBytes();
//   }
//   print('No image selected');
// }

// showSnackBar(String content, BuildContext context) {
//   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//     content: Text(content),
//   ));
// }
