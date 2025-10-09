import 'dart:convert';

import 'package:cracked_notes/repositories/secure_storage_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class UserAuthRepository {
  Future<bool> userSignup(String email, String password) async {
    try {
      final res = await http.post(
        Uri.parse(dotenv.env['SIGNUP_STRING']!),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{
          "username": email,
          "password": password,
        }),
      );

      Map<String, dynamic> json = jsonDecode(res.body) as Map<String, dynamic>;

      if (res.statusCode == 201) {
        SecureStorageService.write(dotenv.env['TOKEN']!, json["token"]);
        return true;
      } else {
        debugPrint(json["desc"]);
      }
      return false;
    } catch (e) {
      throw Exception(e);
    }
  }
}
