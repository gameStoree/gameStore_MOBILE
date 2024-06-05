class pemesananDiamond {
  final String id;
  final String id_server;
  final String no_hp;
  final String status;
  final int id_diamond;
  final int id_user;
  final String createdAt;

  pemesananDiamond({
    required this.id,
    required this.id_server,
    required this.no_hp,
    required this.status,
    required this.id_diamond,
    required this.id_user,
    required this.createdAt,
  });

  factory pemesananDiamond.fromJson(Map<String, dynamic> json) {
    return pemesananDiamond(
      id: json['id'],
      id_server: json['id_server'],
      no_hp: json['no_hp'],
      status: json['status'],
      id_diamond: json['id_diamond'],
      id_user: json['id_user'],
      createdAt: json['created_at'],
    );
  }
}
