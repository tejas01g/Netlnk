import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Authentication/Controller/auth_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthController _authController = Get.find<AuthController>();

  Future<void> _handleSignOut() async {
    try {
      await _authController.signout();
      // After signing out, navigate to the login or signup screen
      Get.offAllNamed('/login'); // Replace with your login/signup screen route
    } catch (e) {
      // Handle signout error
      Get.snackbar(
        'Error',
        'Failed to sign out: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Netlnk'),
        actions: [
          IconButton(
            onPressed: _handleSignOut,
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Center(
        child: Text('Hello ji kese hoo saaree!!!'),
      ),
    );
  }
}
