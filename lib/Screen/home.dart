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
      backgroundColor: CupertinoColors.white,
      appBar: AppBar(
        backgroundColor: CupertinoColors.white,
        scrolledUnderElevation: 0.00,
        elevation: 0.00,
        title: Text(
          'Netlnk',
          style: GoogleFonts.sacramento(
              fontWeight: FontWeight.bold,
              fontSize: 35,
              color: CupertinoColors.systemIndigo),
        ),
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
            color: CupertinoColors.systemIndigo,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.indigo,
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                color: CupertinoColors.white,
                backgroundColor: CupertinoColors.systemIndigo,
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.transparent,
                gap: 4,
                activeColor: CupertinoColors.white,
                iconSize: 24,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: CupertinoColors.tertiaryLabel,
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
