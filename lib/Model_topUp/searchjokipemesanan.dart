class Pemesanan {
  final int id;
  final int idPaket;
  final String? loginVia;
  final String? nicknameMl;
  final String? emailNoHpMontonID;
  final String? password;
  final String? requestHero;
  final String? catatanPenjoki;
  final String? metodePembayaran;
  final String? buktiTf;
  final String? noHp;
  final String? status;
  final int idUser;
  final int idWorker;
  final String namaPaket;
  final String namaUser;
  final String namaWorker;
  final String rank_joki;
  final String harga_joki;
  final String? createtgl;

  Pemesanan({
    required this.id,
    required this.idPaket,
    this.loginVia,
    this.nicknameMl,
    this.emailNoHpMontonID,
    this.password,
    this.requestHero,
    this.catatanPenjoki,
    this.metodePembayaran,
    this.buktiTf,
    this.noHp,
    this.status,
    required this.idUser,
    required this.idWorker,
    required this.namaPaket,
    required this.namaUser,
    required this.namaWorker,
    required this.harga_joki,
    required this.rank_joki,
    this.createtgl,
  });

  factory Pemesanan.fromJson(Map<String, dynamic> json) {
    return Pemesanan(
      id: json['id'],
      idPaket: json['id_paket'],
      loginVia: json['login_via'],
      nicknameMl: json['nickname_ml'],
      emailNoHpMontonID: json['email_no_hp_montonID'],
      password: json['password'],
      requestHero: json['request_hero'],
      catatanPenjoki: json['catatan_penjoki'],
      metodePembayaran: json['metode_pembayaran'],
      buktiTf: json['bukti_tf'],
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
