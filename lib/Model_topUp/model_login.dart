class LoginCust {
  final int id;
  final String nama_lengkap;
  final String email;
  final String no_hp;
  final String alamat;
  final String? foto_user;
  final String created_at;
  final String updated_at;
  final String role;

  LoginCust({
    required this.id,
    required this.nama_lengkap,
    required this.email,
    required this.no_hp,
    required this.alamat,
    this.foto_user,
    required this.created_at,
    required this.updated_at,
    required this.role,
  });

  factory LoginCust.fromJson(Map<String, dynamic> json) {
    return LoginCust(
      id: json['id'],
      nama_lengkap: json['nama_lengkap'],
      email: json['email'],
      no_hp: json['no_hp'],
      alamat: json['alamat'],
      foto_user: json['foto_user'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      role: json['role'],
    );
  }
}
