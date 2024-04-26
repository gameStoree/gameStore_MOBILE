import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:project/Login_2/Login_provider.dart';
import 'package:project/Login_2/lupaPw.dart';
import 'package:project/Login_2/register.dart';
import 'package:project/screens/home.dart';
import 'package:sp_util/sp_util.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();

  void auth() async {
  String txtemail = email.text;
  String txtpw = password.text;
  if (txtemail.isEmpty || txtpw.isEmpty) {
    Get.snackbar(
      "Error", "Email dan password tidak boleh kosong",
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  } else {
    EasyLoading.show();
    var data = {
      "email": txtemail,
      "password" : txtpw,
    };
    try {
      var response = await LoginProvider().PostUser(data);
      EasyLoading.dismiss();
      if (response.statusCode == 200) {
         var responseBody = response.body;
    var userData = responseBody['user'];
    var email = userData['email'];
    var nama_lengkap = userData['nama_lengkap'];
    var alamat = userData['alamat'];
    // var foto = userData['foto_user'];
    var token = responseBody['token'];
    SpUtil.putString('email', email);
    SpUtil.putString('nama_lengkap', nama_lengkap);
    SpUtil.putString('token', token);
    SpUtil.putString('alamat', alamat);
    // SpUtil.putString('foto_user', foto);
    Get.offAllNamed('/home');
        
        Get.snackbar(
          "Success", "Login berhasil",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          "Error", "Login Gagal",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      EasyLoading.dismiss();
      print(e);
      Get.snackbar(
        "Error", "Terjadi kesalahan",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
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
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'GamerStore.Id',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: Image.asset(
                      'images/LOGOID.png',
                      width: 200,
                      height: 200,
                    ),
                  ),
                  SizedBox(height: 80),
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      hintText: "Masukkan email Anda",
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email harus diisi';
                      }
                      if (!value.contains('@')) {
                        return 'Email tidak valid';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: password,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      hintText: "Masukkan Password Anda",
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                            _isObscure ? Icons.visibility : Icons.visibility_off),
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password harus diisi';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Get.to(Register()),
                        child: Text(
                          'Register Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.to(lupaPw()),
                        child: Text(
                          'Lupa Password',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        auth();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Login",
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
