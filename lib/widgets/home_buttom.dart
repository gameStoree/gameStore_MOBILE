import 'package:flutter/material.dart';

class HomeBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 70, // Mengubah tinggi menjadi 70
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 1,
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIconText(
            context, // Pastikan untuk memberikan context di sini
            Icons.home,
            'Home',
          ),
          _buildIconText(
            context,
            Icons.search,
            'Lacak Orderan',
          ),
          _buildIconText(
            context,
            Icons.account_circle,
            'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildIconText(BuildContext context, IconData icon, String text) {
    return Expanded(
      child: InkWell(
        onTap: () {
          // Navigasi ke halaman terkait
          if (text == 'Home') {
            Navigator.pushNamed(context, '/home');
          } else if (text == 'Lacak Orderan') {
            Navigator.pushNamed(context, '/search');
          } else if (text == 'Profile') {
            Navigator.pushNamed(context, '/account');
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Color(0xFFE57734),
              size: 24,
            ),
            SizedBox(height: 5),
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
