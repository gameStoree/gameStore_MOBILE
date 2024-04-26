import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/Login_2/wrapper.dart';

class welcomescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
               color: Color(0xff80ED99),
              image: DecorationImage(
                image: AssetImage("images/screen1.png"),
                fit: BoxFit.contain,
                // opacity: 0.6,
              ),
            ),
          ),
          Positioned(
            bottom: 70,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  "GamerStore.Id",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.josefinSans(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10), // Tambahkan jarak antara teks dan tombol
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Wrapper(),
                      ));
                    // Tindakan ketika tombol ditekan
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    decoration : BoxDecoration(
                      color: Color(0xff38A3A5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child : Text (
                      'Get Started',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
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