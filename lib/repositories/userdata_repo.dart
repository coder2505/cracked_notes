import 'dart:convert';
import 'package:cracked_notes/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class UserDataRepo {
  late Map<String, dynamic> data, calendar, solved, submissions, skillstats;

  Future<UserModel> callForInfo(String username) async {
    Uri urlUserinfo = Uri.parse('${dotenv.env["BASE_URL"]}/$username');
    Uri urlCalendar = Uri.parse('${dotenv.env["BASE_URL"]}/$username/calendar');
    Uri urlSolved = Uri.parse('${dotenv.env["BASE_URL"]}/$username/solved');
    Uri urlSubmissions = Uri.parse(
      '${dotenv.env["BASE_URL"]}/$username/acSubmission',
    );
    Uri urlSkillStats = Uri.parse(
      '${dotenv.env["BASE_URL"]}/skillStats/$username',
    );

    final httpCalls = [
      http.get(urlUserinfo).catchError((e){
        debugPrint("err $e");
        return http.Response("Not Found", 200);
      }),
      http.get(urlCalendar),
      http.get(urlSubmissions),
      http.get(urlSolved),
      http.get(urlSkillStats),
    ];

    await Future.wait(httpCalls).then((value) async {
      data = jsonDecode(value[0].body);
      calendar = jsonDecode(value[1].body);
      submissions = jsonDecode(value[2].body);
      solved = jsonDecode(value[3].body);
      skillstats = jsonDecode(value[4].body);
    });

     return UserModel.fromJSON(data, calendar, submissions, solved, skillstats);

  }
}
