import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:netlnk/Screen/Pages/home_page.dart';
import 'package:netlnk/Screen/Pages/search.dart';
import 'package:netlnk/Screen/Pages/FeedScreen.dart';
import 'package:netlnk/Screen/add_profile_screen.dart';
import '../Authentication/Controller/auth_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthController _authController = Get.find<AuthController>();
  int _selectedIndex = 0;
  late PageController _pageController;

  Future<void> _handleSignOut() async {
    try {
      await _authController.signout();
      Get.offAllNamed('/login');
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to sign out: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(38, 38, 52, 1.0),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(38, 38, 52, 1.0),
        scrolledUnderElevation: 0.0,
        elevation: 0.0,
        title: Text(
          'Netlnk',
          style: GoogleFonts.sacramento(
              fontWeight: FontWeight.bold, fontSize: 35, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.storm_outlined,
                color: Color.fromARGB(255, 32, 171, 231)),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const [
          HomeScreen(), //index 1
          SearchScreen(),
          FeedScreen(),
          // AddProfileScreen(),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: kBottomNavigationBarHeight + 20, // Adjust height as necessary
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 6.0,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color.fromRGBO(38, 38, 52, 1.0),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Iconsax.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.message),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SizedBox
                    .shrink(), // Empty space for the floating action button
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.notification),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.user),
                label: '',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle button press
        },
        child: const Icon(Iconsax.add),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}




// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:netlnk/Screen/Pages/home_page.dart';
// import 'package:netlnk/Screen/Pages/search.dart';
// import 'package:netlnk/Screen/Pages/FeedScreen.dart';
// import 'package:netlnk/Screen/add_profile_screen.dart';
// import '../Authentication/Controller/auth_controller.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final AuthController _authController = Get.find<AuthController>();
//   int _selectedIndex = 0;
//   late PageController _pageController;

//   Future<void> _handleSignOut() async {
//     try {
//       await _authController.signout();
//       Get.offAllNamed('/login');
//     } catch (e) {
//       Get.snackbar(
//         'Error',
//         'Failed to sign out: $e',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(initialPage: _selectedIndex);
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index);
//       _pageController.jumpToPage(index);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromRGBO(38, 38, 52, 1.0),
//       appBar: AppBar(
//         backgroundColor: const Color.fromRGBO(38, 38, 52, 1.0),
//         scrolledUnderElevation: 0.0,
//         elevation: 0.0,
//         title: Text(
//           'Netlnk',
//           style: GoogleFonts.sacramento(
//               fontWeight: FontWeight.bold, fontSize: 35, color: Colors.white),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.storm_outlined,
//                 color: Color.fromARGB(255, 32, 171, 231)),
//           ),
//         ],
//       ),
//       body: PageView(
//         controller: _pageController,
//         onPageChanged: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//         children: const [
//           HomeScreen(), //index 1
//           SearchScreen(),
//           FeedScreen(),
//           // AddProfileScreen(),
//         ],
//       ),
//       bottomNavigationBar: SizedBox(
//         height: kBottomNavigationBarHeight + 20, // Adjust height as necessary
//         child: BottomAppBar(
//           shape: const CircularNotchedRectangle(),
//           notchMargin: 6.0,
//           child: BottomNavigationBar(
//             type: BottomNavigationBarType.fixed,
//             backgroundColor: const Color.fromRGBO(38, 38, 52, 1.0),
//             items: const [
//               BottomNavigationBarItem(
//                 icon: Icon(Iconsax.home),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Iconsax.message),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: SizedBox.shrink(), // Empty space for the floating action button
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Iconsax.notification),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Iconsax.user),
//                 label: '',
//               ),
//             ],
//             currentIndex: _selectedIndex,
//             selectedItemColor: Colors.blue,
//             unselectedItemColor: Colors.grey,
//             onTap: _onItemTapped,
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Handle button press
//         },
//         child: const Icon(Iconsax.add),
//         backgroundColor: Colors.blue,
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }
// }










// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:netlnk/Screen/Pages/home_page.dart';
// import 'package:netlnk/Screen/Pages/search.dart';
// import 'package:netlnk/Screen/Pages/FeedScreen.dart';
// import 'package:netlnk/Screen/add_profile_screen.dart';
// import '../Authentication/Controller/auth_controller.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final AuthController _authController = Get.find<AuthController>();
//   int _selectedIndex = 0;
//   late PageController _pageController;

//   Future<void> _handleSignOut() async {
//     try {
//       await _authController.signout();
//       Get.offAllNamed('/login');
//     } catch (e) {
//       Get.snackbar(
//         'Error',
//         'Failed to sign out: $e',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(initialPage: _selectedIndex);
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//       _pageController.jumpToPage(index);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromRGBO(38, 38, 52, 1.0),
//       appBar: AppBar(
//         backgroundColor: const Color.fromRGBO(38, 38, 52, 1.0),
//         scrolledUnderElevation: 0.0,
//         elevation: 0.0,
//         title: Text(
//           'Netlnk',
//           style: GoogleFonts.sacramento(
//               fontWeight: FontWeight.bold, fontSize: 35, color: Colors.white),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.storm_outlined,
//                 color: Color.fromARGB(255, 32, 171, 231)),
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: PageView(
//           controller: _pageController,
//           onPageChanged: (index) {
//             setState(() {
//               _selectedIndex = index;
//             });
//           },
//           children: const [
//             HomeScreen(), //index 1
//             SearchScreen(),
//             FeedScreen(),
//             // AddProfileScreen(),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         shape: const CircularNotchedRectangle(),
//         notchMargin: 6.0,
//         child: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           backgroundColor: const Color.fromRGBO(38, 38, 52, 1.0),
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Iconsax.home),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Iconsax.message),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: SizedBox
//                   .shrink(), // Empty space for the floating action button
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Iconsax.notification),
//               label: '',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Iconsax.user),
//               label: '',
//             ),
//           ],
//           currentIndex: _selectedIndex,
//           selectedItemColor: Colors.blue,
//           unselectedItemColor: Colors.grey,
//           onTap: _onItemTapped,
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Handle button press
//         },
//         child: const Icon(Iconsax.add),
//         backgroundColor: Colors.blue,
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }
// }











// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:iconsax/iconsax.dart';
// // import 'package:netlnk/Screen/Pages/home_page.dart';
// // import 'package:netlnk/Screen/Pages/search.dart';
// // import 'package:netlnk/Screen/Pages/FeedScreen.dart';
// // import 'package:netlnk/Screen/add_profile_screen.dart';
// // import '../Authentication/Controller/auth_controller.dart';

// // class HomePage extends StatefulWidget {
// //   const HomePage({super.key});

// //   @override
// //   State<HomePage> createState() => _HomePageState();
// // }

// // class _HomePageState extends State<HomePage> {
// //   final AuthController _authController = Get.find<AuthController>();
// //   int _selectedIndex = 0;
// //   late PageController _pageController;

// //   Future<void> _handleSignOut() async {
// //     try {
// //       await _authController.signout();
// //       Get.offAllNamed('/login');
// //     } catch (e) {
// //       Get.snackbar(
// //         'Error',
// //         'Failed to sign out: $e',
// //         snackPosition: SnackPosition.BOTTOM,
// //       );
// //     }
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     _pageController = PageController(initialPage: _selectedIndex);
// //   }

// //   @override
// //   void dispose() {
// //     _pageController.dispose();
// //     super.dispose();
// //   }

