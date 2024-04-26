import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class lupaPw extends StatefulWidget {
  const lupaPw({Key? key});

  @override
  State<lupaPw> createState() => _lupaPwState();
}

class _lupaPwState extends State<lupaPw> {
  TextEditingController email = TextEditingController();

  reset() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lupa Password"),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromRGBO(34, 87, 122, 1),
              const Color.fromRGBO(76, 175, 80, 1)
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
              ),
              TextField(
                controller: email,
                decoration: InputDecoration(
                  hintText: "Masukkan email anda",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(
                height: 45,
              ),
              ElevatedButton(
                onPressed: () => reset(),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Send Link",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
