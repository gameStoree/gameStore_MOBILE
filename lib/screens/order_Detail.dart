import 'package:flutter/material.dart';
import 'package:project/Model_topUp/searchjokipemesanan.dart';
import 'package:intl/intl.dart';
import 'package:project/screens/home.dart';

class OrderDetailWidget extends StatefulWidget {
  final Pemesanan order;

  const OrderDetailWidget({Key? key, required this.order}) : super(key: key);

  @override
  _OrderDetailWidgetState createState() => _OrderDetailWidgetState();
}

class _OrderDetailWidgetState extends State<OrderDetailWidget> {
  @override
  Widget build(BuildContext context) {
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
            ], // Ganti warna sesuai keinginan
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
                  style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8,),
                Text(
                  'Transaksi Sudah Selesai.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold, color: Colors.white),
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
                    color: Color.fromARGB(255, 61, 74, 87), // Ganti warna sesuai keinginan
                    borderRadius: BorderRadius.circular(10.0), // Sesuaikan radius sesuai kebutuhan
                  ),
                  padding: EdgeInsets.all(8.0), // Sesuaikan padding sesuai kebutuhan
                  child: Text(
                    "${widget.order.id}",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  "Pesananmu Telah Diproses",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12.0),
                Container(
                  width: 365,
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.7), // Putih dengan tingkat transparansi 0.5
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
                      Text("Pembelian Produk: ${widget.order.namaPaket ?? 'Tidak ada data'} : ${widget.order.rank_joki ?? 'Tidak ada data'} "),
                      SizedBox(height: 10.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 10.0),
                      Text(
                        'Nomor Invoice',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(height: 2.0),
                      Text("Nomor Invoice: ${widget.order.id}"),
                      SizedBox(height: 10.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 10.0),
                      Text(
                        'Status Pembayaran',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(height: 2.0),
                      Text("Status: ${widget.order.status ?? 'Tidak ada data'}"),
                      SizedBox(height: 10.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 10.0),
                      Text(
                        'Pesan',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(height: 2.0),
                      Text("Transaksi Berhasil pada: ${widget.order.createtgl.toString().substring(0,19) ?? 'Tidak ada data'}"),
                      SizedBox(height: 10.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 10.0),
                      Text(
                        'Harga',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(height: 2.0),
                      Text("Rp : ${widget.order.harga_joki ?? 'Tidak ada data'}"),
                      SizedBox(height: 10.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 10.0),
                      Text(
                        'Total Pembayaran',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(height: 2.0),
                      Text("Rp : ${widget.order.harga_joki ?? 'Tidak ada data'}"),
                      SizedBox(height: 10.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 10.0),
                      Text(
                        'Metode Pembayaran',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(height: 2.0),
                      Text("${widget.order.metodePembayaran ?? 'Tidak ada data'}"),
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
                  Text("${widget.order.loginVia ?? 'Tidak ada data'}"),
                  SizedBox(height: 8.0),
                  Divider(color: Colors.grey),
                  SizedBox(height: 8.0),
                  Text(
                    'User ID & NickName',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(height: 2.0),
                  Text("${widget.order.nicknameMl ?? 'Tidak ada data'}"),
                  SizedBox(height: 8.0),
                  Divider(color: Colors.grey),
                  SizedBox(height: 8.0),
                  Text(
                    'Email',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(height: 2.0),
                  Text("${widget.order.emailNoHpMontonID ?? 'Tidak ada data'}"),
                  SizedBox(height: 8.0),
                  Divider(color: Colors.grey),
                  SizedBox(height: 8.0),
                  Text(
                    'Password',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(height: 2.0),
                  Text("${widget.order.password ?? 'Tidak ada data'}"),
                  SizedBox(height: 8.0),
                  Divider(color: Colors.grey),
                  SizedBox(height: 8.0),
                  Text(
                    'Request Hero',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(height: 2.0),
                  Text("${widget.order.requestHero ?? 'Tidak ada data'}"),
                  SizedBox(height: 8.0),
                  Divider(color: Colors.grey),
                  SizedBox(height: 8.0),
                  Text(
                    'Catatan Untuk Pejoki',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(height: 2.0),
                  Text("${widget.order.catatanPenjoki ?? 'Tidak ada data'}"),
        
                  SizedBox(height: 8.0),
                  Divider(color: Colors.grey),
                  SizedBox(height: 8.0),
                  Text(
                    'Nama Worker',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  SizedBox(height: 2.0),
                  Text("${widget.order.namaWorker ?? 'Tidak ada data'}"),
                  SizedBox(height: 16.0),
                  SizedBox(
                    width: double.infinity,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text(
                            'Download Invoice',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
