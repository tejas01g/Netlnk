import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  Widget build(BuildContext context) {
    // // return Center(
    //     child: IconButton(
    //   icon: const Icon(Icons.upload),
    //   onPressed: () {},
    // ));
    return Scaffold(
      backgroundColor: const Color.fromRGBO(38, 38, 52, 1.0),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(38, 38, 52, 1.0),
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
      ),
      body: Center(
        child: IconButton(
          icon: const Icon(Icons.upload),
          color: Colors.white,
          iconSize: 50.0,
          onPressed: () {},
        ),
      ),
    );
  }
}
