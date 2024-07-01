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
        children: [
          HomeScreen(),
          SearchScreen(),
          FeedScreen(),
          AddProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromRGBO(38, 38, 52, 1.0),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.search_normal),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.notification),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.user),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
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
