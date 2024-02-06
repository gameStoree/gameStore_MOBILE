import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart' as GNav;
import 'akun.dart';
import 'pengaturan.dart';
import 'beranda.dart' as Beranda;

class LacakOrderan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lacak Orderan'),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: Beranda.buildBottomNavBar(context, 1), // Menggunakan alias "Beranda"
      body: Container(
        // Your Lacak Orderan page content goes here
      ),
    );
  }
}