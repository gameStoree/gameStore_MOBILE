class Datajoki {
  final int id_paket;
  final String nama_paket;
  final String joki_rank;
  final int harga_joki;

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
