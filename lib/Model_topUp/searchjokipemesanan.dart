class Pemesanan {
  final int id;
  final int? idPaket;
  final int jumlahbintang;
  final int hargaKeseluruhan;
  final String? loginVia;
  final String? idserver;
  final String? emailNoHpMontonID;
  final String? password;
  final String? requestHero;
  final String? catatanPenjoki;
  final String? noHp;
  final String? status;
  final int idUser;
  final int? idWorker;
  final String? namaPaket;
  final String? namaUser;
  final String? namaWorker;
  final String? rank_joki;
  final String? harga_joki;
  final String? createtgl;

  Pemesanan({
    required this.id,
    this.idPaket,
    required this.jumlahbintang,
    required this.hargaKeseluruhan,
    this.loginVia,
    this.idserver,
    this.emailNoHpMontonID,
    this.password,
    this.requestHero,
    this.catatanPenjoki,
    this.noHp,
    this.status,
    required this.idUser,
    this.idWorker,
    this.namaPaket,
    this.namaUser,
    this.namaWorker,
    this.harga_joki,
    this.rank_joki,
    this.createtgl,
  });

  factory Pemesanan.fromJson(Map<String, dynamic> json) {
    return Pemesanan(
      id: json['id'],
      idPaket: json['id_paket'],
      jumlahbintang: json['jumlah_bintang'],
      hargaKeseluruhan: json ['harga_keseluruhan'],
      loginVia: json['login_via'],
      idserver: json['id_server'],
      emailNoHpMontonID: json['email_no_hp_montonID'],
      password: json['password'],
      requestHero: json['request_hero'],
      catatanPenjoki: json['catatan_penjoki'],
      noHp: json['no_hp'],
      status: json['status'],
      idUser: json['id_user'],
      idWorker: json['id_worker'],
      namaPaket: json['nama_paket'],
      namaUser: json['nama_user'],
      namaWorker: json['nama_worker'],
      rank_joki: json ['joki_rank'],
      harga_joki: json ['harga_joki'],
      createtgl: json ['created_at'],
    );
  }
}