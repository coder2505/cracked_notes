import 'package:cracked_notes/utils/datacleaning_user.dart';

class UserModel {
  final String username, name, ranking, profilepic;
  final Map<String, dynamic> solved, skillStats, submissions, acSubmissions, badges, contests;
  final List<Map<String, dynamic>> languageStats;
  final Map<DateTime, int> calendar;

  factory UserModel.fromJSON(
      Map<String, dynamic> userDetails
      ) {

    return UserModel(
      username: userDetails["userName"]["username"],
      profilepic: userDetails["userName"]["avatar"],
      name: userDetails["userName"]["name"],
      ranking: userDetails["userName"]["ranking"].toString(),
      calendar: DataCleaningUser.formatCalendar(userDetails["calendar"]),
      solved: userDetails["solved"],
      skillStats: userDetails["skillStats"],
      submissions: userDetails["submission"],
      acSubmissions : userDetails["acSubmission"],
      languageStats: DataCleaningUser.cleanLanguageStats(userDetails["languageStats"]),
      badges: userDetails["badges"],
      contests: userDetails["contest"],
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
