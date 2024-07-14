import 'package:flutter/material.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(38, 38, 52, 1.0),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(38, 38, 52, 1.0),
          title: Text(
            "Edit Profile",
            style: TextStyle(
              color: const Color.fromARGB(255, 219, 210, 210),
            ),
          ),
        ));
  }
}
