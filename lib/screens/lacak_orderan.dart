  import 'dart:convert';

  import 'package:flutter/material.dart';
  import 'package:http/http.dart' as http;
  import 'package:project/Model_topUp/searchjokipemesanan.dart';
  import 'package:project/screens/order_Detail.dart';
  import 'package:project/widgets/home_buttom.dart';

  class SearchPage extends StatefulWidget {
    const SearchPage({Key? key}) : super(key: key);

    @override
    State<SearchPage> createState() => _SearchPageState();
  }

  class _SearchPageState extends State<SearchPage> {
    TextEditingController _orderIdController = TextEditingController();
    Pemesanan? _order;

    Future<void> _searchOrder() async {
      final String orderId = _orderIdController.text;
      final url = 'http://10.0.2.2:8000/api/pemesanan/$orderId';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        setState(() {
          _order = Pemesanan.fromJson(json.decode(response.body)['data']);
        });
        // Navigasi ke halaman detail_order jika data ditemukan
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDetailWidget(order: _order!),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("Id Pemesanan tidak ditemukan!"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
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
          // top: MediaQuery.of(context).size.height * 0.0, // Atur posisi vertikal
          left: 15,
          right: 15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                child: Text(
                  'Lacak Pesanan Kamu dengan menggunakan Invoice!',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, ),
                child: Text(
                  'Pesanan Kamu tidak terdaftar meskipun kamu yakin telah memesan ? Harap tunggu 1-5 menit. Tetapi jika pesanan masih belum muncul, kamu bisa Menghubungi kami melalui website resmi',
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
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
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
                      prefixIcon: Icon(Icons.search, size: 30, color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              // SizedBox(height: 20),
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
                    child: Text(
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
