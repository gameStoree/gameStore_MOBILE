class Pemesanandiamond {
  String? id;
  String? idServer;
  String? noHp;
  String? status;
  int? hargaKeseluruhan;
  int? idDiamond;
  int? idUser;
  String? createdAt;
  String? updatedAt;
  String? jumlahDiamond;
  int? hargaDiamond;
  String? namaGame;
  String? posterGame;

  Pemesanandiamond({
    this.id,
    this.idServer,
    this.noHp,
    this.status,
    this.hargaKeseluruhan,
    this.idDiamond,
    this.idUser,
    this.createdAt,
    this.updatedAt,
    this.jumlahDiamond,
    this.hargaDiamond,
    this.namaGame,
    this.posterGame,
  });

  factory Pemesanandiamond.fromJson(Map<String, dynamic> json) {
    return Pemesanandiamond(
      id: json['id'],
      idServer: json['id_server'],
      noHp: json['no_hp'],
      status: json['status'],
      hargaKeseluruhan: json['harga_keseluruhan'],
      idDiamond: json['id_diamond'],
      idUser: json['id_user'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      jumlahDiamond: json['jumlah_diamond'],
      hargaDiamond: json['harga_diamond'],
      namaGame: json['nama_game'],
      posterGame: json['poster_game'],
    );
  }
}