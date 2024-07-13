import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(38, 38, 52, 1.0),

      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(38, 38, 52, 1.0),
        title: Text(
          'Chats',
          style: TextStyle(color: Colors.white),
        ),
      ),
      // body: Center(
      //   child: Text('Message'),
      // ),
    );
  }
}
