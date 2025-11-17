import 'dart:convert';

import 'package:cracked_notes/model/user_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class UserDataRepo {
  late Map<String, dynamic> data;


  Future<Map<String, dynamic>> basicInfo(String username) async{

    Map<String, dynamic> basicInfo = {};

    Uri urlBackend = Uri.parse('${dotenv.env['URL_BACKEND']}/userBasicInfo');

    Map<String, dynamic> body = {"userName": username};

    final httpCalls = [
      http.post(
        urlBackend,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body),
      ),
    ];

    await Future.wait(httpCalls).then((value) async {
      basicInfo = jsonDecode(value[0].body);
    });
    print(basicInfo);

    return basicInfo;

  }

  Future<UserModel> callForInfo(String username) async {
    Uri urlBackend = Uri.parse('${dotenv.env['URL_BACKEND']}/userData');

    Map<String, dynamic> body = {"userName": username};

    final httpCalls = [
      http.post(
        urlBackend,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body),
      ),
    ];

    await Future.wait(httpCalls).then((value) async {
      data = jsonDecode(value[0].body);
    });

    return UserModel.fromJSON(
      data,
    );
  }
}
