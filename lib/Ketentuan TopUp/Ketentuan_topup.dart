import 'package:flutter/material.dart';



class Ketentuan extends StatelessWidget{
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Ketentuan'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   'Ketentuan dan Syarat',
          //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          // ),
          // SizedBox(height: 8),
          // Text(
          //   'Isi ketentuan dan syarat disini...',
          //   style: TextStyle(fontSize: 16),
          // ),
          SizedBox(height: 16),
          KT_freefire(),
          SizedBox(height: 16),
          KT_Coc(), 
          SizedBox(height: 16),
          KT_Ml(), 
          SizedBox(height: 16),
          KT_Fortnite(),
          SizedBox(height: 16),
          KT_PubgM(),
          SizedBox(height: 16),
          KT_genshin(),
          SizedBox(height: 16),
          KT_Honkai(),
          SizedBox(height: 16),
          KT_Codm(),
          SizedBox(height: 16),
          KT_Aov(),
          SizedBox(height: 16),
          KT_NewS(),
          SizedBox(height: 16),
          KT_Valo(),
          SizedBox(height: 16),
          KT_rolaye(),




          
        ],
      ),
    );
  }
}

// Class KtFFTP dan main() tidak berubah

class KT_freefire extends StatelessWidget {
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
                'Top up Diamong Free Fire',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'GamerStore mempersembahkan penawaran istimewa untuk penawaran sejati untuk para Gamers sejati kami hadir dengan layanan Topup resmi 100% legal untuk Free Fire, Yang dirancang khusus untuk meningkatkan pengalaman bermain game anda. Nikmati kemudahan, keamanan, dan harga yang terjangkau dalam setiap transaksi Top up anda\n\nTop up Free Fire Resmi dan terpercaya.\n\nBerikut adalah langkah-langkah sederhana untuk topup Free Fire: \n\n1.Masukan Data Akun Free Fire (pastikan data yang anda masukan sudah benar dan lengkap)\n2.Pilih nominal Diamond (kami menyediakan berbagai pilihan nominal yang bisa anda sesuaikan dengan kebutuhan)\n3.Pilih metode pembayaran (kenyamanan anda adalah prioritas kami. kami menyediakan berbagai metode pembayaran yang mudah dan aman) \n4.Masukan nomor WhatsApp dan Email yang valid (Dapatkan konfirmasi dan notifikasi langsung ke kontak anda) \n5.Klik order now & lakukan pembayaran (Proses mudah dan cepat, kini anda tinggal selangkah lagi untuk meningkatkan pengalaman gaming anda \n6.Diamond akan masuk otomatis ke akun anda) \n\n GamerStore Sahabat para Gamers!',
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

class KT_Codm extends StatelessWidget {
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
                'Top up CP Call of Duty Mobile',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'GamerStore mempersembahkan penawaran istimewa untuk penawaran sejati untuk para Gamers sejati kami hadir dengan layanan Topup resmi 100% legal untuk  Call Of Duty Mobile , Yang dirancang khusus untuk meningkatkan pengalaman bermain game anda. Nikmati kemudahan, keamanan, dan harga yang terjangkau dalam setiap transaksi Top up anda\n\nTop up  Call Of Duty Mobile Resmi dan terpercaya.\n\nBerikut adalah langkah-langkah sederhana untuk topup  Call Of Duty Mobile : \n\n1.Masukan Data Akun  Call Of Duty Mobile (pastikan data yang anda masukan sudah benar dan lengkap)\n2.Pilih nominal CP (kami menyediakan berbagai pilihan nominal yang bisa anda sesuaikan dengan kebutuhan)\n3.Pilih metode pembayaran (kenyamanan anda adalah prioritas kami. kami menyediakan berbagai metode pembayaran yang mudah dan aman) \n4.Masukan nomor WhatsApp dan Email yang valid (Dapatkan konfirmasi dan notifikasi langsung ke kontak anda) \n5.Klik order now & lakukan pembayaran (Proses mudah dan cepat, kini anda tinggal selangkah lagi untuk meningkatkan pengalaman gaming anda \n6.CP akan masuk otomatis ke akun anda) \n\n GamerStore Sahabat para Gamers!',
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


class KT_rolaye extends StatelessWidget {
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
                'Top up Gems Clash Royale',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'GamerStore mempersembahkan penawaran istimewa untuk penawaran sejati untuk para Gamers sejati kami hadir dengan layanan Topup resmi 100% legal untuk  Clash Royale, Yang dirancang khusus untuk meningkatkan pengalaman bermain game anda. Nikmati kemudahan, keamanan, dan harga yang terjangkau dalam setiap transaksi Top up anda\n\nTop up  Clash Royale Resmi dan terpercaya.\n\nBerikut adalah langkah-langkah sederhana untuk topup  Clash Royale: \n\n1.Masukan Data Akun  Clash Royale (pastikan data yang anda masukan sudah benar dan lengkap)\n2.Pilih nominal Gems (kami menyediakan berbagai pilihan nominal yang bisa anda sesuaikan dengan kebutuhan)\n3.Pilih metode pembayaran (kenyamanan anda adalah prioritas kami. kami menyediakan berbagai metode pembayaran yang mudah dan aman) \n4.Masukan nomor WhatsApp dan Email yang valid (Dapatkan konfirmasi dan notifikasi langsung ke kontak anda) \n5.Klik order now & lakukan pembayaran (Proses mudah dan cepat, kini anda tinggal selangkah lagi untuk meningkatkan pengalaman gaming anda \n6.Gems akan masuk otomatis ke akun anda) \n\n GamerStore Sahabat para Gamers!',
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


//
class KT_Valo extends StatelessWidget {
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
                'Top up Points Valorant',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'GamerStore mempersembahkan penawaran istimewa untuk penawaran sejati untuk para Gamers sejati kami hadir dengan layanan Topup resmi 100% legal untuk Valorant, Yang dirancang khusus untuk meningkatkan pengalaman bermain game anda. Nikmati kemudahan, keamanan, dan harga yang terjangkau dalam setiap transaksi Top up anda\n\nTop up Valorant Resmi dan terpercaya.\n\nBerikut adalah langkah-langkah sederhana untuk topup Valorant: \n\n1.Masukan Data Akun Valorant (pastikan data yang anda masukan sudah benar dan lengkap)\n2.Pilih nominal Points (kami menyediakan berbagai pilihan nominal yang bisa anda sesuaikan dengan kebutuhan)\n3.Pilih metode pembayaran (kenyamanan anda adalah prioritas kami. kami menyediakan berbagai metode pembayaran yang mudah dan aman) \n4.Masukan nomor WhatsApp dan Email yang valid (Dapatkan konfirmasi dan notifikasi langsung ke kontak anda) \n5.Klik order now & lakukan pembayaran (Proses mudah dan cepat, kini anda tinggal selangkah lagi untuk meningkatkan pengalaman gaming anda \n6.Points akan masuk otomatis ke akun anda) \n\n GamerStore Sahabat para Gamers!',
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

class KT_Aov extends StatelessWidget {
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
                'Top up Vouchers Arena of Valor',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'GamerStore mempersembahkan penawaran istimewa untuk penawaran sejati untuk para Gamers sejati kami hadir dengan layanan Topup resmi 100% legal untuk Arena of Valor, Yang dirancang khusus untuk meningkatkan pengalaman bermain game anda. Nikmati kemudahan, keamanan, dan harga yang terjangkau dalam setiap transaksi Top up anda\n\nTop up Arena of Valor Resmi dan terpercaya.\n\nBerikut adalah langkah-langkah sederhana untuk topup Arena of Valor: \n\n1.Masukan Data Akun Arena of Valor(pastikan data yang anda masukan sudah benar dan lengkap)\n2.Pilih nominal Vouchers (kami menyediakan berbagai pilihan nominal yang bisa anda sesuaikan dengan kebutuhan)\n3.Pilih metode pembayaran (kenyamanan anda adalah prioritas kami. kami menyediakan berbagai metode pembayaran yang mudah dan aman) \n4.Masukan nomor WhatsApp dan Email yang valid (Dapatkan konfirmasi dan notifikasi langsung ke kontak anda) \n5.Klik order now & lakukan pembayaran (Proses mudah dan cepat, kini anda tinggal selangkah lagi untuk meningkatkan pengalaman gaming anda \n6.Vouchers akan masuk otomatis ke akun anda) \n\n GamerStore Sahabat para Gamers!',
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

class KT_NewS extends StatelessWidget {
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
                'Top up NC PUBG: New State',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'GamerStore mempersembahkan penawaran istimewa untuk penawaran sejati untuk para Gamers sejati kami hadir dengan layanan Topup resmi 100% legal untuk PUBG: New State, Yang dirancang khusus untuk meningkatkan pengalaman bermain game anda. Nikmati kemudahan, keamanan, dan harga yang terjangkau dalam setiap transaksi Top up anda\n\nTop up PUBG: New State Resmi dan terpercaya.\n\nBerikut adalah langkah-langkah sederhana untuk topup PUBG: New State: \n\n1.Masukan Data Akun PUBG: New State (pastikan data yang anda masukan sudah benar dan lengkap)\n2.Pilih nominal NC (kami menyediakan berbagai pilihan nominal yang bisa anda sesuaikan dengan kebutuhan)\n3.Pilih metode pembayaran (kenyamanan anda adalah prioritas kami. kami menyediakan berbagai metode pembayaran yang mudah dan aman) \n4.Masukan nomor WhatsApp dan Email yang valid (Dapatkan konfirmasi dan notifikasi langsung ke kontak anda) \n5.Klik order now & lakukan pembayaran (Proses mudah dan cepat, kini anda tinggal selangkah lagi untuk meningkatkan pengalaman gaming anda \n6.NC akan masuk otomatis ke akun anda) \n\n GamerStore Sahabat para Gamers!',
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

class KT_Coc extends StatelessWidget {
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
                'Top up Gems Clash Of Clans',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'GamerStore mempersembahkan penawaran istimewa untuk penawaran sejati untuk para Gamers sejati kami hadir dengan layanan Topup resmi 100% legal untuk Clash Of Clans, Yang dirancang khusus untuk meningkatkan pengalaman bermain game anda. Nikmati kemudahan, keamanan, dan harga yang terjangkau dalam setiap transaksi Top up anda\n\nTop up Clash of clans Resmi dan terpercaya.\n\nBerikut adalah langkah-langkah sederhana untuk topup Clash of clans: \n\n1.Masukan Data Akun Clash of Clans (pastikan data yang anda masukan sudah benar dan lengkap)\n2.Pilih nominal Gems (kami menyediakan berbagai pilihan nominal yang bisa anda sesuaikan dengan kebutuhan)\n3.Pilih metode pembayaran (kenyamanan anda adalah prioritas kami. kami menyediakan berbagai metode pembayaran yang mudah dan aman) \n4.Masukan nomor WhatsApp dan Email yang valid (Dapatkan konfirmasi dan notifikasi langsung ke kontak anda) \n5.Klik order now & lakukan pembayaran (Proses mudah dan cepat, kini anda tinggal selangkah lagi untuk meningkatkan pengalaman gaming anda \n6.Gems akan masuk otomatis ke akun anda) \n\n GamerStore Sahabat para Gamers!',
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


class KT_Ml extends StatelessWidget {
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
                'Top up Diamong Mobile Legend Bang Bang',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'GamerStore mempersembahkan penawaran istimewa untuk penawaran sejati untuk para Gamers sejati kami hadir dengan layanan Topup resmi 100% legal untuk Mobile Legend : Bang Bang, Yang dirancang khusus untuk meningkatkan pengalaman bermain game anda. Nikmati kemudahan, keamanan, dan harga yang terjangkau dalam setiap transaksi Top up anda\n\nTop up Mobile Legend : Bang Bang Resmi dan terpercaya.\n\nBerikut adalah langkah-langkah sederhana untuk topup Mobile Legend : Bang Bang: \n\n1.Masukan Data Akun Mobile Legend : Bang Bang (pastikan data yang anda masukan sudah benar dan lengkap)\n2.Pilih nominal Diamond (kami menyediakan berbagai pilihan nominal yang bisa anda sesuaikan dengan kebutuhan)\n3.Pilih metode pembayaran (kenyamanan anda adalah prioritas kami. kami menyediakan berbagai metode pembayaran yang mudah dan aman) \n4.Masukan nomor WhatsApp dan Email yang valid (Dapatkan konfirmasi dan notifikasi langsung ke kontak anda) \n5.Klik order now & lakukan pembayaran (Proses mudah dan cepat, kini anda tinggal selangkah lagi untuk meningkatkan pengalaman gaming anda \n6.Diamond akan masuk otomatis ke akun anda) \n\n GamerStore Sahabat para Gamers!',
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

class KT_genshin extends StatelessWidget {
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
                'Top up Genshin Impact',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'GamerStore mempersembahkan penawaran istimewa untuk penawaran sejati untuk para Gamers sejati kami hadir dengan layanan Topup resmi 100% legal untuk Genshin Impact, Yang dirancang khusus untuk meningkatkan pengalaman bermain game anda. Nikmati kemudahan, keamanan, dan harga yang terjangkau dalam setiap transaksi Top up anda\n\nTop up Genshin Impact Resmi dan terpercaya.\n\nBerikut adalah langkah-langkah sederhana untuk topup Genshin Impact: \n\n1.Masukan Data Akun Genshin Impact(pastikan data yang anda masukan sudah benar dan lengkap)\n2.Pilih nominal GC (kami menyediakan berbagai pilihan nominal yang bisa anda sesuaikan dengan kebutuhan)\n3.Pilih metode pembayaran (kenyamanan anda adalah prioritas kami. kami menyediakan berbagai metode pembayaran yang mudah dan aman) \n4.Masukan nomor WhatsApp dan Email yang valid (Dapatkan konfirmasi dan notifikasi langsung ke kontak anda) \n5.Klik order now & lakukan pembayaran (Proses mudah dan cepat, kini anda tinggal selangkah lagi untuk meningkatkan pengalaman gaming anda \n6.GC akan masuk otomatis ke akun anda) \n\n GamerStore Sahabat para Gamers!',
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

class KT_PubgM extends StatelessWidget {
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
                'Top up PUBG Mobile',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'GamerStore mempersembahkan penawaran istimewa untuk penawaran sejati untuk para Gamers sejati kami hadir dengan layanan Topup resmi 100% legal untuk PUBG Mobile, Yang dirancang khusus untuk meningkatkan pengalaman bermain game anda. Nikmati kemudahan, keamanan, dan harga yang terjangkau dalam setiap transaksi Top up anda\n\nTop up PUBG Mobile Resmi dan terpercaya.\n\nBerikut adalah langkah-langkah sederhana untuk topup PUBG Mobile: \n\n1.Masukan Data Akun PUBG Mobile(pastikan data yang anda masukan sudah benar dan lengkap)\n2.Pilih nominal UC (kami menyediakan berbagai pilihan nominal yang bisa anda sesuaikan dengan kebutuhan)\n3.Pilih metode pembayaran (kenyamanan anda adalah prioritas kami. kami menyediakan berbagai metode pembayaran yang mudah dan aman) \n4.Masukan nomor WhatsApp dan Email yang valid (Dapatkan konfirmasi dan notifikasi langsung ke kontak anda) \n5.Klik order now & lakukan pembayaran (Proses mudah dan cepat, kini anda tinggal selangkah lagi untuk meningkatkan pengalaman gaming anda \n6.UC akan masuk otomatis ke akun anda) \n\n GamerStore Sahabat para Gamers!',
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
class KT_Fortnite extends StatelessWidget {
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
                'Top up FORTNITE',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'GamerStore mempersembahkan penawaran istimewa untuk penawaran sejati untuk para Gamers sejati kami hadir dengan layanan Topup resmi 100% legal untuk Fortnite, Yang dirancang khusus untuk meningkatkan pengalaman bermain game anda. Nikmati kemudahan, keamanan, dan harga yang terjangkau dalam setiap transaksi Top up anda\n\nTop up Fortnite Resmi dan terpercaya.\n\nBerikut adalah langkah-langkah sederhana untuk topup Fortnite: \n\n1.Masukan Data Akun Fortnite(pastikan data yang anda masukan sudah benar dan lengkap)\n2.Pilih nominal V Bucks (kami menyediakan berbagai pilihan nominal yang bisa anda sesuaikan dengan kebutuhan)\n3.Pilih metode pembayaran (kenyamanan anda adalah prioritas kami. kami menyediakan berbagai metode pembayaran yang mudah dan aman) \n4.Masukan nomor WhatsApp dan Email yang valid (Dapatkan konfirmasi dan notifikasi langsung ke kontak anda) \n5.Klik order now & lakukan pembayaran (Proses mudah dan cepat, kini anda tinggal selangkah lagi untuk meningkatkan pengalaman gaming anda \n6.V Bucks akan masuk otomatis ke akun anda) \n\n GamerStore Sahabat para Gamers!',
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
class KT_Honkai extends StatelessWidget {
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
                'Top up Honkai Star Rail',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'GamerStore mempersembahkan penawaran istimewa untuk penawaran sejati untuk para Gamers sejati kami hadir dengan layanan Topup resmi 100% legal untuk Honkai Star Rail, Yang dirancang khusus untuk meningkatkan pengalaman bermain game anda. Nikmati kemudahan, keamanan, dan harga yang terjangkau dalam setiap transaksi Top up anda\n\nTop up Honkai Star Rail Resmi dan terpercaya.\n\nBerikut adalah langkah-langkah sederhana untuk topup Honkai Star Rail: \n\n1.Masukan Data Akun Honkai Star Rail (pastikan data yang anda masukan sudah benar dan lengkap)\n2.Pilih nominal Oneiric Shard (kami menyediakan berbagai pilihan nominal yang bisa anda sesuaikan dengan kebutuhan)\n3.Pilih metode pembayaran (kenyamanan anda adalah prioritas kami. kami menyediakan berbagai metode pembayaran yang mudah dan aman) \n4.Masukan nomor WhatsApp dan Email yang valid (Dapatkan konfirmasi dan notifikasi langsung ke kontak anda) \n5.Klik order now & lakukan pembayaran (Proses mudah dan cepat, kini anda tinggal selangkah lagi untuk meningkatkan pengalaman gaming anda \n6.Oneiric Shard akan masuk otomatis ke akun anda) \n\n GamerStore Sahabat para Gamers!',
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
    home: Ketentuan(),
  ));
}