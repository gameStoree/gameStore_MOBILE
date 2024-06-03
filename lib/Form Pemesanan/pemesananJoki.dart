import 'package:flutter/material.dart';

class OrderJokiPage extends StatefulWidget {
  final Map<String, dynamic> orderData;
  const OrderJokiPage({Key? key, required this.orderData}) : super(key: key);
  @override
  State<OrderJokiPage> createState() => _OrderJokiPageState();
}
class _OrderJokiPageState extends State<OrderJokiPage> {
  @override
  Widget build(BuildContext context) {
    final orderData = widget.orderData;
    String getValueAsString(dynamic value) {
      return value != null ? value.toString() : 'Tidak ada data';
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xff22577A),
        title: Text(
          'Data Pesanan Kamu',
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
                SizedBox(height: 10,),
                Text(
                  "Terima Kasih!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8,),
                Text(
                  'Transaksi Sudah Selesai.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 15,),
                Text(
                  'Pesanan Kamu',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(height: 3,),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 61, 74, 87),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    getValueAsString(orderData['id']),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  "Pesananmu Telah Diproses",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12.0),
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
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(height: 2.0),
                      Text("Pembelian Produk: JOKI Rank Mobile Legend"),
                      SizedBox(height: 10.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 10.0),
                      Text(
                        'Nomor Invoice',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(height: 2.0),
                      Text("Nomor Invoice: ${getValueAsString(orderData['id'])}"),
                      SizedBox(height: 10.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 10.0),
                       Text(
                        'ID Pemesanan Joki',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(height: 2.0),
                      Text("Item Id:  ${getValueAsString(orderData['id_paket'])}"),
                      SizedBox(height: 10.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 10.0),
                      Text(
                        'Item Dibeli',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(height: 2.0),
                      Text("Buy:  ${getValueAsString(orderData['jumlah_bintang'])}"),
                      SizedBox(height: 10.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 10.0),
                      Text(
                        'Status Pembayaran',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(height: 2.0),
                      Text("Status: ${getValueAsString(orderData['status'])}"),
                      SizedBox(height: 10.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 10.0),
                      Text(
                        'Pesan',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(height: 2.0),
                      Text("Transaksi Berhasil pada: ${getValueAsString(orderData['created_at']).substring(0, 19)}"),
                      SizedBox(height: 10.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 10.0),
                      Text(
                        'Total Pembayaran',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(height: 2.0),
                      Text("Rp : ${getValueAsString(orderData['harga_keseluruhan'])}"),
                      SizedBox(height: 10.0),
                    
                    ],
                  ),
                ),
                SizedBox(height: 15,),
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
                        'Informasi Akun',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(height: 8.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 8.0),
                      Text(
                        'Login Via',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(height: 2.0),
                      Text(getValueAsString(orderData['login_via'])),
                      SizedBox(height: 8.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 8.0),
                      Text(
                        'User ID & NickName',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(height: 2.0),
                      Text(getValueAsString(orderData['Id_Server'])),
                      SizedBox(height: 8.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 8.0),
                      Text(
                        'Email',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(height: 2.0),
                      Text(getValueAsString(orderData['email_no_hp_montonID'])),
                      SizedBox(height: 8.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 8.0),
                      Text(
                        'Password',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(height: 2.0),
                      Text(getValueAsString(orderData['password'])),
                      SizedBox(height: 8.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 8.0),
                      Text(
                        'Request Hero',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(height: 2.0),
                      Text(getValueAsString(orderData['request_hero'])),
                      SizedBox(height: 8.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 8.0),
                      Text(
                        'Catatan Untuk Pejoki',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(height: 2.0),
                      Text(getValueAsString(orderData['catatan_penjoki'])),
                      SizedBox(height: 16.0),
                      // SizedBox(
                      //   width: double.infinity,
                      //   child: GestureDetector(
                      //     onTap: () {
                      //       // Navigator.push(
                      //       //   context,
                      //       //   MaterialPageRoute(builder: (context) => HomeScreen()),
                      //       // );
                      //     },
                      //     child: Container(
                      //       padding: EdgeInsets.symmetric(vertical: 12.0),
                      //       decoration: BoxDecoration(
                      //         color: Colors.blue,
                      //         borderRadius: BorderRadius.circular(8.0),
                      //       ),
                      //       child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //       Icon(Icons.shopping_cart,
                      //       color: Colors.yellow,),
                      //       SizedBox(width: 7),
                      //       Text(
                      //         "Bayar Now",
                      //         style: TextStyle(
                      //      fontSize: 20,
                      //     color: Colors.yellow,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
              Container(
              margin: EdgeInsets.symmetric(horizontal: 22),
              child: ElevatedButton(
              onPressed: () {


              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Color(0xff22577A),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart,
                  color: Colors.yellow,),
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
                SizedBox(height: 25,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
