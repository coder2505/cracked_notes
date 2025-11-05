import 'dart:convert';

import 'package:cracked_notes/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class UserDataRepo {
  late Map<String, dynamic> data,
      calendar,
      solved,
      submissions,
      acSubmissions,
      skillstats,
      languageStats, badges, contest;

  Future<UserModel> callForInfo(String username) async {
    Uri urlUserinfo = Uri.parse('${dotenv.env["BASE_URL"]}/$username');
    Uri urlCalendar = Uri.parse('${dotenv.env["BASE_URL"]}/$username/calendar');
    Uri urlSolved = Uri.parse('${dotenv.env["BASE_URL"]}/$username/solved');
    Uri urlLang = Uri.parse(
      '${dotenv.env["BASE_URL"]}/languageStats?username=$username',
    );
    Uri urlSubmissions = Uri.parse(
      '${dotenv.env["BASE_URL"]}/$username/Submission',
    );
    Uri urlAcSubmissions = Uri.parse(
      '${dotenv.env["BASE_URL"]}/$username/acSubmission',
    );
    Uri urlSkillStats = Uri.parse(
      '${dotenv.env["BASE_URL"]}/skillStats/$username',
    );
    Uri urlbadges = Uri.parse(
      '${dotenv.env["BASE_URL"]}/$username/badges',
    );

    Uri urlContests = Uri.parse(
      '${dotenv.env["BASE_URL"]}/$username/contest',
    );

    final httpCalls = [
      http.get(urlUserinfo).catchError((e) {
        debugPrint("err $e");
        return http.Response("Not Found", 200);
      }),
      http.get(urlCalendar),
      http.get(urlSubmissions),
      http.get(urlSolved),
      http.get(urlSkillStats),
      http.get(urlLang),
      http.get(urlAcSubmissions),
      http.get(urlbadges),
      http.get(urlContests)
    ];

    await Future.wait(httpCalls).then((value) async {
      data = jsonDecode(value[0].body);
      calendar = jsonDecode(value[1].body);
      submissions = jsonDecode(value[2].body);
      solved = jsonDecode(value[3].body);
      skillstats = jsonDecode(value[4].body);
      languageStats = jsonDecode(value[5].body);
      acSubmissions = jsonDecode(value[6].body);
      badges = jsonDecode(value[7].body);
      contest = jsonDecode(value[8].body);
    });

    return UserModel.fromJSON(
      data,
      calendar,
      badges,
      contest,
      submissions,
      acSubmissions,
      solved,
      skillstats,
      languageStats,
    );
  }
}
