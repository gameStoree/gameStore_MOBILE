import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ImagePage extends StatefulWidget {
  final int pemesananId;

  ImagePage({required this.pemesananId});

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  List<String> images = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchImages();
  }

  Future<void> fetchImages() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'no images found') {
        setState(() {
          images = [];
          isLoading = false;
        });
      } else {
        setState(() {
          images = List<String>.from(data['images']);
          isLoading = false;
        });
      }
    } else {
      setState(() {
        isLoading = false;
      });
      // Handle error
      print('Failed to load images');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Images'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : images.isEmpty
              ? Center(child: Text('No images found'))
              : ListView.builder(
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Image.network('http://your-storage-url/' + images[index]);
                  },
                ),
    );
  }
}
