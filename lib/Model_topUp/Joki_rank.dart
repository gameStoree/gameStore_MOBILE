
class Datajoki {
  final int id_paket;
  final String nama_paket;
  final String joki_rank;
  final String harga_joki;

  Datajoki({
    required this.id_paket,
    required this.nama_paket,
    required this.joki_rank,
    required this.harga_joki,
  });

  factory Datajoki.fromJson(Map<String, dynamic> json) {
    return Datajoki(
      id_paket: json['id'],
      nama_paket: json['nama_paket'],
      joki_rank: json['joki_rank'],
      harga_joki: json['harga_joki'],
    );
  }
}


// class Datajoki {
//   final String namaPaket;
//   final int jumlahDiamond;
//   final int hargaDiamond;

//   Datajoki({
//     required this.namaPaket,
//     required this.jumlahDiamond,
//     required this.hargaDiamond,
//   });

//   factory Datajoki.fromJson(Map<String, dynamic> json) {
//     return Datajoki(
//       namaPaket: json['namaPaket'],
//       jumlahDiamond: json['jumlahDiamond'],
//       hargaDiamond: json['hargaDiamond'],
//     );
//   }
// }
