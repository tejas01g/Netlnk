import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../Authentication/Controller/auth_controller.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

bool isHeart = false;
List<bool> isHeartList = [false, false];
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
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _handleSignOut,
            icon: Icon(CupertinoIcons.power),
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
        children: [],
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
                    icon: Iconsax.play,
                    text: 'Moments',
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

  Widget _buildPost() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1621184455862-c163dfb30e0f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZmFzaGlvbiUyMGdpcmx8ZW58MHx8MHx8fDA%3D'),
              ),
              const SizedBox(width: 10),
              const Text('Sofia_91'),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.ellipsis_vertical,
                  color: CupertinoColors.black,
                  size: 20,
                ),
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
          child: Text(
              'Hey, Guys hope you all doing good check my new portfolio on github!'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildImageCard(
                  'https://plus.unsplash.com/premium_photo-1675186049419-d48f4b28fe7c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8ZmFzaGlvbnxlbnwwfHwwfHx8MA%3D%3D',
                  'Tops',
                ),
                _buildImageCard(
                  'https://plus.unsplash.com/premium_photo-1675186049574-061fba2d243c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGZhc2hpb258ZW58MHx8MHx8fDA%3D',
                  'White V Neck Shirt',
                ),
              ],
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    isHeartList[0] = !isHeartList[0];
                  });
                },
                icon: Icon(
                  isHeartList[0]
                      ? CupertinoIcons.heart_fill
                      : CupertinoIcons.heart,
                  color: isHeartList[0]
                      ? CupertinoColors.systemPink
                      : CupertinoColors.black,
                  size: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.at,
                  color: CupertinoColors.black,
                  size: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.arrow_2_squarepath,
                  color: CupertinoColors.black,
                  size: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.share,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildImageCard(String imageUrl, String title) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: 200,
                height: 150,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
