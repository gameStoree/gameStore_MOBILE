import 'package:flutter/material.dart';

class JasaMabar extends StatefulWidget {
  const JasaMabar({super.key});

  @override
  State<JasaMabar> createState() => _JasamabarState();
}

class _JasamabarState extends State<JasaMabar> {
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text('Halaman Jasa Main Bareng'), // Judul halaman
      ),
      body: Center(
        child: Container(
          child: Text(
            'Mabar ', 
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