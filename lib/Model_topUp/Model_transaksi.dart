// Future<void> sendOrderData() async {
//   final url = Uri.parse('http://10.0.2.2:8000/api/transaksi-ipaymu');

//   // Data pemesanan yang akan dikirim
//   final Map<String, dynamic> orderData = {
//     'id_paket': idGame.text,
//     'login_via': valueChoose,
//     'nickname_ml': idGame.text, // Sesuaikan dengan data yang sesuai
//     'email_no_hp_montonID': email_moonton.text, // Sesuaikan dengan data yang sesuai
//     'password': password.text, // Sesuaikan dengan data yang sesuai
//     'request_hero': requestHero.text, // Sesuaikan dengan data yang sesuai
//     'catatan_penjoki': catatan.text, // Sesuaikan dengan data yang sesuai
//     'metode_pembayaran': 'ipaymu', // Sesuaikan dengan metode pembayaran yang dipilih
//     'no_hp': Nohp.text, // Sesuaikan dengan data yang sesuai
//     'status': 'pending', // Sesuaikan dengan status awal pemesanan
//     'bukti_tf': null, // Kosongkan karena pembayaran akan dilakukan melalui IPaymu
//     'id_user': '1', // Sesuaikan dengan ID pengguna yang benar
//     'id_worker': '1', // Sesuaikan dengan ID pekerja yang benar
//   };

//   try {
//     final response = await http.post(
//       url,
//       body: orderData,
//     );

//     if (response.statusCode == 201) {
//       // Pemesanan berhasil disimpan di backend
//       // Tampilkan pesan sukses atau lakukan navigasi ke layar sukses
//       print('Transaction stored successfully');
//       // Tambahkan logika navigasi atau tampilan sukses di sini
//     } else {
//       // Gagal menyimpan pemesanan di backend
//       // Tampilkan pesan kesalahan atau lakukan penanganan kesalahan yang sesuai
//       print('Failed to store transaction');
//       // Tambahkan logika menampilkan pesan kesalahan di sini
//     }
//   } catch (error) {
//     // Tangani kesalahan yang terjadi selama proses pengiriman
//     print('Error: $error');
//     // Tambahkan logika penanganan kesalahan di sini
//   }
// }