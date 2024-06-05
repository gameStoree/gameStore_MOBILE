class Orderan {
  final String id;
  final String createdAt;

  Orderan({required this.id, required this.createdAt});

  factory Orderan.fromJson(Map<String, dynamic> json) {
    return Orderan(
      id: json['id'].toString(),
      createdAt: json['created_at'],
    );
  }
}
