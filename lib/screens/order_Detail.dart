import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project/Mvm/searchjokipemesanan.dart';
// import 'package:project/screens/imagepemesanan.dart';

class OrderDetailWidget extends StatefulWidget {
  final Pemesanan order;
  final Paket paket;
  final List<String> images;

  const OrderDetailWidget(
      {Key? key, required this.order, required this.paket, required this.images})
      : super(key: key);


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
              Color.fromARGB(255, 64, 59, 74),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Text(
                  "Terima Kasih!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Transaksi Sudah Selesai.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Pesanan Kamu',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(height: 3),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 61, 74, 87),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '${widget.order.id}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  "Pesananmu Telah Diproses",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
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
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 2.0),
                      Text("Pembelian Produk: JOKI Rank Mobile Legend"),
                      SizedBox(height: 10.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 10.0),
                      Text(
                        'Nomor Invoice',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 2.0),
                      Text("Nomor Invoice: ${widget.order.id}"),
                      SizedBox(height: 10.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 10.0),
                      Text(
                        'Detail Pemesanan',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 2.0),
                      Text(
                        "Nama Paket: ${widget.paket.namaPaket}, ${widget.paket.jokiRank}",
                      ),
                      SizedBox(height: 10.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 10.0),
                      Text(
                        'Item Dibeli',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 2.0),
                      Text("Jumlah: ${widget.order.jumlahBintang}"),
                      SizedBox(height: 10.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 10.0),
                      Text(
                        'Status Pembayaran',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 2.0),
                      Text("Status: ${widget.order.status}"),
                      SizedBox(height: 10.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 10.0),
                      Text(
                        'Tanggal Pemesanan',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 2.0),
                      Text(
                        "${widget.order.createdAt?.substring(0, 20)}",
                      ),
                      SizedBox(height: 10.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 10.0),
                      Text(
                        'Harga Perpaket',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 2.0),
                      Text("Rp: ${widget.paket.hargaJoki}"),
                      SizedBox(height: 10.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 10.0),
                      Text(
                        'Total Pembayaran',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 2.0),
                      Text("Rp: ${widget.order.hargaKeseluruhan}"),
                      SizedBox(height: 10.0),
                    ],
                  ),
                ),
                SizedBox(height: 15),
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
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 8.0),
                      Text(
                        'Login Via',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 2.0),
                      Text("${widget.order.loginVia}"),
                      SizedBox(height: 8.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 8.0),
                      Text(
                        'User ID & NickName',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 2.0),
                      Text("${widget.order.idServer}"),
                      SizedBox(height: 8.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 8.0),
                      Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 2.0),
                      Text("${widget.order.emailNoHpMontonID}"),
                      SizedBox(height: 8.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 8.0),
                      Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 2.0),
                      Text("${widget.order.password}"),
                      SizedBox(height: 8.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 8.0),
                      Text(
                        'Request Hero',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 2.0),
                      Text("${widget.order.requestHero}"),
                      SizedBox(height: 8.0),
                      Divider(color: Colors.grey),
                      SizedBox(height: 8.0),
                      Text(
                        'Catatan Untuk Pejoki',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 2.0),
                      Text("${widget.order.catatanPenjoki}"),
                      SizedBox(height: 16.0),
                      Text(
                        'Worker Id',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 2.0),
                      Text("${widget.order.idWorker ?? '---'}"),
                      SizedBox(height: 16.0),
                      SizedBox(
                        width: double.infinity,
                        child: GestureDetector(
                          onTap: () {
                            // Aksi untuk download invoice
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(8.0),
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
                                  "Download Invoice",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.yellow,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                 SizedBox(height: 15),
               Text(
                'Screnshot hasil Joki',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
               Container(
              height: 200,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: widget.images.map((image) {
                     print('Loading image: $image');
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