// //   void _onItemTapped(int index) {
// //     setState(() {
// //       _selectedIndex = index;
// //       _pageController.jumpToPage(index);
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color.fromRGBO(38, 38, 52, 1.0),
// //       appBar: AppBar(
// //         backgroundColor: const Color.fromRGBO(38, 38, 52, 1.0),
// //         scrolledUnderElevation: 0.0,
// //         elevation: 0.0,
// //         title: Text(
// //           'Netlnk',
// //           style: GoogleFonts.sacramento(
// //               fontWeight: FontWeight.bold, fontSize: 35, color: Colors.white),
// //         ),
// //         actions: [
// //           IconButton(
// //             onPressed: () {},
// //             icon: const Icon(Icons.storm_outlined,
// //                 color: Color.fromARGB(255, 32, 171, 231)),
// //           ),
// //         ],
// //       ),
// //       body: PageView(
// //         controller: _pageController,
// //         onPageChanged: (index) {
// //           setState(() {
// //             _selectedIndex = index;
// //           });
// //         },
// //         children: const [
// //           HomeScreen(), //index 1
// //           SearchScreen(),
// //           FeedScreen(),
// //           // AddProfileScreen(),
// //         ],
// //       ),
// //       bottomNavigationBar: BottomAppBar(
// //         shape: const CircularNotchedRectangle(),
// //         notchMargin: 6.0,
// //         child: BottomNavigationBar(
// //           type: BottomNavigationBarType.fixed,
// //           backgroundColor: const Color.fromRGBO(38, 38, 52, 1.0),
// //           items: const [
// //             BottomNavigationBarItem(
// //               icon: Icon(Iconsax.home),
// //               label: '',
// //             ),
// //             BottomNavigationBarItem(
// //               icon: Icon(Iconsax.message),
// //               label: '',
// //             ),
// //             BottomNavigationBarItem(
// //               icon: SizedBox
// //                   .shrink(), // Empty space for the floating action button
// //               label: '',
// //             ),
// //             BottomNavigationBarItem(
// //               icon: Icon(Iconsax.notification),
// //               label: '',
// //             ),
// //             BottomNavigationBarItem(
// //               icon: Icon(Iconsax.user),
// //               label: '',
// //             ),
// //           ],
// //           currentIndex: _selectedIndex,
// //           selectedItemColor: Colors.blue,
// //           unselectedItemColor: Colors.grey,
// //           onTap: _onItemTapped,
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           // Handle button press
// //         },
// //         child: const Icon(Iconsax.add),
// //         backgroundColor: Colors.blue,
// //       ),
// //       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
// //     );
// //   }
// // }




// // // import 'package:flutter/cupertino.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:get/get.dart';
// // // import 'package:google_fonts/google_fonts.dart';
// // // import 'package:iconsax/iconsax.dart';
// // // import 'package:netlnk/Screen/Pages/home_page.dart';
// // // import 'package:netlnk/Screen/Pages/search.dart';
// // // import 'package:netlnk/Screen/Pages/FeedScreen.dart';
// // // import 'package:netlnk/Screen/add_profile_screen.dart';
// // // import '../Authentication/Controller/auth_controller.dart';
// // // import 'package:google_nav_bar/google_nav_bar.dart';

// // // class HomePage extends StatefulWidget {
// // //   const HomePage({super.key});

// // //   @override
// // //   State<HomePage> createState() => _HomePageState();
// // // }

// // // int _selectedIndex = 0;
// // // late PageController _pageController;

// // // class _HomePageState extends State<HomePage> {
// // //   final AuthController _authController = Get.find<AuthController>();

// // //   Future<void> _handleSignOut() async {
// // //     try {
// // //       await _authController.signout();
// // //       Get.offAllNamed('/login');
// // //     } catch (e) {
// // //       Get.snackbar(
// // //         'Error',
// // //         'Failed to sign out: $e',
// // //         snackPosition: SnackPosition.BOTTOM,
// // //       );
// // //     }
// // //   }

// // //   @override
// // //   void initState() {
// // //     // TODO: implement initState
// // //     super.initState();
// // //     _pageController = PageController(initialPage: _selectedIndex);
// // //   }

