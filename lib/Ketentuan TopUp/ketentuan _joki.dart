import 'package:flutter/material.dart';



class Ketentuan_JOki extends StatelessWidget{
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Ketentuan'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          SizedBox(height: 16),
          KT_JokiRank(),
          SizedBox(height: 16),
          KT_JokiMCL(),

        ],
      ),
    );
  }
}



class KT_JokiRank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff22577A),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop(); // Kembali ke halaman sebelumnya
          },
        ),
        title: Text(
          'Kembali',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 0),
          padding: EdgeInsets.only(left: 30),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              Text(
                'Joki Rank Mobile Legend',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(

                  'Joki Rank Mobile legend dari GameStore: Solusi cepat untuk ' +
                  'Naik Rank !! \n \n'+

                  'Kami mempersembahkan layanan joki mobile legends yang cepat, murah, serta aman dan terpercaya!'+
                  'Tingkatkan permainan dan rank anda denganbantuan dari profesional kami. kami mengutamakan kepuasan dan keamanan akun anda dalam setiap jasa yang kami berikan \n\n'+
                  'Waktu pengecekan Orderan: \n'+
                  'Orderan yang sudah dibayarkan akan kamu cek setiap hari mulai pukul 07:00 - 22:00 WIB.\n'+
                  'Untuk orderan yang melewati batas waktu pengecekan, kami proses pada jam kerja dihari berikutnya. \n\n'+

                  'Berikut adalah langkah - langkah sederhana untuk Order Jasa joki: \n\n'+
                  '1. Lengkapi Data akun joki dengan teliti (Pastikan data yang anda masukkan sudah benar dan lengkap)\n'+
                  '2. Pilih jenis Variant joki (Sesuaikan dengan kebutuhan Anda)\n'+
                  '3. Memasukkan Jumlah Order sesuai tujuan (Pastikan jumlah order sesuai dengan yang anda inginkan dan sesuai dengan S&k GameStore)\n'+
                  '4. Pilih Metode pembayaran (Kenyamanan Anda adalah prioritas kami. kami menyediakan berbagai metode pembayaran yang mudah dan aman)\n'+
                  '5. Masukan nomor WhatsApp dan Email yang valid (Dapatkan konfirmasi dan notifikasi ke kontak Anda)\n'+
                  '6. KLik order Now & lakukan pembayaran (Tunggu konfirmasi dari kami dan orderan anda akan segera diproses)\n\n'+
                  
                  'Estimasi Waktu Proses :\n'+
                  'Kami Berkomitmen untuk menyelesaikan jasa joki anda dalam waktu 12 - 48 jam.\n'+
                  'Waktu penyelesaian dapat bervariasi tergantung pada jumlah dan kompleksitas pesanan.\n'+
                  'Kami berupaya untuk memberikan layanan secepat mungkin\n\n'+
                  
                  'GameStore Sahabat Para Gamers !\n\n',
                  
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



///////////////////////////////////////

class KT_JokiMCL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff22577A),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop(); // Kembali ke halaman sebelumnya
          },
        ),
        title: Text(
          'Kembali',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 0),
          padding: EdgeInsets.only(left: 30),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              Text(
                'JOKI MCL GameStore',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(

                  'Joki MCL Mobile legend dari GameStore: Solusi cepat untuk ' +
                  'Memenangkan MCL !! \n \n'+
                  'Kami mempersembahkan layanan joki mobile legends yang cepat, murah, serta aman dan terpercaya!'+
                  'Tingkatkan permainan dan rank anda denganbantuan dari profesional kami. kami mengutamakan kepuasan dan keamanan akun anda dalam setiap jasa yang kami berikan \n\n'+
                  'Waktu pengecekan Orderan: \n'+
                  'Orderan yang sudah dibayarkan akan kamu cek setiap hari mulai pukul 07:00 - 22:00 WIB.\n'+
                  'Untuk orderan yang melewati batas waktu pengecekan, kami proses pada jam kerja dihari berikutnya. \n\n'+

                  'Berikut adalah langkah - langkah sederhana untuk Order Jasa joki: \n\n'+
                  '1. Lengkapi Data akun joki dengan teliti (Pastikan data yang anda masukkan sudah benar dan lengkap)\n'+
                  '2. Pilih jenis Variant joki (Sesuaikan dengan kebutuhan Anda)\n'+
                  '3. Memasukkan Jumlah Order sesuai tujuan (Pastikan jumlah order sesuai dengan yang anda inginkan dan sesuai dengan S&k GameStore)\n'+
                  '4. Pilih Metode pembayaran (Kenyamanan Anda adalah prioritas kami. kami menyediakan berbagai metode pembayaran yang mudah dan aman)\n'+
                  '5. Masukan nomor WhatsApp dan Email yang valid (Dapatkan konfirmasi dan notifikasi ke kontak Anda)\n'+
                  '6. KLik order Now & lakukan pembayaran (Tunggu konfirmasi dari kami dan orderan anda akan segera diproses)\n\n'+
                  
                  'Estimasi Waktu Proses :\n'+
                  'Saat MCL diMulai\n'+
                  '1. Jadwal Order MCL minggu - Kamis: Orderan yang diterima antara senin hingga kamis akan di proses pada hari sabtu.\n'+
                  '2. Jadwal Order MCL jumat - sabtu: Orderan yang diterima pada hari jumat dan sabtu akan diproses pada minggu berikutnya.\n\n'+
                  
                  'GameStore Sahabat Para Gamers !\n\n',
                  
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}















void main() {
  runApp(MaterialApp(
    home: Ketentuan_JOki(),
  ));
}


