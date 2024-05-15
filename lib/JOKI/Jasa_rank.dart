import 'dart:convert';
import 'dart:ffi' hide Size;
import 'dart:ui';

// import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:project/Ketentuan%20TopUp/ketentuan%20_joki.dart';
import 'package:project/Model_topUp/Joki_rank.dart';
import 'package:sp_util/sp_util.dart';

class JasaRank extends StatefulWidget {
  const JasaRank({Key? key}) : super(key: key);

  @override
  State<JasaRank> createState() => _JasaRankState();
}

class _JasaRankState extends State<JasaRank> {
  late String valueChoose;
  late Future<List<Datajoki>> _jokiFuture;
  late int _selectedPaketId = 0;

  List<String> listItem = ["Pilih Via Login ", "Moonton(Rekomendasi)", "Vk", "Tiktok", "Facebook"];
  TextEditingController idGame = TextEditingController();
  TextEditingController servergame = TextEditingController();
  TextEditingController email_moonton = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController requestHero = TextEditingController();
  TextEditingController catatan = TextEditingController();
  TextEditingController Nohp = TextEditingController();


  Future<void> sendOrderData() async {
  EasyLoading.show(status: 'Pesanan anda Diproses');
  int userId = SpUtil.getInt('id_user') ?? 0;

  final url = Uri.parse('http://10.0.2.2:8000/api/transactions');
  final Map<String, dynamic> orderData = {
  // 'id': transactionId,
  'id_paket': _selectedPaketId.toString(),
  'login_via': valueChoose.toString(),
  'nickname_ml': idGame.text.toString(),
  'email_no_hp_montonID': email_moonton.text.toString(),
  'password': password.text.toString(),
  'request_hero': requestHero.text.toString(),
  'catatan_penjoki': catatan.text.toString(),
  'metode_pembayaran' : 'ipaymu',
  'bukti_tf' : 'kosong',
  'no_hp': Nohp.text.toString(),
  'status': 'pending',
  'id_user': userId.toString(),
  // 'id_worker': 1,
};
  print('Order Data: $orderData');
  try {
    final response = await http.post(
      url,
      body: orderData,
    );
     print('Response status code: ${response.statusCode}');
    EasyLoading.dismiss();
    if (response.statusCode == 201) {
      print('Transaction stored successfully');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Pemesanan berhasil disimpan'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.of(context).pop();
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
    // Menampilkan snackbar jika terjadi kesalahan saat melakukan pemesanan
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Terjadi kesalahan saat memuat pemesanan'),
        backgroundColor: Colors.red,
      ),
    );
  }
}


Future<void> PopupPemesanan(BuildContext context) async {
  EasyLoading.show(status: 'Memuat Pemesanan');

  String idGames = idGame.text;
  // String server = servergame.text;
  String emailMoonton = email_moonton.text;
  String pw = password.text;
  String Hero = requestHero.text;
  String note = catatan.text;
  String phonenumber = Nohp.text;

  if (idGames.isEmpty || valueChoose == 0 || emailMoonton.isEmpty || pw.isEmpty || Hero.isEmpty || note.isEmpty || phonenumber.isEmpty) {
    EasyLoading.dismiss();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 255, 124, 114),
          title: Text("Peringatan !!"),
          content: Text("Harap Masukan semua informasi yang diperlukan"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            )
          ],
        );
      }
    );
    return;
  }

  EasyLoading.dismiss();
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
            Text(
              "Pastikan data akun Kamu dan produk yang Kamu pilih valid dan sesuai.",
              style: TextStyle(color: Colors.white),
            ),
            Divider(color: const Color.fromARGB(255, 255, 255, 255)),
            Text("Login: ${valueChoose}", style: TextStyle(fontSize: 16, color: Colors.white)),
            SizedBox(height: 7),
            Text("IdGame: ${idGames}", style: TextStyle(fontSize: 16, color: Colors.white)),
            SizedBox(height: 7),
            Text("Email/Moonton: ${emailMoonton}", style: TextStyle(fontSize: 16, color: Colors.white)),
            SizedBox(height: 7),
            Text("Password: ${pw}", style: TextStyle(fontSize: 16, color: Colors.white)),
            SizedBox(height: 7),
            Text("Hero: ${Hero}", style: TextStyle(fontSize: 16, color: Colors.white)),
            SizedBox(height: 7),
            Text("Catatan: ${note}", style: TextStyle(fontSize: 16, color: Colors.white)),
            SizedBox(height: 7),
            Text("Item ID: $_selectedPaketId", style: TextStyle(fontSize: 16, color: Colors.white)),
            SizedBox(height: 7),
            Text("Phone Number: ${phonenumber}", style: TextStyle(fontSize: 16, color: Colors.white)),
            SizedBox(height: 7),
            Text("Product: Mobile Legend Diamond", style: TextStyle(fontSize: 16, color: Colors.white)),
            SizedBox(height: 7),
            Text("Payment: QRIS (All Payment)", style: TextStyle(fontSize: 16, color: Colors.white)),
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
              sendOrderData();
              EasyLoading.show(status: 'Mengirim Pesanan...');
            },
            child: Text("Pesan Sekarang!", style: TextStyle(color: Colors.yellow, fontSize: 18)),
          ),
        ],
      );
    }
  );
}
   
  //=========== Logic Api get data Diamond ============//
