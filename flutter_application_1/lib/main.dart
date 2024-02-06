import 'package:flutter/material.dart';
import 'package:flutter_application_1/home/akun.dart';
import 'package:flutter_application_1/home/beranda.dart'; // Sesuaikan dengan path file beranda.dart Anda
import 'package:flutter_application_1/home/lacak_orderan.dart';
import 'package:flutter_application_1/home/pengaturan.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
       initialRoute: '/beranda', // Atur rute awal sesuai kebutuhan
 routes: {
  '/beranda': (context) => Beranda(),
  '/pengaturan': (context) => pengaturan(),
  '/lacak_orderan': (context) => LacakOrderan(),
  '/akun': (context) => akun(),
  // Definisikan rute lainnya sesuai kebutuhan
},
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Tambahkan delay untuk simulasi splash screen
    Future.delayed(Duration(seconds: 3), () {
      // Navigasi ke halaman beranda setelah splash screen
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Beranda(), // Sesuaikan dengan nama kelas beranda.dart Anda
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    // Tampilkan widget splash screen di sini
    return Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
