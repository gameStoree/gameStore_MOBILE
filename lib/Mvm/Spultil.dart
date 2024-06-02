import 'dart:convert';
// import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class SpUtil {
  static Future<int> getInt(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;
  }
}
