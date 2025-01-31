import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:project/Form%20Pemesanan/pemesananJoki.dart';
// import 'package:project/Model_topUp/Diamond_model.dart';
// import 'package:project/Model_topUp/searchjokipemesanan.dart';
import 'package:sp_util/sp_util.dart';
import 'package:project/screens/lacak_orderan.dart';
import 'package:project/screens/welcome_screen.dart';
import 'package:project/screens/home.dart';
import 'package:project/screens/profile.dart';
import 'package:project/Form Pemesanan/snap_web_view_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // List<Pemesanan> Datajoki= await fetchJokirank();
  await SpUtil.getInstance();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => welcomescreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/search', page: () => SearchPage()),
        GetPage(name: '/account', page: () => Profile()),
        GetPage(
            name: '/order_joki',
            page: () => OrderJokiPage(orderData: {})), // Add this line

        GetPage(
            name: SnapWebViewScreen.routeName,
            page: () => const SnapWebViewScreen(orderData: {})),
      ],
      home: welcomescreen(),
      builder: EasyLoading.init(),
    );
  }
}
