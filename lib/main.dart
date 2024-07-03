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
import 'Authentication/Controller/user_controiler.dart';
import 'Authentication/email_verification_page.dart';
import 'firebase_options.dart'; // Import your AuthController

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Initialize AuthController and bind it to GetX dependency management
  Get.put(AuthController());
  // Initialize AuthController and UserController
  Get.put(UserController());
  runApp(const Netlnk());
}

class Netlnk extends StatelessWidget {
  const Netlnk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>();
    var user = userController.userData.value;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => SignupScreen()), // Example route
        GetPage(name: '/home', page: () => HomePage()), // Define '/home' route
        GetPage(
            name: '/login', page: () => LoginScreen()), // Define '/home' route
        // Add more routes as needed
        GetPage(
            name: '/emailVerification',
            page: () => EmailVerificationPage(email: user?['email'] ?? '')),
      ],
      title: 'Netlnk',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                User? user = snapshot.data;
                if (user != null) {
                  if (user.emailVerified) {
                    return HomePage();
                  } else {
                    return EmailVerificationPage(
                      email: user.email!,
                    );
                  }
                }
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(
                body: Center(child: CupertinoActivityIndicator()),
              );
            }
            return WelcomeScreen();
          }),
    );
  }
}
