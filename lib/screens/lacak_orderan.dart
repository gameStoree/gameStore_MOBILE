import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:project/Mvm/searchDiamond.dart';
import 'package:project/Mvm/searchjokipemesanan.dart';
import 'package:project/ipconfig.dart';
import 'package:project/screens/order_Detail.dart';
import 'package:project/screens/order_detail_diamond.dart';
import 'package:project/widgets/home_buttom.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  // final int pemesananId;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _orderIdController = TextEditingController();
  bool _isLoading = false;
  

 Future<void> _searchOrder() async {
  final String orderId = _orderIdController.text;
  if (orderId.isEmpty) {
    EasyLoading.showError("Id Pemesanan tidak boleh kosong!");
    return;
  }

  setState(() {
    _isLoading = true;
  });
  EasyLoading.show(status: 'Pesanan anda Diproses');

  final url = '${Ipconfig.baseUrl}/search/$orderId';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final responseData = json.decode(response.body);
    final type = responseData['type'];

    if (type == 'joki Rank') {
      final pemesananData = responseData['pemesanan'];
      final paketData = responseData['paket'];
      final imageData = responseData['images'];
      if (pemesananData != null && paketData != null && imageData != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDetailWidget(
              order: Pemesanan.fromJson(pemesananData),
              paket: Paket.fromJson(paketData),
              images: List<String>.from(imageData),
            ),
          ),
        );
      } else {
        EasyLoading.showError("Id Pemesanan tidak ditemukan!");
      }
    } else if (type == 'diamond') {
      final pemesananDiamondData = responseData['pemesanan'];
      if (pemesananDiamondData != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDiamondDetail(
              order: Pemesanandiamond.fromJson(pemesananDiamondData),
            ),
          ),
        );
      } else {
        EasyLoading.showError("Id Pemesanan tidak ditemukan!");
      }
    } else {
      EasyLoading.showError("Tipe pesanan tidak valid!");
    }
  } else {
    EasyLoading.showError("Terjadi kesalahan saat mengambil data!");
  }

  setState(() {
    _isLoading = false;
  });
  EasyLoading.dismiss();
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff22577A),
        title: Text(
          'Lacak Orderan',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bg_flower.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Positioned(
            left: 15,
            right: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Text(
                    'Lacak Pesanan Kamu dengan menggunakan Invoice!',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Pesanan Kamu tidak terdaftar meskipun kamu yakin telah memesan? Harap tunggu 1-5 menit. Tetapi jika pesanan masih belum muncul, kamu bisa Menghubungi kami melalui website resmi.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff38A3A5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: _orderIdController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Cek Orderanmu...",
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon:
                            Icon(Icons.search, size: 30, color: Colors.white),
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      style: TextStyle(color: Colors.white),
                      textAlignVertical: TextAlignVertical.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GestureDetector(
                    onTap: _searchOrder,
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color(0xff22577A),
                      ),
                      child: _isLoading
                          ? CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            )
                          : Text(
                              'Lacak Orderan kamu',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: HomeBottomBar(),
    );
  }
}
