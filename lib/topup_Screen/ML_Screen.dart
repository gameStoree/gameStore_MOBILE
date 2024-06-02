import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:project/Form%20Pemesanan/pemesananDiamond.dart';
import 'package:project/Ketentuan%20TopUp/Ketentuan_topup.dart';
import 'package:project/Model_topUp/Diamond_model.dart';
import 'package:project/widgets/home_buttom.dart';
import 'package:http/http.dart' as http;
import 'package:sp_util/sp_util.dart';


  class MlScreen extends StatefulWidget {
  const MlScreen({Key? key}) : super(key: key);

  @override
  State<MlScreen> createState() => _MLScreenState();
}

class _MLScreenState extends State<MlScreen> {
  TextEditingController idGame = TextEditingController();
  TextEditingController servergame = TextEditingController();
  TextEditingController noHp = TextEditingController();

  late int _selectedDiamond = -1;
  late Future<List<Diamond>> _diamondsFuture;
  String result = '';
  int totalHarga = 0;

  void totalHargadiamond() {
  if (_selectedDiamond != -1) {
    _diamondsFuture.then((diamondList) {
      Diamond selectedDiamond = diamondList.firstWhere((diamond) => diamond.id == _selectedDiamond);
      setState(() {
        totalHarga = selectedDiamond.hargaDiamond;
      });
    });
  }
}

Future<void> memuatpesanan(BuildContext context) async {
    EasyLoading.show(status: 'Pesanan anda Diproses');
    int? userId = await SpUtil.getInt('id_user');
    String idGameText = idGame.text;
    String serverGameText = servergame.text;
    String noHpText = noHp.text;

    if (idGameText.isEmpty || serverGameText.isEmpty || _selectedDiamond == 0 || noHpText.isEmpty) {
      EasyLoading.dismiss();
      print('Mohon lengkapi semua field sebelum melakukan pemesanan.');
      return;
    }
    String combinedIdGame = '$idGameText $serverGameText';
    print("Nilai combinedIdGame: $combinedIdGame");
    final url = Uri.parse('http://10.0.2.2:8000/api/pemesanan-diamond');
    final Map<String, dynamic> PesananOrder = {
      'id_server': combinedIdGame,
      'id_diamond': _selectedDiamond.toString(),
      'no_hp': noHpText.toString(),
      'harga_keseluruhan': totalHarga.toString(),
      'status': 'unpaid',
      'id_user': userId.toString(),
    };
    print('pemesanan : $PesananOrder');

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json"
        },
        body: jsonEncode(PesananOrder),
      );
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      EasyLoading.dismiss();

      if (response.statusCode == 201) {
        final responseData = json.decode(response.body);
        print('Response data: $responseData');
        final latestOrderUrl = Uri.parse('http://10.0.2.2:8000/api/pemesanan-dm-terbaru/$userId');
        final latestOrderResponse = await http.get(latestOrderUrl);
        print('Latest order response status code: ${latestOrderResponse.statusCode}');
        print('Latest order response body: ${latestOrderResponse.body}');
        if (latestOrderResponse.statusCode == 200) {
          final latestOrderData = json.decode(latestOrderResponse.body);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Pemesanan berhasil disimpan.'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => OrderDiamondPage(orderData: latestOrderData),
            ),
          );
        } else {
          print('Failed to fetch latest order data: ${latestOrderResponse.statusCode}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Gagal mendapatkan data pemesanan terbaru.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        print('Failed to store transaction');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Gagal menyimpan pemesanan'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (error) {
      EasyLoading.dismiss();
      print('Error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Terjadi kesalahan saat memuat pemesanan: $error'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }


    //====== Logic Search Id Game Mobile legend ======//
Future<void> searchIdGame() async {
  String idMl = idGame.text;
  String server = servergame.text;
  String phonenumber = noHp.text;
  
  if (idMl.isEmpty || server.isEmpty || phonenumber.isEmpty || _selectedDiamond == -1) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 255, 124, 114), 
          title: Text("Peringatan !!"),
          content: Text("Harap Masukan semuah informasi yang diperlukan"),
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
    return;
  }
  EasyLoading.show(status: 'Memuat Pemesanan');

  final response = await http.get(
    Uri.parse('https://api.isan.eu.org/nickname/ml?id=$idMl&zone=$server'),
  );

  if (response.statusCode == 200) {
    EasyLoading.dismiss();
    final jsonResponse = json.decode(response.body);
    int id = jsonResponse['id'];
    int zoneId = jsonResponse['zoneId'];
    String name = jsonResponse['name'];

    setState(() {
      result = 'ID:  $id\nServer:  $zoneId\nNickname: $name';
    });

    totalHargadiamond();
    await Future.delayed(Duration(milliseconds: 500));
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xff22577A),
          title: Text("Buat Pemesanan", style: TextStyle(color: Colors.white)),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Pastikan data akun Kamu dan produk yang Kamu pilih valid dan sesuai.", style: TextStyle(color: Colors.white)),
              Divider(color: const Color.fromARGB(255, 255, 255, 255)),
              Text(result, style: TextStyle(fontSize: 16, color: Colors.white)),
              Text("Item ID:  $_selectedDiamond", style: TextStyle(fontSize: 16, color: Colors.white)),
              Text("Total Harga: Rp $totalHarga", style: TextStyle(fontSize: 16, color: Colors.white)),
              Text("Phone Number: ${noHp.text}", style: TextStyle(fontSize: 16, color: Colors.white)),
              Text("Product: Mobile Legend Diamond", style: TextStyle(fontSize: 16, color: Colors.white)),
              Divider(color: const Color.fromARGB(255, 255, 255, 255)),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Batalkan", style: TextStyle(color: Colors.red, fontSize: 18)),
            ),
            TextButton(
              onPressed: () {
                memuatpesanan(context);
              },
              child: Text("Pesan Sekarang!", style: TextStyle(color: Colors.yellow, fontSize: 18)),
            ),
          ],
        );
      },
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('ID game dan server tidak ditemukan.'),
        backgroundColor: Colors.red,
      ),
    );
    EasyLoading.dismiss();
    print('Failed to load data: ${response.statusCode}');
  }
}



    //======= logic api get data diamond =======//

