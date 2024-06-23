import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:project/Form Pemesanan/snap_web_view_screen.dart';
import 'package:project/ipconfig.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OrderDiamondPage extends StatefulWidget {
  final Map<String, dynamic> orderData;

  const OrderDiamondPage({Key? key, required this.orderData}) : super(key: key);

  @override
  State<OrderDiamondPage> createState() => _OrderDiamondPageState();
}

class _OrderDiamondPageState extends State<OrderDiamondPage> {

final TextEditingController _url = TextEditingController();

  Future<String> getSnapToken(
      double amount,
      String firstName,
      String phone,
      int id_paket,
      ) async {
    final response = await http.post(
      Uri.parse(
      '${Ipconfig.baseUrl}/transaksi_diamond'), 
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'amount': amount,
        'first_name': firstName,
        'phone': phone,
        'id': id_paket,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return responseData['snap_token'];
    } else {
      throw Exception('Failed to get Snap Token');
    }
  }



  @override
  Widget build(BuildContext context) {
    final orderData = widget.orderData;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xff22577A),
        title: Text(
          'Pemesanan Kamu',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 161, 160, 139),
              const Color.fromARGB(255, 64, 59, 74)
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Terima Kasih",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Transaksi Sudah Selesai.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Pesanan Kamu',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(
                  height: 3,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 61, 74, 87),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "${orderData['id']}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  "Pesananmu Telah Diproses",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  width: 365,
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.7),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Detail Pembelian',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 2.0),
                      Text("Pembelian Produk: Top Up Diamond Mobile Legend"),
                      SizedBox(height: 10.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 10.0),
                      Text(
                        'Nomor Invoice',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 2.0),
                      Text("Nomor Invoice: ${orderData['id']}"),
                      SizedBox(height: 10.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 10.0),
                      Text(
                        'Id Server Game',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 2.0),
                      Text("Id Game: ${orderData['id_server']}"),
                      SizedBox(height: 10.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 10.0),
                      Text(
                        'Status Pembayaran',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 2.0),
                      Text("Status: ${orderData['status']}"),
                      SizedBox(height: 10.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 10.0),
                       Text(
                        'Nama Game',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                             color: Colors.black),
                      ),
                      SizedBox(height: 2.0),
                      Text(" ${orderData['nama_game']}"),
                      SizedBox(height: 10.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 10.0),
                       Text(
                        'Jumlah Diamond',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 2.0),
                      Text(" ${orderData['jumlah_diamond']}"),
                      SizedBox(height: 10.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 10.0),
                      Text(
                        'Pesan',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 2.0),
                      Text(
                          "Transaksi Berhasil pada: ${orderData['created_at'] != null ? orderData['created_at'].toString().substring(0, 19) : 'null'}"),
                      SizedBox(height: 10.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 10.0),
                      Text(
                        'Harga',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 2.0),
                      Text("Rp : ${orderData['harga_keseluruhan']}"),
                      SizedBox(height: 10.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 10.0),
                      Text(
                        'No HandPhone',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 2.0),
                      Text("No Hp : ${orderData['no_hp']}"),
                      SizedBox(height: 10.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 10.0),
                      Text(
                        'Id Diamond Order',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 2.0),
                      Text("Id Diamond : ${orderData['id_diamond']}"),
                      SizedBox(height: 10.0),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 22),
                  child: ElevatedButton(
                    onPressed: () async{
                        try {
                        final snapToken = await getSnapToken(
                            double.parse(orderData['harga_keseluruhan'].toString()),
                            orderData['id_server'].toString(),
                            orderData['no_hp'].toString(),
                            int.parse(orderData['id_diamond'].toString()),
                            // 'epic',
                            );
                        final url =
                            'https://app.sandbox.midtrans.com/snap/v2/vtweb/$snapToken'; // URL untuk Midtrans SNAP

                        print('Snap Token: $snapToken'); // Debugging print
                        print('URL: $url'); // Debugging print

                        Navigator.of(context).pushNamed(
                          SnapWebViewScreen.routeName,
                          arguments: {
                            'url': url,
                            'orderData': orderData,  // Meneruskan orderData ke SnapWebViewScreen
                            },
                        );
                      } catch (e) {
                        // Tangani kesalahan jika gagal mendapatkan Snap Token
                        print(e);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Color(0xff22577A),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.yellow,
                        ),
                        SizedBox(width: 7),
                        Text(
                          "Bayar Now",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.yellow,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
