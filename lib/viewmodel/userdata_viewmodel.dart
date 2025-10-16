import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class UserDataViewModel {
  late Map<String, dynamic> data, calendar, solved, submissions, skillstats;

  Future<void> callForInfo(String username) async {
    Uri urlUserinfo = Uri.parse('${dotenv.env["BASE_URL"]}/$username');
    Uri urlCalendar = Uri.parse('${dotenv.env["BASE_URL"]}/$username/calendar');
    Uri urlSolved = Uri.parse('${dotenv.env["BASE_URL"]}/$username/submission');
    Uri urlSubmissions = Uri.parse(
      '${dotenv.env["BASE_URL"]}/$username/solved',
    );
    Uri urlSkillStats = Uri.parse(
      '${dotenv.env["BASE_URL"]}/skillStats/$username',
    );

    final httpCalls = [
      http.get(urlUserinfo),
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

  }
}
