import 'package:flutter/material.dart';
import 'package:project/Ketentuan%20TopUp/ketentuan%20_joki.dart';
import 'package:awesome_dialog/awesome_dialog.dart';


class JasaMCL extends StatefulWidget {
  const JasaMCL({super.key});

  @override
  State<JasaMCL> createState() => _JasaMCLState();
}

class _JasaMCLState extends State<JasaMCL> {


  late String valueChoose;
  List<String> listItem = ["Pilih Via Login ", "Moonton(Rekomendasi)", "Vk", "Tiktok", "Facrbook"];

  @override
  void initState() {
    super.initState();
    valueChoose = listItem[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Joki MCL Mobile Legends',
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
      body: ListView(
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.blue,
            child: Image.asset(
              'images/Screen_Jokimcl.png',
              fit: BoxFit.cover,
            ),
          ),
          // Bagian bawah berisi teks
          Container(
            padding: EdgeInsets.all(16),
            color: Color(0xff22577A),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  'images/Jokimcl.png',
                  width: 80,
                  height: 80,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Joki MCL',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 1),
                      // Teks "Moonton"
                      Text(
                        'Mobile Legend Bang Bang',
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
            margin: EdgeInsets.only(bottom: 20, top: 20, left: 20, right: 20),
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
        margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffC7F9CC)),
          color: Color(0xff22577A),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.warning,
              color: Color.fromARGB(255, 255, 241, 38),
            ),
            SizedBox(width: 10,),
            Text(
              'informasi sebelum Order jasa Joki',
              style: TextStyle(
                
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            SizedBox(width: 20,),
            
          ],
        ),
      ),
      ),


          // Car tata cara dan ketentuan
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KT_JokiMCL()),
              );
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
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
        ],
      ),
    );
  }
}