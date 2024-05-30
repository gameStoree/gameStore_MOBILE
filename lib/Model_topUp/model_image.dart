

class UserPhoto {
  final String photoUrl;

  UserPhoto({required this.photoUrl});

  factory UserPhoto.fromJson(Map<String, dynamic> json) {
    return UserPhoto(
      photoUrl: json['photo_url'],
    );
  }
}

