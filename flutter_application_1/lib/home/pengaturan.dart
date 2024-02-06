import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart' as GNav;
import 'beranda.dart';
import 'lacak_orderan.dart';
import 'akun.dart';

Widget buildBottomNavBar(BuildContext context, int selectedIndex) {
  return Container(
    color: Colors.black,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
      child: GNav.GNav(
        backgroundColor: Colors.black,
        color: Colors.white,
        activeColor: Colors.white,
        tabBackgroundColor: Colors.grey.shade800,
        gap: 10,
        padding: EdgeInsets.all(16),
        tabs: [
          GNav.GButton(
            icon: Icons.home,
            text: 'Home',
            onPressed: () {
              _navigateToPage(context, 0);
            },
          ),
          GNav.GButton(
            icon: Icons.search,
            text: 'Lacak Orderan',
            onPressed: () {
              _navigateToPage(context, 1);
            },
          ),
          GNav.GButton(
            icon: Icons.person,
            text: 'Profile',
            onPressed: () {
              _navigateToPage(context, 2);
            },
          ),
          GNav.GButton(
            icon: Icons.settings,
            text: 'Pengaturan',
            onPressed: () {
              _navigateToPage(context, 3);
            },
          ),
        ],
        selectedIndex: selectedIndex,
      ),
    ),
  );
}

void _navigateToPage(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.pushReplacementNamed(context, '/beranda');
      break;
    case 1:
      Navigator.pushReplacementNamed(context, '/lacak_orderan');
      break;
    case 2:
      Navigator.pushReplacementNamed(context, '/profile');
      break;
    case 3:
      Navigator.pushReplacementNamed(context, '/pengaturan');
      break;
  }
}

class pengaturan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: buildBottomNavBar(context, 3),
      body: Container(
        // Your Pengaturan page content goes here
      ),
    );
  }
}