// // //   @override
// // //   void dispose() {
// // //     // TODO: implement dispose
// // //     _pageController.dispose();
// // //     super.dispose();
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: Color.fromRGBO(38, 38, 52, 1.0),
// // //       appBar: AppBar(
// // //         backgroundColor: Color.fromRGBO(38, 38, 52, 1.0),
// // //         scrolledUnderElevation: 0.00,
// // //         elevation: 0.00,
// // //         title: Text(
// // //           'Netlnk',
// // //           style: GoogleFonts.sacramento(
// // //               fontWeight: FontWeight.bold, fontSize: 35, color: Colors.white),
// // //         ),
// // //         // the
// // //         actions: [
// // //           IconButton(
// // //             onPressed: () {},
// // //             icon: Icon(Icons.storm_outlined,
// // //                 color: const Color.fromARGB(255, 32, 171, 231)),
// // //           ),
// // //         ],
// // //         // centerTitle: true,
// // //         // actions: [
// // //         //   IconButton(
// // //         //     onPressed: _handleSignOut,
// // //         //     icon: Icon(CupertinoIcons.power),
// // //         //   ),
// // //         // ],
// // //       ),
// // //       body: PageView(
// // //         controller: _pageController,
// // //         onPageChanged: (index) {
// // //           setState(() {
// // //             _selectedIndex = index;
// // //           });
// // //         },
// // //         children: [
// // //           HomeScreen(), //index 1
// // //           SearchScreen(),
// // //           FeedScreen(),
// // //           AddProfileScreen()
// // //         ],
// // //       ),
// // //       bottomNavigationBar: Padding(
// // //         padding: const EdgeInsets.all(8.0),
// // //         child: Container(
// // //           decoration: BoxDecoration(
// // //             color: const Color.fromRGBO(38, 38, 52, 1.0),
// // //             // borderRadius: BorderRadius.circular(30),
// // //             boxShadow: [
// // //               // BoxShadow(
// // //               //   blurRadius: 18,
// // //               //   // color: const Color.fromARGB(255, 111, 141, 148),
// // //               // )
// // //             ],
// // //           ),
// // //           child: SafeArea(
// // //             child: Padding(
// // //               padding:
// // //                   const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
// // //               child: GNav(
// // //                 color: const Color.fromARGB(255, 246, 245, 248),
// // //                 // backgroundColor: Color.fromRGBO(38, 38, 52, 1.0),
// // //                 rippleColor: const Color.fromARGB(255, 74, 128, 195),
// // //                 hoverColor: const Color.fromARGB(255, 78, 174, 206),
// // //                 gap: 3,
// // //                 activeColor: const Color.fromARGB(255, 32, 14, 197),
// // //                 iconSize: 24,
// // //                 padding:
// // //                     const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
// // //                 duration: const Duration(milliseconds: 400),
// // //                 // tabBackgroundColor: const Color.fromARGB(255, 18, 150, 164),

// // //                 tabs: const [
// // //                   GButton(
// // //                     icon: Iconsax.home,
// // //                     // text: 'Home',
// // //                   ),
// // //                   GButton(
// // //                     icon: Iconsax.,
// // //                     // text: 'Search',
// // //                   ),
// // //                   GButton(
// // //                     icon: Iconsax.add_circle,
// // //                     // text: 'add',
// // //                   ),
// // //                   GButton(
// // //                     icon: Icons.explore_outlined,
// // //                     // text: 'Feed',
// // //                   ),
// // //                   GButton(
// // //                     icon: Iconsax.user,
// // //                     // text: 'Profile',
// // //                   ),
// // //                 ],
// // //                 selectedIndex: _selectedIndex,
// // //                 onTabChange: (index) {
// // //                   setState(() {
// // //                     _selectedIndex = index;
// // //                     _pageController.animateToPage(
// // //                       index,
// // //                       duration: const Duration(milliseconds: 400),
// // //                       curve: Curves.ease,
// // //                     );
// // //                   });
// // //                 },
// // //               ),
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
