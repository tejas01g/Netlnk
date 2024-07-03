import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netlnk/widget/follow_button.dart';

class AddProfileScreen extends StatefulWidget {
  const AddProfileScreen({super.key});

  @override
  State<AddProfileScreen> createState() => _AddProfileScreenState();
}

class _AddProfileScreenState extends State<AddProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(38, 38, 52, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(38, 38, 52, 1.0),
        title: Text(
          'username',
          style: GoogleFonts.sacramento(
            fontSize: 35,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1630568321786-82abecde2366?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGhvdCUyMGdpcmxzfGVufDB8fDB8fHww'),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildStatColumn(20, "posts"),
                          buildStatColumn(150, "followers"),
                          buildStatColumn(10, "following"),
                        ],
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FollowButton(
                      text: 'Edit Profile',
                      backgroundColor: Colors.black,
                      borderColor: Colors.grey,
                      textColor: Colors.white,
                      function: () {},
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    'username',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 1),
                  child: Text(
                    'Description',
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column buildStatColumn(int num, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          num.toString(),
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4),
          child: Text(
            label,
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey),
          ),
        )
      ],
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:netlnk/widget/follow_button.dart';

// class AddProfileScreen extends StatefulWidget {
//   const AddProfileScreen({super.key});

//   @override
//   State<AddProfileScreen> createState() => _AddProfileScreenState();
// }