Future<List<Diamond>> fetchDiamonds(String gameName) async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/diamonds/$gameName'));
  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body)['data'];
    return data.map((json) => Diamond.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load diamonds');
  }
}

  @override  
   void initState() {
    super.initState();
     _diamondsFuture = fetchDiamonds('Mobile Legend');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffc7f9cc),
      appBar: AppBar( 
        title: Text(
          'Top Up Mobile legend',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
       backgroundColor: Color(0xff22577A),
        leading: IconButton( 
          icon: Icon(Icons.arrow_back,
          color: Colors.white,),
          
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
     body: _diamondsFuture == null
        ? Center(child: CircularProgressIndicator())
        : FutureBuilder<List<Diamond>>(
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
                    'images/wl_topup_ml.png', 
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
                        'images/label_ml.png',
                        width: 80, 
                        height: 80,
                      ),
                      SizedBox(width: 16), 
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Mobile Legend Bang Bang', 
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white, 
                              ),
                            ),
                            SizedBox(height: 1), 
                            Text(
                              'Montoon', 
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
                  margin: EdgeInsets.only(bottom: 8, top: 15, left: 15, right: 15), 
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
                            '1.  Masukan Data Akun Kamu',
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
                          child: TextFormField(
                            controller: idGame,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Ketikan ID Game kamu',
                              hintStyle: TextStyle(color: Colors.white54),
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'ID Game harus diisi';
                              }
                              return null;
                            },
                          ),
                        ),
                          SizedBox(height: 15), 
                          Text(
                            'Server Game',
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
                            child: TextFormField(
                            controller: servergame,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              // labelText: 'Server',
                              hintText: 'Ketikan Server Game kamu',
                              hintStyle: TextStyle(color: Colors.white54),
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Server Game harus diisi';
                              }
                              return null;
                            },
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
                              _selectedDiamond = diamond.id;
                              // _selectedDiamondJumlah = diamond.jumlahDiamond;
                              // _selectedDiamondHarga = diamond.hargaDiamond.toString();
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 8, left: 15, right: 15),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: _selectedDiamond == diamond.id ? Colors.blue : Color(0xff22577A),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 SizedBox(height: 5),
                                Text(
                                  'ID Diamond :  ${diamond.id}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Jumlah :  ${diamond.jumlahDiamond}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Harga : Rp ${diamond.hargaDiamond}',
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
                SizedBox(height:3),
              Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10, left: 15, right: 15),
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Color(0xff22577A),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Padding(
                   padding: const EdgeInsets.all(2.0),
                  child: TextFormField(
                    controller: noHp,
                    style: TextStyle(color: Colors.white,
                    fontSize: 18,
                    ),
                   decoration: InputDecoration(
                      hintText: 'Masukan Nomer Hp Anda',
                      hintStyle: TextStyle(color: Colors.white54),
                       border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10),
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Harap masukkan Hp Anda';
                      }
                      return null;
                    },
                  ),
              ),
           ),
        ],
  ),
        ),
            ],
              ),
                SizedBox(height: 20,),
                Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: ElevatedButton(
              onPressed: () {
               searchIdGame();
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
      bottomNavigationBar: HomeBottomBar() ,
    );
  
  }
  
}
