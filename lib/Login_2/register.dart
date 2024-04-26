import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
// import 'package:project/Login_2/register_provider.dart';

class Register extends StatefulWidget {
  const Register({Key? key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController namaLengkap = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController noHp = TextEditingController();
  TextEditingController alamat = TextEditingController();
  bool _isObscure = true;

  final _formKey = GlobalKey<FormState>();
  // final RegisterProvider _registerProvider = RegisterProvider();

  Future<void> register() async {
    String namaLengkapValue = namaLengkap.text;
    String emailValue = email.text;
    String passwordValue = password.text;
    String noHpValue = noHp.text;
    String alamatValue = alamat.text;

    var data = {
      'nama_lengkap': namaLengkapValue,
      'email': emailValue,
      'password': passwordValue,
      'no_hp': noHpValue,
      'alamat': alamatValue,
    };

    try {
      EasyLoading.show(status: 'Mendaftarkan Akun...');

      var response = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/register'),
        body: data,
      );
      if (response.statusCode == 201) {
        Get.offAllNamed('/login');
        Get.snackbar('Success', 'Registrasi berhasil',
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        Get.snackbar('Error', 'Registrasi gagal: ${response.reasonPhrase}',
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar('Error', 'Terjadi kesalahan saat registrasi',
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      EasyLoading.dismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daftar Akun Anda")),
      body: Container(
        constraints: BoxConstraints.expand(),
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Center(
                    child: Image.asset(
                      'images/boy_mobile.png',
                      width: 200,
                      height: 200,
                    ),
                  ),
                  SizedBox(height: 55),
                  TextFormField(
                    controller: namaLengkap,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Masukkan Nama Anda';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Masukan Nama Anda",
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Masukkan Email Anda';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Masukan Email Anda",
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: password,
                    obscureText: _isObscure,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Masukkan Password Anda';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Masukkan Password Anda",
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: noHp,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Masukkan No Hp Anda';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Masukkan No Hp Anda",
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: alamat,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Masukkan alamat Anda';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Masukkan Alamat Anda",
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.home),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 50),

                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        register();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Daftar Akun",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
