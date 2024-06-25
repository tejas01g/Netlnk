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
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int _selectedIndex = 0;
late PageController _pageController;

class _HomePageState extends State<HomePage> {
  final AuthController _authController = Get.find<AuthController>();

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
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 1, 1),

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 1, 1),
        scrolledUnderElevation: 0.00,
        elevation: 0.00,
        title: Text(
          'Netlnk',
          style: GoogleFonts.sacramento(
              fontWeight: FontWeight.bold,
              fontSize: 35,
              color: const Color.fromARGB(255, 234, 10, 10)),
        ),
        // the
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.storm_outlined,
                color: Colors.red,
              )),
        ],
        // centerTitle: true,
        // actions: [
        //   IconButton(
        //     onPressed: _handleSignOut,
        //     icon: Icon(CupertinoIcons.power),
        //   ),
        // ],
      ),

      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          HomeScreen(), //index 1
          SearchScreens(),
          FeedScreen(),
          AddProfileScreen()
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 11, 11, 11),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                blurRadius: 18,
                color: const Color.fromARGB(255, 93, 1, 1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                color: const Color.fromARGB(255, 147, 6, 6),
                backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                rippleColor: const Color.fromARGB(255, 251, 24, 24)!,
                hoverColor: const Color.fromARGB(0, 124, 2, 2),
                gap: 4,
                activeColor: const Color.fromARGB(255, 235, 4, 4),
                iconSize: 24,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: const Color.fromARGB(74, 141, 8, 8),
                tabs: const [
                  GButton(
                    icon: Iconsax.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Iconsax.search_favorite,
                    text: 'Search',
                  ),
                  GButton(
                    icon: Icons.explore_outlined,
                    text: 'Feed',
                  ),
                  GButton(
                    icon: Iconsax.user,
                    text: 'Profile',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.ease,
                    );
                  });
                },
              ),
            ),
          ),
        ),
      ),
      //   bottomNavigationBar: ,
    );
  }
}