// class _AddProfileScreenState extends State<AddProfileScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(38, 38, 52, 1.0),
//       appBar: AppBar(
//         backgroundColor: Color.fromRGBO(38, 38, 52, 1.0),
//         title: Text(
//           'username',
//           style: GoogleFonts.sacramento(
//             fontSize: 35,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: ListView(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       radius: 50,
//                       backgroundColor: Colors.white,
//                       backgroundImage: NetworkImage(
//                           'https://images.unsplash.com/photo-1630568321786-82abecde2366?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGhvdCUyMGdpcmxzfGVufDB8fDB8fHww'),
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           buildStatColumn(20, "posts"),
//                           buildStatColumn(150, "followers"),
//                           buildStatColumn(10, "following"),
//                         ],
//                       ),
//                       )
//                   ],
//                 ),
//                 Row(
//                 SizedBox(height: 1),
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                 FollowButton(
//                   text: 'Edit Profile',
//                   backgroundColor: Colors.black,
//                   borderColor: Colors.grey,
//                   textColor: Colors.white,
//                   function: () {},
//                 ),
//                 ),
              
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Column buildStatColumn(int num, String label) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           num.toString(),
//           style: const TextStyle(
//               fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//         Container(
//           margin: const EdgeInsets.only(top: 4),
//           child: Text(
//             label,
//             style: const TextStyle(
//                 fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey),
//           ),
//         )
//       ],
//     );
//   }
// }






// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:netlnk/widget/follow_button.dart';

// class AddProfileScreen extends StatefulWidget {
//   const AddProfileScreen({super.key});

//   @override
//   State<AddProfileScreen> createState() => _AddProfileScreenState();
// }

// class _AddProfileScreenState extends State<AddProfileScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(38, 38, 52, 1.0),
//       appBar: AppBar(
//         backgroundColor: Color.fromRGBO(38, 38, 52, 1.0),
//         title: Text(
//           'username',
//           style: GoogleFonts.sacramento(
//             fontSize: 35,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: ListView(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(children: [
//               Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 50,
//                     backgroundColor: Colors.white,
//                     backgroundImage: NetworkImage(
//                         'https://images.unsplash.com/photo-1630568321786-82abecde2366?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGhvdCUyMGdpcmxzfGVufDB8fDB8fHww'),
//                   ),
//                   Expanded(
//                     flex: 1,
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         buildStatColumn(20, "posts"),
//                         buildStatColumn(150, "followers"),
//                         buildStatColumn(10, "following"),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         FollowButton(
//                           text: 'Edit Profile',
//                           backgroundColor: Colors.black,
//                           borderColor: Colors.grey,
//                           textColor: Colors.white,
//                           function: () {},
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               // SizedBox(height: 16),
//             ]),
//           ),
//         ],
//       ),
//     );
//   }

//   Column buildStatColumn(int num, String label) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           num.toString(),
//           style: const TextStyle(
//               fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//         Container(
//           margin: const EdgeInsets.only(top: 4),
//           child: Text(
//             label,
//             style: const TextStyle(
//                 fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey),
//           ),
//         )
//       ],
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:netlnk/widget/follow_button.dart';

// class AddProfileScreen extends StatefulWidget {
//   const AddProfileScreen({super.key});

//   @override
//   State<AddProfileScreen> createState() => _AddProfileScreenState();
// }

// class _AddProfileScreenState extends State<AddProfileScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(38, 38, 52, 1.0),
//       appBar: AppBar(
//         backgroundColor: Color.fromRGBO(38, 38, 52, 1.0),
//         title: Text(
//           'username',
//           style: GoogleFonts.sacramento(
//             fontSize: 35,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: ListView(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       radius: 50,
//                       backgroundColor: Colors.white,
//                       backgroundImage: NetworkImage(
//                           'https://images.unsplash.com/photo-1630568321786-82abecde2366?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGhvdCUyMGdpcmxzfGVufDB8fDB8fHww'),
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           buildStatColumn(20, "posts"),
//                           buildStatColumn(150, "followers"),
//                           buildStatColumn(10, "following"),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 16),
//                 FollowButton(text: 'Edit Profile',),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Column buildStatColumn(int num, String label) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           num.toString(),
//           style: const TextStyle(
//               fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//         Container(
//           margin: const EdgeInsets.only(top: 4),
//           child: Text(
//             label,
//             style: const TextStyle(
//                 fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey),
//           ),
//         )
//       ],
//     );
//   }
// }






// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:netlnk/widget/follow_button.dart';

// class AddProfileScreen extends StatefulWidget {
//   const AddProfileScreen({super.key});

//   @override
//   State<AddProfileScreen> createState() => _AddProfileScreenState();
// }

// class _AddProfileScreenState extends State<AddProfileScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(38, 38, 52, 1.0),
//       appBar: AppBar(
//         backgroundColor: Color.fromRGBO(38, 38, 52, 1.0),
//         // backgroundColor: Colors.white,
//         title: Text(
//           'username',
//           style: GoogleFonts.sacramento(
//             // fontWeight: FontWeight.,
//             fontSize: 35,
//             color: Colors.white, // Changed color to black for visibility
//           ),
//         ),
//       ),
//       body: ListView(
//         children: [
//           Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       CircleAvatar(
//                         radius: 50,
//                         backgroundColor: Colors.white,
//                         backgroundImage: NetworkImage(
//                             'https://images.unsplash.com/photo-1630568321786-82abecde2366?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGhvdCUyMGdpcmxzfGVufDB8fDB8fHww'),
//                       ),
//                       Expanded(
//                         flex: 1,
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             buildStatColumn(20, "posts"),
//                             buildStatColumn(150, "followers"),
//                             buildStatColumn(10, "following"),
//                           ],
//                         ),
//                       ),
                  
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           FollowButton(text: 'Edit Profile'),
//                     ],
                    
//                   ),
//                 ],
//               ),
//         ],
//       ),
//     );
//   }

//   Column buildStatColumn(int num, String label) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           num.toString(),
//           style: const TextStyle(
//               fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//         Container(
//           margin: const EdgeInsets.only(top: 4),
//           child: Text(
//             label,
//             style: const TextStyle(
//                 fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey),
//           ),
//         )
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class AddProfileScreen extends StatefulWidget {
//   const AddProfileScreen({super.key});

//   @override
//   State<AddProfileScreen> createState() => _AddProfileScreenState();
// }

// class _AddProfileScreenState extends State<AddProfileScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(38, 38, 52, 1.0),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: const Text('username', style: GoogleFonts.sacramento(
//               fontWeight: FontWeight.bold, fontSize: 35, color: Colors.white)
//               ),
//       ),
//     );
//   }
// }

// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';
// import '../Authentication/Controller/auth_controller.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:uuid/uuid.dart'; // For generating unique filenames

// class AddProfileScreen extends StatefulWidget {
//   @override
//   _AddProfileScreenState createState() => _AddProfileScreenState();
// }

// class _AddProfileScreenState extends State<AddProfileScreen> {
//   // final AuthController _authController = Get.find<AuthController>();
//   // final TextEditingController _usernameController = TextEditingController();
//   // File? _profileImage;

//   // Future<void> _pickImage() async {
//   //   final ImagePicker _picker = ImagePicker();
//   //   try {
//   //     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//   //     if (image != null) {
//   //       setState(() {
//   //         _profileImage = File(image.path);
//   //       });
//   //     }
//   //   } catch (e) {
//   //     print('Error picking image: $e');
//   //     Get.snackbar(
//   //       'Error',
//   //       'Failed to pick an image. Please try again.',
//   //       snackPosition: SnackPosition.BOTTOM,
//   //     );
//   //   }
//   // }

//   // Future<void> _uploadProfile() async {
//   //   if (_profileImage == null) {
//   //     Get.snackbar(
//   //       'Error',
//   //       'Please select a profile photo.',
//   //       snackPosition: SnackPosition.BOTTOM,
//   //     );
//   //     return;
//   //   }

//   //   String username = _usernameController.text.trim();
//   //   if (username.isEmpty) {
//   //     Get.snackbar(
//   //       'Error',
//   //       'Please enter a username.',
//   //       snackPosition: SnackPosition.BOTTOM,
//   //     );
//   //     return;
//   //   }

//   //   bool isUsernameTaken = await _isUsernameTaken(username);
//   //   if (isUsernameTaken) {
//   //     Get.snackbar(
//   //       'Error',
//   //       'Username is already taken. Please choose a different one.',
//   //       snackPosition: SnackPosition.BOTTOM,
//   //       backgroundColor: Colors.red,
//   //       colorText: Colors.white,
//   //     );
//   //     return;
//   //   }

//   //   String profileImageUrl = await _uploadProfileImage(_profileImage!);
//   //   if (profileImageUrl.isEmpty) {
//   //     Get.snackbar(
//   //       'Error',
//   //       'Failed to upload profile photo. Please try again.',
//   //       snackPosition: SnackPosition.BOTTOM,
//   //     );
//   //     return;
//   //   }

//   //   try {
//   //     await _authController.signup(
//   //       username,
//   //       _authController.user!.email ?? 'Unknown',
//   //       '', // Placeholder for password (not needed in this step)
//   //     );

//   //     String uid = _authController.user!.uid;
//   //     await FirebaseFirestore.instance.collection('users').doc(uid).set({
//   //       'username': username,
//   //       'profileImageUrl': profileImageUrl,
//   //     });

//   //     Get.offAllNamed('/emailVerification');
//   //   } catch (e) {
//   //     print('Error uploading profile details: $e');
//   //     Get.snackbar(
//   //       'Error',
//   //       'Failed to upload profile details. Please try again.',
//   //       snackPosition: SnackPosition.BOTTOM,
//   //     );
//   //   }
//   // }

//   // Future<bool> _isUsernameTaken(String username) async {
//   //   QuerySnapshot<Map<String, dynamic>> query = await FirebaseFirestore.instance
//   //       .collection('users')
//   //       .where('username', isEqualTo: username)
//   //       .limit(1)
//   //       .get();

//   //   return query.docs.isNotEmpty;
//   // }

//   // Future<String> _uploadProfileImage(File imageFile) async {
//   //   try {
//   //     String uid = _authController.user!.uid;
//   //     String fileName = Uuid().v4(); // Generate a unique filename
//   //     Reference storageRef =
//   //         FirebaseStorage.instance.ref().child('profile_images/$uid/$fileName');

//   //     UploadTask uploadTask = storageRef.putFile(imageFile);

//   //     TaskSnapshot taskSnapshot = await uploadTask;
//   //     String imageUrl = await taskSnapshot.ref.getDownloadURL();

//   //     return imageUrl;
//   //   } catch (e) {
//   //     print('Error uploading profile image: $e');
//   //     return '';
//   //   }
//   // }

//   // Future<void> _signOut() async {
//   //   await _authController.signout();
//   //   Get.offAllNamed('/login'); // Redirect to login screen
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text('username'),
//       ),
//     );
//     //   backgroundColor: const Color.fromRGBO(38, 38, 52, 1.0),
//     //   appBar: AppBar(
//     //     backgroundColor: const Color.fromRGBO(38, 38, 52, 1.0),
//     //     title: Text(
//     //       'Add Profile',
//     //       style: GoogleFonts.sacramento(
//     //           fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
//     //     ),
//     //     actions: [
//     //       IconButton(
//     //         onPressed: _uploadProfile,
//     //         icon: Icon(Icons.check),
//     //         color: Colors.white,
//     //       ),
//     //     ],
//     //   ),
//     //   body: Column(
//     //     children: [
//     //       Expanded(
//     //         child: SingleChildScrollView(
//     //           child: Container(
//     //             padding: EdgeInsets.all(20),
//     //             child: Column(
//     //               crossAxisAlignment: CrossAxisAlignment.start,
//     //               children: [
//     //                 GestureDetector(
//     //                   onTap: _pickImage,
//     //                   child: Center(
//     //                     child: _profileImage == null
//     //                         ? Container(
//     //                             width: 110,
//     //                             height: 110,
//     //                             decoration: BoxDecoration(
//     //                               shape: BoxShape.circle,
//     //                               border: Border.all(
//     //                                 color: Colors.red,
//     //                                 width: 4.0,
//     //                               ),
//     //                             ),
//     //                             child: CircleAvatar(
//     //                               radius: 50,
//     //                               child: Icon(Icons.camera_alt),
//     //                               backgroundColor:
//     //                                   const Color.fromARGB(255, 66, 64, 64),
//     //                             ),
//     //                           )
//     //                         : Container(
//     //                             width: 110,
//     //                             height: 110,
//     //                             decoration: BoxDecoration(
//     //                               shape: BoxShape.circle,
//     //                               border: Border.all(
//     //                                 color: Colors.red,
//     //                                 width: 4.0,
//     //                               ),
//     //                             ),
//     //                             child: CircleAvatar(
//     //                               radius: 50,
//     //                               backgroundImage: FileImage(_profileImage!),
//     //                             ),
//     //                           ),
//     //                   ),
//     //                 ),
//     //                 SizedBox(height: 20),
//     //                 TextField(
//     //                   controller: _usernameController,
//     //                   decoration: InputDecoration(
//     //                     labelText: 'Username',
//     //                     border: OutlineInputBorder(
//     //                       borderRadius: BorderRadius.circular(30),
//     //                     ),
//     //                   ),
//     //                 ),
//     //               ],
//     //             ),
//     //           ),
//     //         ),
//     //       ),
//     //       Container(
//     //         padding: const EdgeInsets.all(8.0),
//     //         child: Row(
//     //           children: [
//     //             TextButton(
//     //               onPressed: _signOut,
//     //               child: Text(
//     //                 'Log Out',
//     //                 style:
//     //                     TextStyle(color: const Color.fromARGB(255, 209, 3, 3)),
//     //               ),
//     //             ),
//     //           ],
//     //         ),
//     //       )
//     //     ],
//     //   ),
//     // );
//     // }
//   }
// }
