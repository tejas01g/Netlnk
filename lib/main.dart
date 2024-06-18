import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netlnk/Authentication/login.dart';
import 'package:netlnk/Authentication/signup.dart';
import 'package:netlnk/Screen/home.dart';
import 'package:netlnk/Screen/welcomescreen.dart';

import 'Authentication/Controller/auth_controller.dart';
import 'firebase_options.dart'; // Import your AuthController

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize AuthController and bind it to GetX dependency management
  Get.put(AuthController());

  runApp(const Netlnk());
}

class Netlnk extends StatelessWidget {
  const Netlnk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => SignupScreen()), // Example route
        GetPage(name: '/home', page: () => HomePage()), // Define '/home' route
        GetPage(name: '/login', page: () => LoginScreen()), // Define '/home' route
        // Add more routes as needed
      ],
      title: 'Netlnk',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return HomePage();
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CupertinoActivityIndicator(
                animating: true,
                radius: 20,
              ),
            );
          }
          return WelcomeScreen();
        },
      ),
    );
  }
}
