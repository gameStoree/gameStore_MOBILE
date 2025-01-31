import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_core/src/get_main.dart';
import 'package:project/Model_topUp/image_slider.dart';
import 'package:project/Model_topUp/order_model.dart';
import 'package:project/ipconfig.dart';
import 'package:project/screens/profile.dart';
import 'package:project/widgets/joki.dart';
import 'package:project/widgets/populer_widgets.dart';
import 'package:sp_util/sp_util.dart';
import '../widgets/home_buttom.dart';
import '../widgets/items_widget.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _current = 0;
  final CarouselController _controller = CarouselController();
  bool hasNewOrder = false;

  void logout() async {
    EasyLoading.show(status: 'Logging out...');
    String? token = SpUtil.getString('token');
    if (token != null) {
      Uri apiUrl = Uri.parse('${Ipconfig.baseUrl}/logout');
      try {
        var response = await http.post(
          apiUrl,
          headers: {
            'Authorization': 'Bearer $token',
          },
        );
        if (response.statusCode == 200) {
          SpUtil.remove('token');
          SpUtil.remove('email');
          SpUtil.remove('nama_lengkap');
          SpUtil.remove('alamat');
          SpUtil.remove('foto_user');
          EasyLoading.dismiss();
          Get.snackbar(
            "Success",
            "Logout berhasil",
            backgroundColor: Colors.green,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          );
          Get.offAllNamed('/login');
        } else {
          EasyLoading.dismiss();
          print('Logout failed: ${response.statusCode}');
        }
      } catch (e) {
        EasyLoading.dismiss();
        print('Error: $e');
      }
    } else {
      EasyLoading.dismiss();
      print('Token tidak ditemukan di local storage');
    }
  }

  Future<List<Orderan>> fetchOrderIds(int userId) async {
    final url = Uri.parse('${Ipconfig.baseUrl}/order-ids/$userId');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> orderJson = json.decode(response.body)['orders'];
      print(orderJson);
      return orderJson.map((json) => Orderan.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  void checkForNewOrders() async {
    int userId = SpUtil.getInt('id_user') ?? 0;
    List<Orderan> orders = await fetchOrderIds(userId);
    print(orders);

    setState(() {
      hasNewOrder = orders.isNotEmpty;
    });
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTableSelection);
    super.initState();
    checkForNewOrders();
  }

  _handleTableSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
                        colors: [
  const Color(0xFF34A0A4),
  const Color(0xFF184E77),
],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 15),
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          _scaffoldKey.currentState!.openDrawer();
                        },
                        child: Icon(
                          Icons.sort,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          try {
                            int userId = SpUtil.getInt('id_user') ?? 0;
                            List<Orderan> orders = await fetchOrderIds(userId);
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: Text("Pemberitahuan"),
                                  content: orders.isNotEmpty
                                      ? Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: orders.map((order) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Text(
                                                'ID Pemesanan: ${order.id}\nTanggal: ${order.createdAt.substring(0, 19)}',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            );
                                          }).toList(),
                                        )
                                      : Text("Belum ada pemberitahuan",
                                          style: TextStyle(fontSize: 20)),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Tutup"),
                                    ),
                                  ],
                                );
                              },
                            );
                            setState(() {
                              hasNewOrder = false;
                            });
                          } catch (e) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Pemberitahuan"),
                                  content: Text("Gagal memuat ID pemesanan",
                                      style: TextStyle(fontSize: 20)),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Tutup"),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: Stack(
                          children: [
                            Icon(
                              Icons.notifications_active,
                              color: Colors.white,
                              size: 35,
                            ),
                            if (hasNewOrder)
                              Positioned(
                                right: 0,
                                top: 0,
                                child: Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  constraints: BoxConstraints(
                                    minWidth: 12,
                                    minHeight: 12,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi, ${SpUtil.getString("nama_lengkap")}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Selamat menikmati Jasa Kami!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Container(
                      child: CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 2.0,
                          enlargeCenterPage: true,
                          viewportFraction: 0.7,
                          onPageChanged: (index, carouselReason) {
                            setState(() {
                              _current = index;
                            });
                          },
                        ),
                        items: imgList
                            .map(
                              (item) => Container(
                                child: Container(
                                  margin: EdgeInsets.all(5.0),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    child: Image.asset(
                                      item,
                                      fit: BoxFit.cover,
                                      width: 1000.0,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList
                          .asMap()
                          .entries
                          .map(
                            (entry) => GestureDetector(
                              onTap: () => _controller.animateToPage(entry.key),
                              child: Container(
                                width: 12.0,
                                height: 12.0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.black)
                                      .withOpacity(
                                          _current == entry.key ? 0.9 : 0.4),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                TabBar(
                  controller: _tabController,
                  labelColor: Color(0xffC7F9CC),
                  unselectedLabelColor: Colors.white,
                  isScrollable: true,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 3,
                      color: Color(0xffC7F9CC),
                    ),
                    insets: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  labelStyle:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  labelPadding: EdgeInsets.symmetric(horizontal: 20),
                  tabs: [
                    Tab(
                      text: "Populer",
                    ),
                    Tab(
                      text: "Jasa MLBB",
                    ),
                    Tab(
                      text: "Top Up Games",
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Center(
                  child: [
                    Populerw(),
                    listJoki(),
                    ItemsWidget(),
                  ][_tabController.index],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: HomeBottomBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff22577A),
              ),
              child: Text(
                '${SpUtil.getString("email")}',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle), // Ikon yang ditambahkan
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              }, // Add this line
            ), // Add this line
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Keluar'),
              onTap: () => showLogoutDialog(context),
            ),
          ],
        ),
      ),
    );
  }

  void showLogoutDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.topSlide,
      showCloseIcon: true,
      title: 'Warning',
      desc: 'Apakah Anda yakin ingin keluar?',
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        logout();
      },
    )..show();
  }
}
