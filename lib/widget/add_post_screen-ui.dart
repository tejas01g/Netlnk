// import 'dart:ffi';
import 'dart:typed_data';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_platform_interface/src/types/image_source.dart';
import 'package:netlnk/utils/util.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;

  _selectImage(BuildContext context) async {
    return SimpleDialog(
      title: const Text('create a post'),
      children: [
        SimpleDialogOption(
          padding: const EdgeInsets.all(20),
          child: const Text('Take a photo'),
          onPressed: () async {
            Navigator.of(context).pop();
            Uint8List? file = await pickImage(
              ImageSource.camera,
            );
            setState(() {
              _file = file;
            });
          },
        ),
        SimpleDialogOption(
          padding: const EdgeInsets.all(20),
          child: const Text('choose from gallery'),
          onPressed: () async {
            Navigator.of(context).pop();
            Uint8List? file = await pickImage(
              ImageSource.gallery,
            );
            setState(() {
              _file = file;
            });
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _file == null
        ? Center(
            child: IconButton(
              icon: const Icon(Icons.upload),
              color: Colors.white,
              iconSize: 33.0,
              onPressed: () => _selectImage(context),
            ),
          )
        : Scaffold(
            // backgroundColor: const Color.fromRGBO(38, 38, 52, 1.0),
            appBar: AppBar(
              // backgroundColor: const Color.fromRGBO(38, 38, 52, 1.0),
              leading: IconButton(
                color: Colors.white,
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Get.back();
                },
              ),
              title: const Text(
                'Post to',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Post',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1652986766649-1f3382b0e98b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YmFja2dyb3VuZCUyMGltYWdlfGVufDB8fDB8fHww'),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'write a caption..',
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                        ),
                        maxLength: 8,
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      width: 45,
                      child: AspectRatio(
                        aspectRatio: 487 / 451,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://images.unsplash.com/photo-1620403724159-40363e84a155?q=80&w=387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                              ),
                              fit: BoxFit.fill,
                              alignment: FractionalOffset.topCenter,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ],
            ),
            // Uncomment if needed:
          );
  }
}




// import 'dart:ffi';
// import 'dart:typed_data';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker_platform_interface/src/types/image_source.dart';
// import 'package:netlnk/utils/util.dart';

// class AddPostScreen extends StatefulWidget {
//   const AddPostScreen({super.key});

//   @override
//   State<AddPostScreen> createState() => _AddPostScreenState();
// }

// class _AddPostScreenState extends State<AddPostScreen> {
//   Uint8List? _file;

//   _selectImage(BuildContext context) async {
//     return SimpleDialog(
//       title: const Text('create a post'),
//       children: [
//         SimpleDialogOption(
//           padding: const EdgeInsets.all(20),
//           child: const Text('Take a photo'), 
//           onPressed: () async {
//             Navigator.of(context).pop();
//             Uint8List? file = await pickImage(
//               ImageSource.camera,
//             );
//             setState(() {
//               _file = file;
//             });
//           },
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }

// @override
// Widget build(BuildContext context) {
//   // // return Center(
//   //     child: IconButton(
//   //   icon: const Icon(Icons.upload),
//   //   onPressed: () {},
//   // ));
//   return Scaffold(
//     backgroundColor: const Color.fromRGBO(38, 38, 52, 1.0),
//     appBar: AppBar(
//       // centerTitle: true,
//       backgroundColor: const Color.fromRGBO(38, 38, 52, 1.0),
//       leading: IconButton(
//         color: Colors.white,
//         icon: const Icon(Icons.arrow_back),
//         onPressed: () {
//           Get.back();
//         },
//       ),
//       title: const Text(
//         'Post to',
//         style: TextStyle(
//           color: Colors.white,
//         ),
//       ),
//       actions: [
//         TextButton(
//             onPressed: () {},
//             child: const Text(
//               'Post',
//               style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
//             ))
//       ],
//     ),
//     body: Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CircleAvatar(
//               backgroundImage: NetworkImage(
//                   'https://images.unsplash.com/photo-1652986766649-1f3382b0e98b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YmFja2dyb3VuZCUyMGltYWdlfGVufDB8fDB8fHww'),
//             ),
//             SizedBox(
//               width: MediaQuery.of(context).size.width * 0.4,
//               child: TextField(
//                 decoration: const InputDecoration(
//                   hintText: 'write a caption..',
//                   hintStyle: TextStyle(color: Colors.white),
//                   border: InputBorder.none,
//                 ),
//                 maxLength: 8,
//               ),
//             ),
//             SizedBox(
//               height: 45,
//               width: 45,
//               child: AspectRatio(
//                 aspectRatio: 487 / 451,
//                 child: Container(
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                           image: NetworkImage(
//                               'https://images.unsplash.com/photo-1620403724159-40363e84a155?q=80&w=387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
//                           fit: BoxFit.fill,
//                           alignment: FractionalOffset.topCenter)),
//                 ),
//               ),
//             ),
//             const Divider(),
//           ],
//         )
//       ],
//     ),
//     // body: Center(
//     //   child: IconButton(
//     //     icon: const Icon(Icons.upload),
//     //     color: Colors.white,
//     //     iconSize: 50.0,
//     //     onPressed: () {},
//     //   ),
//     // ),
//   );
// }
// // }
