import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/Login_2/ResetPw.dart';

class OTPVerificationPage extends StatefulWidget {
  final String email;

  OTPVerificationPage({required this.email});

  @override
  _OTPVerificationPageState createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  final TextEditingController _otpController = TextEditingController();

  Future<void> verifyOTP() async {
    final response = await http.post(
      Uri.parse('http://your-laravel-api-url/api/verify-otp'),
      body: {
        'email': widget.email,
        'otp': _otpController.text,
      },
    );

    if (response.statusCode == 200) {
      // Navigate to password reset page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResetPasswordPage(email: widget.email, otp: _otpController.text)),
      );
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid OTP')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verify OTP')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _otpController,
              decoration: InputDecoration(labelText: 'OTP'),
            ),
            ElevatedButton(
              onPressed: verifyOTP,
              child: Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
