import 'package:flutter/material.dart';

class JasaMontage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text('Halaman Jasa Vidio Montage'),
      ),
      body: Center(
        child: Container(
          child: Text(
            'Montage',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}