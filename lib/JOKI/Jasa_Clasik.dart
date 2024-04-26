import 'package:flutter/material.dart';

class JasaClasik extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text('Halaman Joki Clasik'), // Judul halaman
      ),
      body: Center(
        child: Container(
          child: Text(
            'JOKI Clasik', 
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