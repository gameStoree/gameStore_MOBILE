import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:project/Form%20Pemesanan/cekfoto.dart';
import 'package:project/ipconfig.dart';
import 'package:sp_util/sp_util.dart';
import 'package:http/http.dart' as http;
import '../widgets/home_buttom.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:project/Model_topUp/model_image.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String imagePath = '';
  File? _image;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    fetchPhotoUrl();
  }

  void fetchPhotoUrl() async {
    await SpUtil.getInstance();
    int userId = SpUtil.getInt('id_user') ?? 0;
    print('User ID: $userId');

    if (userId != null) {
      final url = '${Ipconfig.baseUrl}/users/$userId/getphoto';
      print('Fetching photo from: $url');

      try {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          setState(() {
            imagePath = data['photo_url'];
          });
          print('Photo URL: $imagePath');
        } else {
          print('Failed  ${response.statusCode}');
          print('Response body: ${response.body}');
        }
      } catch (e) {
        print('Error occurred: $e');
      }
    } else {
      print('User ID not found');
    }
  }

  Future<void> _getImageFromGalleryAndUpload() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      File image = File(pickedImage.path);
      await _uploadImage(image);
    } else {
      print('User canceled image selection');
    }
  }

  Future<void> _uploadImage(File image) async {
    int userId = SpUtil.getInt('id_user') ?? 0;
    print('User ID: $userId');
    final url = '${Ipconfig.baseUrl}/users/$userId/photobn';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files
        .add(await http.MultipartFile.fromPath('foto-user', image.path));

    try {
      final response = await request.send();

      if (response.statusCode == 200) {
        final responseString = await response.stream.bytesToString();
        final responseData = json.decode(responseString);
        String imagePath = responseData['path'];
        print('Image uploaded successfully. Image path: $imagePath');
      } else {
        print('Failed to upload image. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred during image upload: $e');
    }
  }

// Future<void> takePhoto() async {
//   final ImagePicker picker = ImagePicker();
//   final XFile? takenImage = await picker.pickImage(
//     source: ImageSource.camera,
//   );
//   if (takenImage != null) {
//     setState(() {
//       image = File(takenImage.path);
//     });
//     await uploadPhoto(image);
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff22577A),
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
                               colors: [
  const Color(0xFF34A0A4),
  const Color(0xFF184E77),
],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        child: Wrap(
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.photo_library),
                              title: Text('Ambil foto dari galeri'),
                              onTap: () {
                                Navigator.pop(context);
                                _getImageFromGalleryAndUpload();
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.camera_alt),
                              title: Text('Ambil foto menggunakan kamera'),
                              onTap: () {
                                Navigator.pop(context);
                                // takePhoto();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  width: 110,
                  height: 120,
                  margin: EdgeInsets.only(top: 50),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: imagePath == null
                      ? CircularProgressIndicator()
                      : Image.network(
                          imagePath,
                          fit: BoxFit.cover,
                          width: 110,
                          height: 120,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return Text('');
                          },
                        ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${SpUtil.getString("nama_lengkap")}",
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.edit_square,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(height: 3),
                    Text(
                      "${SpUtil.getString("email")}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                   // Navigasi ke halaman DisplayUploadedPhoto saat container diklik
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DisplayUploadedPhoto()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 20, left: 60, right: 60),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xff34A0A4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Lihat Riwayat pembelian',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.arrow_right_alt,
                        color: Colors.white,
                        size: 38,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Informasi Akun',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                height: 1,
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 20),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   // context,
                  //   // MaterialPageRoute(builder: (context) => KT_JokiRank()),
                  // );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10, left: 10),
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 25,
                      ),
                      SizedBox(width: 40),
                      Text(
                        'Username: ${SpUtil.getString("nama_lengkap")}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 1,
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 20),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   // context,
                  //   // MaterialPageRoute(builder: (context) => KT_JokiRank()),
                  // );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10, left: 10),
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        Icons.email,
                        color: Colors.white,
                        size: 25,
                      ),
                      SizedBox(width: 40),
                      Text(
                        'Email: ${SpUtil.getString("email")}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 1,
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 20),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   // context,
                  //   // MaterialPageRoute(builder: (context) => KT_JokiRank()),
                  // );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10, left: 10),
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 25,
                      ),
                      SizedBox(width: 40),
                      Text(
                        'Alamat: ${SpUtil.getString("alamat")}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 1,
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 20),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   // context,
                  //   // MaterialPageRoute(builder: (context) => KT_JokiRank()),
                  // );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10, left: 10),
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 25,
                      ),
                      SizedBox(width: 40),
                      Text(
                        'No Hp: ${SpUtil.getString("no_hp")}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 1,
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 20),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   // context,
                  //   // MaterialPageRoute(builder: (context) => KT_JokiRank()),
                  // );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10, left: 10),
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        Icons.lock,
                        color: Colors.white,
                        size: 25,
                      ),
                      SizedBox(width: 40),
                      Text(
                        ' ********',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 1,
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 20),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: HomeBottomBar(),
    );
  }
}
