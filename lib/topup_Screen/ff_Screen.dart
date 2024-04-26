import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project/Ketentuan%20TopUp/Ketentuan_topup.dart';
import 'package:project/Model_topUp/Diamond_model.dart';
// import 'package:project/model/model_payment.dart';
import 'package:project/widgets/home_buttom.dart';
import 'package:http/http.dart' as http;

class FFScreen extends StatefulWidget {
  const FFScreen({Key? key}) : super(key: key);

  @override
  State<FFScreen> createState() => _FFScreenState();
}

class _FFScreenState extends State<FFScreen> {
  TextEditingController idGame = TextEditingController();
  TextEditingController noHp = TextEditingController();

   String? selectedMethod;


  late Future<List<Diamond>> _diamondsFuture;
  int _selectedIndex = -1;
  

  @override
  void initState() {
    super.initState();
    _diamondsFuture = fetchDiamonds('Free Fire');
  }

  Future<List<Diamond>> fetchDiamonds(String gameName) async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/diamonds/free.fire'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      return data.map((json) => Diamond.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load diamonds');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Top Up Free Fire',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
        
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        
      ),
      // SizedBox(width: 7),
      body: FutureBuilder<List<Diamond>>(
        future: _diamondsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<Diamond> diamonds = snapshot.data!;
            return ListView(
              children: [
                
  
                Container(
                  height: 200, 
                  width: double.infinity, 
                  color: Colors.blue,
                  child: Image.asset(
                    'images/Screen_FFTP.png', 
                    fit: BoxFit.cover, 
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  color: Color(0xff22577A),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(
                        'images/Label_ff.png',
                        width: 80, 
                        height: 80,
                      ),
                      SizedBox(width: 16), 
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Free Fire', 
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white, 
                              ),
                            ),
                            SizedBox(height: 1), 
                            Text(
                              'Garena', 
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white, 
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10), 
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.check_circle,
                                    color: Colors.green, 
                                  ),
                                  SizedBox(width: 10), 
                                  Text(
                                    'Terverifikasi', 
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white, 
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 8, top: 10, left: 15, right: 15), 
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xff22577A),
                    border: Border.all(color: Color(0xffC7F9CC)), 
                    borderRadius: BorderRadius.circular(10), 
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.security,
                            color: Color(0xff80ED99),
                          ),
                          SizedBox(width: 8), 
                          Text(
                            'Jaminan Layanan', 
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.phone,
                            color: Color(0xff80ED99),
                          ),
                          SizedBox(width: 8), 
                          Text(
                            'Jaminan Layanan 24 Jam', 
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.credit_card,
                            color: Color(0xff80ED99),
                          ),
                          SizedBox(width: 8), 
                          Text(
                            'Pembayaran Aman & Terpercaya', 
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.flash_on,
                            color: Color(0xff80ED99),
                          ),
                          SizedBox(width: 8), 
                          Text(
                            'Proses Cepat & Otomatis', 
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => KT_freefire()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 8, left: 15, right: 15), 
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xff22577A),
                      border: Border.all(color: Color(0xffC7F9CC)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text(
                          'Lihat Cara Transaksi Disini',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                Column( 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 8, left: 15, right: 15),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffC7F9CC)),
                        color: Color(0xff22577A),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '1.      Masukan Data Akun Kamu',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ), 
                          SizedBox(height: 15), 
                          Text(
                            'ID Game',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 9),  
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Color(0xff22577A),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.white),
                            ),
                            child: TextField(
                              controller: idGame,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Ketikan ID Game kamu',
                                hintStyle: TextStyle(color: Colors.white54),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.only(bottom: 8, left: 20, right: 15),
                      child: Text(
                        'Diamond',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: diamonds.length,
                      itemBuilder: (context, index) {
                        Diamond diamond = diamonds[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 8, left: 15, right: 15),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: _selectedIndex == index ? Colors.blue : Color(0xff22577A),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               
                                SizedBox(height: 5),
                                Text(
                                  '${diamond.jumlahDiamond}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Harga : ${diamond.hargaDiamond.toString()}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
               
              Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xff22577A),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Masukkan Nomor HP Customer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                  controller: noHp,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Nomor HP',
                    hintStyle: TextStyle(color: Colors.white54),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: const Color.fromARGB(255, 255, 255, 255)), // Warna border saat tidak di dalam fokus
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: const Color.fromARGB(255, 249, 255, 249)), // Warna border saat di dalam fokus
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  maxLines: 1,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Nomer hp harus di isi';
                    }
                    return null;
                  },
                ),

                ],
              ),
            ),
                SizedBox(height: 20,),
                Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: ElevatedButton(
              onPressed: () {
                // Tambahkan logika fungsi tombol di sini
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
                    "Beli Sekarang!",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.yellow, // Warna teks kuning
                    ),
                  ),
                ],
              ),
            ),
          ),
                   SizedBox(height: 30,),
              ],
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
      bottomNavigationBar: HomeBottomBar(),
    );
  }
}
