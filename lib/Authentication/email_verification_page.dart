import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Screen/home.dart';
import '../main.dart';

class EmailVerificationPage extends StatefulWidget {
  final String email;

  const EmailVerificationPage({Key? key, required this.email})
      : super(key: key);

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  late User currentUser;

  // ignore: prefer_typing_uninitialized_variables

  @override
  void initState() {
    super.initState();
    currentUser = FirebaseAuth.instance.currentUser!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Colors.black,
        automaticallyImplyLeading: false,
        title: Text(
          'Verify Your Email',
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.width * 0.035,
            color: Theme.of(context).brightness == Brightness.dark
                ? CupertinoColors.white
                : CupertinoColors.black,
          ),
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future:
              FirebaseAuth.instance.currentUser!.reload(), // add reload() here
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              if (FirebaseAuth.instance.currentUser!.emailVerified) {
                return HomePage();
              } else {
                var email = widget.email;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'We have sent an email to your account ${email} \nPlease click the verification link in the email to verify your account.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.035,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? CupertinoColors.white
                            : CupertinoColors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CupertinoButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.currentUser!
                            .reload(); // add reload() here
                        if (FirebaseAuth.instance.currentUser!.emailVerified) {
                          // Restart the app
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            runApp(
                              Netlnk(), // Replace MyApp() with your main widget's name
                            );
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Email not verified yet",
                                style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.035,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? CupertinoColors.white
                                      : CupertinoColors.black,
                                ),
                              ),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          );
                        }
                      },
                      color: Theme.of(context).brightness == Brightness.dark
                          ? CupertinoColors.black
                          : CupertinoColors.white,
                      borderRadius: BorderRadius.circular(30),
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 30,
                      ),
                      child: Text(
                        'Verify',
                        style: TextStyle(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                        ),
                      ),
                    ),
                  ],
                );
              }
            }
          },
        ),
      ),
    );
  }
}
