import 'dart:convert'; // Import library untuk mengakses json.decode
import 'package:flutter/material.dart';
import 'package:project/Mvm/Spultil.dart';
import 'package:project/ipconfig.dart';
import 'package:http/http.dart' as http;

class DisplayUploadedPhoto extends StatefulWidget {
  @override
  _DisplayUploadedPhotoState createState() => _DisplayUploadedPhotoState();
}

class _DisplayUploadedPhotoState extends State<DisplayUploadedPhoto> {
  String imageUrl = '';

  @override
  void initState() {
    super.initState();
    loadPhoto();
  }

  Future<void> loadPhoto() async {
    int userId = await SpUtil.getInt('id_user') ?? 0;
    if (userId != 0) {
      // String apiUrl = 'http://10.0.2.2:8000/api/upload-photo/$userId';
      String apiUrl = '${Ipconfig.baseUrl}/upload-photo/$userId';
      http.Response response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        // Ubah response.body menjadi objek JSON
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        
        // Akses properti 'file' dari objek JSON
        String fileUrl = jsonResponse['file'];

        setState(() {
          imageUrl = fileUrl;
        });
      } else {
        print('Failed to load photo');
      }
    } else {
      print('User ID is empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uploaded Photo'),
      ),
      body: Center(
        child: imageUrl.isNotEmpty
            ? Image.network(
                'http://alamat-server-anda/storage/$imageUrl',
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                          : null,
                    );
                  }
                },
                errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                  return Text('Error loading image');
                },
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
