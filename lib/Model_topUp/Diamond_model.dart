class Diamond {
  final int id;
  final int namaGame;
  final String jumlahDiamond;
  final int hargaDiamond;

  Diamond({
    required this.id,
    required this.namaGame,
    required this.jumlahDiamond,
    required this.hargaDiamond,
  });

  factory Diamond.fromJson(Map<String, dynamic> json) {
    return Diamond(
      id: json['id'],
      namaGame: json['nama_game'],
      jumlahDiamond: json['jumlah_diamond'],
      hargaDiamond: json['harga_diamond'],
    );
  }
}
