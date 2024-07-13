import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netlnk/Authentication/signup.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Wallpaper Background
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1579457870499-e781952098c6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTMxfHxwYXJ0eXxlbnwwfHwwfHx8MA%3D%3D'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Blurry Overlay
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App Logo with subtle animation
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: Duration(seconds: 1),
                  builder: (context, double value, child) {
                    return Opacity(
                      opacity: value,
                      child: Transform.scale(
                        scale: value,
                        child: child,
                      ),
                    );
                  },
                  child: Container(
                    height: 150.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                          spreadRadius: 1.0,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: CircleAvatar(
                        //This is a app logo
                        radius: 80,
                        backgroundImage: NetworkImage(
                            'https://plus.unsplash.com/premium_photo-1671580671733-92d038f1ea97?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzN8fHBhcnR5fGVufDB8fDB8fHww'),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                // Welcome Text with refined style
                Text(
                  'Welcome to Netlnk',
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    letterSpacing: 1.2,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black45,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                // Tagline Text with refined style
                Text(
                  'Connect with your friends & do party🥳 and the world around you.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white70,
                    letterSpacing: 1.1,
                  ),
                ),
                SizedBox(height: 50.0),
                // Get Started Button with modern style
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the next screen
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => SignupScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CupertinoColors.black,
                    padding:
                        EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    elevation: 5.0,
                    shadowColor: Colors.black45,
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
