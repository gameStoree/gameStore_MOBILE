import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart' as GNav;
import 'lacak_orderan.dart';
import 'pengaturan.dart';
import 'beranda.dart' as Beranda;

class akun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: buildBottomNavBar(context, 2),
      body: Container(
        // Your Profile page content goes here
      ),
    );
  }
}