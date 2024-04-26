import 'package:flutter/material.dart';
import 'package:project/topup_Screen/COC_screen.dart';
import 'package:project/topup_Screen/Ghensin_Screen.dart';
import 'package:project/topup_Screen/ML_Screen.dart';
import 'package:project/topup_Screen/Pubg_Screen.dart';
import 'package:project/topup_Screen/Valo_Screen.dart';
import 'package:project/topup_Screen/ff_Screen.dart';

class Populerw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
            SizedBox(height: 1),
          _buildImage('images/PO_topup.png', () {
            _navigateToMlScreen(context);
          }),
            SizedBox(height: 1),
          _buildImage('images/PO_ff.png', () {
            _navigateToFFScreen(context);
          }),
          _buildImage('images/PO_coc.png', () {
            _navigateToCOC(context);
          }),
            SizedBox(height: 1),
          _buildImage('images/PO_JOKI.png', () {
          }), 
            SizedBox(height: 1),
          _buildImage('images/PO_genshin.png', () {
            _navigateToGenshin(context);
          }), 
            SizedBox(height: 1),
          _buildImage('images/PO_pubg.png', () {
            _navigateToPUBG(context);
          }), 
            SizedBox(height: 1),
          _buildImage('images/PO_valo.png', () {
            _navigateToValo(context);
          }), 
        ],
      ),
    );
  }

  Widget _buildImage(String imagePath, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: onTap,
        child: Image.asset(
          imagePath,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void _navigateToMlScreen(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MlScreen()));
  }
  void _navigateToFFScreen(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => FFScreen()));
  }
  void _navigateToCOC(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CocTopUp()));
  }
  // void _navigateToJoki(BuildContext context) {
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => CocTopUp()));
  // }
  void _navigateToGenshin(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => GenshinScreen()));
  }
  void _navigateToPUBG(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => PubgScreen()));
  }
  void _navigateToValo(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ValoScreen()));
  }
  
  
}
