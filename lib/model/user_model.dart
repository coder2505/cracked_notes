import 'package:cracked_notes/utils/datacleaning_user.dart';

class UserModel {
  final String username, name, ranking, profilepic;
  final Map<String, dynamic> solved, skillStats, submissions, acSubmissions, badges, contests;
  final List<Map<String, dynamic>> languageStats;
  final Map<DateTime, int> calendar;

  factory UserModel.fromJSON(
    Map<String, dynamic> userDetails,
    Map<String,dynamic> calendar,
    Map <String, dynamic> badges,
    Map <String, dynamic> contests,
    submissions,
    acSubmissions,
    solved,
    skillStats,
    languageStats
  ) {

    return UserModel(
      username: userDetails["username"],
      profilepic: userDetails["avatar"],
      name: userDetails["name"],
      ranking: userDetails["ranking"].toString(),
      calendar: DataCleaningUser.formatCalendar(calendar),
      solved: solved,
      skillStats: skillStats,
      submissions: submissions,
      acSubmissions : acSubmissions,
      languageStats: DataCleaningUser.cleanLanguageStats(languageStats),
      badges: badges,
      contests: contests,
    );
  }

  UserModel({
    required this.username,
    required this.profilepic,
    required this.name,
    required this.ranking,
    required this.calendar,
    required this.solved,
    required this.skillStats,
    required this.submissions,
    required this.acSubmissions,
    required this.languageStats,
    required this.badges,
    required this.contests
  });
}
