import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> uploadPhoto(File imageFile, String token) async {
    if (imageFile == null) {
    return;
  }
  var uri = Uri.parse('http://10.0.2.2:8000/api/upload-photo');
  var request = http.MultipartRequest('POST', uri);

  var image = await http.MultipartFile.fromPath('foto_user', imageFile.path);
  request.files.add(image);
  request.headers['Authorization'] = 'Bearer $token';
  var response = await request.send();
  if (response.statusCode == 200) {
    print('Upload foto berhasil');
  } else {
    print('Upload foto gagal');
  }
}
