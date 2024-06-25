import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../Authentication/Controller/auth_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart'; // For generating unique filenames

class AddProfileScreen extends StatefulWidget {
  @override
  _AddProfileScreenState createState() => _AddProfileScreenState();
}

class _AddProfileScreenState extends State<AddProfileScreen> {
  final AuthController _authController = Get.find<AuthController>();
  final TextEditingController _usernameController = TextEditingController();
  File? _profileImage;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _profileImage = File(image.path);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
      Get.snackbar(
        'Error',
        'Failed to pick an image. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> _uploadProfile() async {
    if (_profileImage == null) {
      Get.snackbar(
        'Error',
        'Please select a profile photo.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    String username = _usernameController.text.trim();
    if (username.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter a username.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    bool isUsernameTaken = await _isUsernameTaken(username);
    if (isUsernameTaken) {
      Get.snackbar(
        'Error',
        'Username is already taken. Please choose a different one.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    String profileImageUrl = await _uploadProfileImage(_profileImage!);
    if (profileImageUrl.isEmpty) {
      Get.snackbar(
        'Error',
        'Failed to upload profile photo. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      await _authController.signup(
        username,
        _authController.user!.email ?? 'Unknown',
        '', // Placeholder for password (not needed in this step)
      );

      String uid = _authController.user!.uid;
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'username': username,
        'profileImageUrl': profileImageUrl,
      });

      Get.offAllNamed('/home');
    } catch (e) {
      print('Error uploading profile details: $e');
      Get.snackbar(
        'Error',
        'Failed to upload profile details. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<bool> _isUsernameTaken(String username) async {
    QuerySnapshot<Map<String, dynamic>> query = await FirebaseFirestore.instance
        .collection('users')
        .where('username', isEqualTo: username)
        .limit(1)
        .get();

    return query.docs.isNotEmpty;
  }

  Future<String> _uploadProfileImage(File imageFile) async {
    try {
      String uid = _authController.user!.uid;
      String fileName = Uuid().v4(); // Generate a unique filename
      Reference storageRef =
          FirebaseStorage.instance.ref().child('profile_images/$uid/$fileName');

      UploadTask uploadTask = storageRef.putFile(imageFile);

      TaskSnapshot taskSnapshot = await uploadTask;
      String imageUrl = await taskSnapshot.ref.getDownloadURL();

      return imageUrl;
    } catch (e) {
      print('Error uploading profile image: $e');
      return '';
    }
  }

  Future<void> _signOut() async {
    await _authController.signout();
    Get.offAllNamed('/login'); // Redirect to login screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 9, 9, 9),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 9, 9, 9),
        title: Text('Add Profile'),
        actions: [
          IconButton(
            onPressed: _uploadProfile,
            icon: Icon(Icons.check),
            color: Colors.red,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: Center(
                        child: _profileImage == null
                            ? Container(
                                width: 110,
                                height: 110,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.red,
                                    width: 4.0,
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 50,
                                  child: Icon(Icons.camera_alt),
                                  backgroundColor:
                                      const Color.fromARGB(255, 66, 64, 64),
                                ),
                              )
                            : Container(
                                width: 110,
                                height: 110,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.red,
                                    width: 4.0,
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: FileImage(_profileImage!),
                                ),
                              ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                TextButton(
                  onPressed: _signOut,
                  child: Text(
                    'Log Out',
                    style:
                        TextStyle(color: const Color.fromARGB(255, 209, 3, 3)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}




// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import '../Authentication/Controller/auth_controller.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:uuid/uuid.dart'; // For generating unique filenames

// class AddProfileScreen extends StatefulWidget {
//   @override
//   _AddProfileScreenState createState() => _AddProfileScreenState();
// }

// class _AddProfileScreenState extends State<AddProfileScreen> {
//   final AuthController _authController = Get.find<AuthController>();
//   final TextEditingController _usernameController = TextEditingController();
//   File? _profileImage;

//   Future<void> _pickImage() async {
//     final ImagePicker _picker = ImagePicker();
//     try {
//       final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//       if (image != null) {
//         setState(() {
//           _profileImage = File(image.path);
//         });
//       }
//     } catch (e) {
//       print('Error picking image: $e');
//       // Optionally, show a snackbar or alert to notify the user of the error.
//       Get.snackbar(
//         'Error',
//         'Failed to pick an image. Please try again.',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     }
//   }

//   Future<void> _uploadProfile() async {
//     if (_profileImage == null) {
//       Get.snackbar(
//         'Error',
//         'Please select a profile photo.',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//       return;
//     }

//     String username = _usernameController.text.trim();
//     if (username.isEmpty) {
//       Get.snackbar(
//         'Error',
//         'Please enter a username.',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//       return;
//     }

//     // Check if the username is already taken
//     bool isUsernameTaken = await _isUsernameTaken(username);
//     if (isUsernameTaken) {
//       Get.snackbar(
//         'Error',
//         'Username is already taken. Please choose a different one.',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//       return;
//     }

//     // Upload profile image to Firebase Storage
//     String profileImageUrl = await _uploadProfileImage(_profileImage!);

//     // Ensure profile image upload was successful
//     if (profileImageUrl.isEmpty) {
//       Get.snackbar(
//         'Error',
//         'Failed to upload profile photo. Please try again.',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//       return;
//     }

//     try {
//       // Call signup method to register user with profile details
//       await _authController.signup(
//         username,
//         _authController.user!.email ?? 'Unknown',
//         '', // Placeholder for password (not needed in this step)
//       );

//       // Get the current user's UID
//       String uid = _authController.user!.uid;

//       // Update Firestore document for the current user
//       await FirebaseFirestore.instance.collection('users').doc(uid).set({
//         'username': username,
//         'profileImageUrl': profileImageUrl,
//         // Add other fields as needed
//       });

//       // Navigate to home screen or next screen after signup
//       Get.offAllNamed('/home');
//     } catch (e) {
//       print('Error uploading profile details: $e');
//       Get.snackbar(
//         'Error',
//         'Failed to upload profile details. Please try again.',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     }
//   }

//   Future<bool> _isUsernameTaken(String username) async {
//     // Implement logic to check if username is already taken in Firestore
//     // Replace with your Firebase Firestore collection reference
//     QuerySnapshot<Map<String, dynamic>> query = await FirebaseFirestore.instance
//         .collection('users')
//         .where('username', isEqualTo: username)
//         .limit(1)
//         .get();

//     return query.docs.isNotEmpty;
//   }

//   Future<String> _uploadProfileImage(File imageFile) async {
//     try {
//       String uid = _authController.user!.uid;
//       String fileName = Uuid().v4(); // Generate a unique filename
//       Reference storageRef =
//           FirebaseStorage.instance.ref().child('profile_images/$uid/$fileName');

//       // Upload file to Firebase Storage
//       UploadTask uploadTask = storageRef.putFile(imageFile);

//       // Get download URL
//       TaskSnapshot taskSnapshot = await uploadTask;
//       String imageUrl = await taskSnapshot.ref.getDownloadURL();

//       return imageUrl;
//     } catch (e) {
//       print('Error uploading profile image: $e');
//       return ''; // Return empty string or handle error as needed
//     }
//   }

//   Future<void> _signOut() async {
//     await _authController.signout();
//     Get.offAllNamed('/login'); // Redirect to login screen
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Add Profile'),
//           actions: [
//             IconButton(
//               onPressed: _uploadProfile,
//               icon: Icon(Icons.check),
//             ),
//             // centerTitle: true,
//             // actions: [
//             // IconButton(
//             //   onPressed: _handleSignOut,
//             //   icon: Icon(CupertinoIcons.power),
//             // ),
//           ],
//           // ],
//         ),
//         body: SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.all(20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 GestureDetector(
//                   onTap: _pickImage,
//                   child: Center(
//                     child: _profileImage == null
//                         ? CircleAvatar(
//                             radius: 50,
//                             child: Icon(Icons.camera_alt),
//                           )
//                         : CircleAvatar(
//                             radius: 50,
//                             backgroundImage: FileImage(_profileImage!),
//                           ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 TextField(
//                   controller: _usernameController,
//                   decoration: InputDecoration(
//                     labelText: 'Username',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextButton(
//                 onPressed: _signOut,
//                 child: Text(
//                   'Sign Out',
//                   style: TextStyle(color: Colors.red),
//                 ))));
//   }
// }
