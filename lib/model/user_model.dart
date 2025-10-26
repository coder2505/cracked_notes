import 'package:cracked_notes/utils/datacleaning_user.dart';

class UserModel {
  final String username, name, ranking;
  final Map<String, dynamic> solved, skillStats, submissions, acSubmissions;
  final List<Map<String, dynamic>> languageStats;
  final Map<DateTime, int> calendar;

  factory UserModel.fromJSON(
    Map<String, dynamic> userDetails,
    Map<String,dynamic> calendar,
    submissions,
    acSubmissions,
    solved,
    skillStats,
    languageStats
  ) {

    return UserModel(
      username: userDetails["username"],
      name: userDetails["name"],
      ranking: userDetails["ranking"].toString(),
      calendar: DataCleaningUser.formatCalendar(calendar),
      solved: solved,
      skillStats: skillStats,
      submissions: submissions,
      acSubmissions : acSubmissions,
      languageStats: DataCleaningUser.cleanLanguageStats(languageStats),
    );
  }

  UserModel({
    required this.username,
    required this.name,
    required this.ranking,
    required this.calendar,
    required this.solved,
    required this.skillStats,
    required this.submissions,
    required this.acSubmissions,
    required this.languageStats
  });
}