Future<List<Datajoki>> fetchJokirank(String datajoki) async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/jokirank?data=$datajoki'));
  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body)['data'];
    return data.map((json) => Datajoki.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load Data joki');
  }
}

  @override
void initState() {
  super.initState();
  valueChoose = listItem[0];
  _jokiFuture = fetchJokirank('Joki Rank');
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffc7f9cc),
      appBar: AppBar(
        title: Text(
          'Joki Rank Mobile Legends',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
        backgroundColor: Color(0xff22577A),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<List<Datajoki>>(
        future: _jokiFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<Datajoki> listJoki = snapshot.data!;
            return ListView(
              children: <Widget>[
                Container(
                  height: 200, 
                  width: double.infinity, 
                  color: Colors.blue,
                  child: Image.asset(
                    'images/Screen_Jokirank.png', 
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
                        'images/Jokirank.png',
                        width: 80, 
                        height: 80,
                      ),
                      SizedBox(width: 16), 
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 1),
                            Text(
                              'Mobile Legend', 
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white, 
                              ),
                            ),
                            SizedBox(height: 1), 
                            Text(
                              'Moonton', 
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
                  margin: EdgeInsets.only(bottom: 10, top: 15, left: 15, right: 15),
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
                          SizedBox(width: 8), // Spasi horizontal antara ikon dan teks
                          Text(
                            'Jaminan Layanan 24 Jam',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      // Baris ketiga
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
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      // Baris keempat
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
                              fontWeight: FontWeight.bold,
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
                    AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.topSlide,
          title: 'Peringatan',
          desc: """Mohon luangkan waktu untuk membaca catatan Informasi sebelum melakukan pemesanan.

Waktu Pengecekan Orderan :
Orderan yang sudah dibayarkan akan kami cek setiap hari mulai pukul 07.00 - 22.00 WIB.
Untuk orderan yang melewati batas waktu pengecekan, akan kami proses pada jam kerja di hari berikutnya.

Berikut Syarat Dan Ketentuan Sebelum Order Jasa Joki :

1. Data Akun : Lengkapi data dengan benar, termasuk kapitalisasi huruf.
2. Pilihan Hero : Minimal tiga pilihan hero, sebagai alternatif jika hero sedang di pick/ban.
3. Verifikasi Akun : Nonaktifkan Untuk Mempermudah Login.
4. Tipe Akun : Utamakan Akun yang dijoki adalah akun utama, bukan akun beli atau bekas GB untuk menghindari BAN.
5. Login Tanpa izin : Berakibat pembatalan joki dan hangusnya pembayaran.
6. Kesabaran: Tunggu sesuai estimasi dan jangan spam chat admin.
7. Masalah Login : Admin/Bot akan menghubungi jika ada kendala.
8. Keterlambatan Proses : Hubungi kami jika belum diproses dalam 1-3 jam.
9. Setelah Joki Selesai : Tetapi belum menerima laporan dari Admin/BOT, jangan di login terlebih dahulu karena ada benefit bonus.
10. Tanggung Jawab Pasca-Joki : Tanggung jawab atas akun berakhir setelah joki selesai.
11. Konfirmasi Selesai : Akan dihubungi oleh Admin/BOT dan Customer Bisa Cek Malalui (Cek Transaksi)

Jika Butuh Bantuan Harap Hubungi Admin Gamestore.ID
Terimakasih""",
          btnOkOnPress: () {},
        ).show();
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10, left: 15, right: 15),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffC7F9CC)),
                      color: Color(0xff22577A),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.warning,
                          color: Color.fromARGB(255, 255, 241, 38),
                        ),
                        SizedBox(width: 20),
                        Text(
                          'informasi sebelum Order jasa Joki',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => KT_JokiRank()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10, left: 15, right: 15),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xff22577A),
                      border: Border.all(color: Color(0xffC7F9CC)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                margin: EdgeInsets.only(bottom: 10, left: 15, right: 15),
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
                      ' Masukan Data Akun Kamu',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'User ID & Nickname',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 9),
                    Container(
                    margin: EdgeInsets.only(bottom: 0),
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
                        hintText: 'Masukan ID Game kamu',
                        hintStyle: TextStyle(color: Colors.white54),
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Harap masukkan ID Game';
                        }
                        return null;
                      },
                    ),
                  ),
                    SizedBox(height: 9),
                    Text(
                      'Server',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 9),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 15),
                      decoration: BoxDecoration(
                        color: Color(0xff22577A),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.white),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: DropdownButton(
                              isExpanded: true,
                              hint: Text("Pilih Server"),
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              ),
                              dropdownColor: Color(0xff22577A),
                              iconSize: 25,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              value: valueChoose,
                              onChanged: (newValue) {
                                setState(() {
                                  valueChoose = newValue.toString();
                                });
                              },
                              items: listItem.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Email/No Hp/Moonton ID',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 9),
                    Container(
                    margin: EdgeInsets.only(bottom: 0),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Color(0xff22577A),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.white),
                    ),
                    child: TextFormField(
                      controller: email_moonton,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Ketikan Email/Moonton ID',
                        hintStyle: TextStyle(color: Colors.white54),
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Harap akun Mobile legend Anda';
                        }
                        return null;
                      },
                    ),
                  ),

                    SizedBox(height: 10),
                    Text(
                      'Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 9),
                    Container(
                      margin: EdgeInsets.only(bottom: 0),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Color(0xff22577A),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.white),
                      ),
                      child: TextFormField(
                        controller: password,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Ketikan Password',
                            hintStyle: TextStyle(color: Colors.white54),
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Harap masukkan password anda';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                    Text(
                      'Request Hero',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 9),
                   Container(
                    margin: EdgeInsets.only(bottom: 0),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Color(0xff22577A),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.white),
                    ),
                    child: TextFormField(
                      controller: requestHero,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Request Hero',
                        hintStyle: TextStyle(color: Colors.white54),
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Harap Request Hero yang anda inginkan';
                        }
                        return null;
                      },
                    ),
                  ),
                      SizedBox(height: 10),
                    Text(
                      'Catatan Untuk Pejoki',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 9),
                    Container(
                      margin: EdgeInsets.only(bottom: 0),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Color(0xff22577A),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.white),
                      ),
                      child: TextFormField(
                        controller: catatan,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Masukan Catatan untuk pejoki',
                          hintStyle: TextStyle(color: Colors.white54),
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Harap masukkan Catatan';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
                Container(
                  margin: EdgeInsets.only(bottom: 8, left: 20, right: 15),
                  child: Text(
                    'List Joki Rank',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: listJoki.length,
                  itemBuilder: (context, index) {
                    Datajoki listjokis = listJoki[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedPaketId = listjokis.id_paket;
                        });
                      },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 8, left: 15, right: 15),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: _selectedPaketId == listjokis.id_paket ? Colors.blue : Color(0xff22577A),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Id Paket : ${listjokis.id_paket}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Nama Paket : ${listjokis.nama_paket}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Rank : ${listjokis.joki_rank}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Harga : ${listjokis.harga_joki}',
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
                SizedBox(height: 20,),
                 Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10, left: 15, right: 15),
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Color(0xff22577A),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.white),
                            ),
                            child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: TextFormField(
                              controller: Nohp,
                              style: TextStyle(color: Colors.white,
                              fontSize: 18,
                              ),
                            decoration: InputDecoration(
                                hintText: 'Masukan Nomer Hp Anda',
                                hintStyle: TextStyle(color: Colors.white54),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 10),
                              ),
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Hanya angka yang diizinkan
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
                      SizedBox(height: 10,),
                          Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: ElevatedButton(
                        onPressed: () {
                          PopupPemesanan(context);
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
            return Center(child: Text('No Data'));
          }
        },
      ),
    );
  }
}
