import 'package:flutter/material.dart';
import 'Screen/welcomescreen.dart';

void main() {
  runApp(const Netlnk());
}

class Netlnk extends StatelessWidget {
  const Netlnk({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netlnk',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: WelcomeScreen(),
    );
  }
}
