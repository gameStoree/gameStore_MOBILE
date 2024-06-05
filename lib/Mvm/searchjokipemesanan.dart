class Paket {
  final int id;
  final String namaPaket;
  final String jokiRank;
  final int hargaJoki;
  final String createdAt;
  final String updatedAt;

  Paket({
    required this.id,
    required this.namaPaket,
    required this.jokiRank,
    required this.hargaJoki,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Paket.fromJson(Map<String, dynamic> json) {
    return Paket(
      id: json['id'],
      namaPaket: json['nama_paket'],
      jokiRank: json['joki_rank'],
      hargaJoki: json['harga_joki'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Pemesanan {
  final String id;
  final int? idPaket;
  final int jumlahBintang;
  final int hargaKeseluruhan;
  final String? loginVia;
  final String? idServer;
  final String? emailNoHpMontonID;
  final String password;
  final String? requestHero;
  final String? catatanPenjoki;
  final String? noHp;
  final String? status;
  final int idUser;
  final int? idWorker;
  final String? ssHasilJoki;
  final String? createdAt;
  final String? updatedAt;

  Pemesanan({
    required this.id,
    this.idPaket,
    required this.jumlahBintang,
    required this.hargaKeseluruhan,
    this.loginVia,
    this.idServer,
    this.emailNoHpMontonID,
    required this.password,
    this.requestHero,
    this.catatanPenjoki,
    this.noHp,
    this.status,
    required this.idUser,
    this.idWorker,
    this.ssHasilJoki,
    this.createdAt,
    this.updatedAt,
  });

  factory Pemesanan.fromJson(Map<String, dynamic> json) {
    return Pemesanan(
      id: json['id'] ?? '',
      idPaket: json['id_paket'],
      jumlahBintang: json['jumlah_bintang'] ?? 0,
      hargaKeseluruhan: json['harga_keseluruhan'] ?? 0,
      loginVia: json['login_via'],
      idServer: json['Id_Server'],
      emailNoHpMontonID: json['email_no_hp_montonID'],
      password: json['password'] ?? '',
      requestHero: json['request_hero'],
      catatanPenjoki: json['catatan_penjoki'],
      noHp: json['no_hp'],
      status: json['status'],
      idUser: json['id_user'] ?? 0,
      idWorker: json['id_worker'],
      ssHasilJoki: json['ss_hasilJoki'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
