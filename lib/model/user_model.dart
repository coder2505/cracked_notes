import 'package:cracked_notes/utils/datacleaning_user.dart';

class UserModel {
  final String username, name, ranking, profilepic;
  final Map<String, dynamic> solved,
      skillStats,
      submissions,
      acSubmissions,
      badges,
      contests,
      customUserData,
      allBadges;
  final List<Map<String, dynamic>> languageStats;
  final Map<DateTime, int> calendar;
  final List<dynamic> userAttainedBadges,nextBadges;

  factory UserModel.fromJSON(Map<String, dynamic> userDetails) {
    return UserModel(
      username: userDetails["userName"]["username"],
      profilepic: userDetails["userName"]["avatar"],
      name: userDetails["userName"]["name"],
      ranking: userDetails["userName"]["ranking"].toString(),
      calendar: DataCleaningUser.formatCalendar(userDetails["calendar"]),
      solved: userDetails["solved"],
      skillStats: userDetails["skillStats"],
      submissions: userDetails["submission"],
      acSubmissions: userDetails["acSubmission"],
      languageStats: DataCleaningUser.cleanLanguageStats(
        userDetails["languageStats"],
      ),
      badges: userDetails["badges"],
      contests: userDetails["contest"],
      customUserData: userDetails["customData"]["userVariablesData"],
      userAttainedBadges:
          userDetails["customData"]["badges"]["userAttainedBadges"],
      allBadges: userDetails["customData"]["badges"]["attainableBadgeData"],
      nextBadges: userDetails["customData"]["badges"]["nextBadges"],
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
    required this.contests,
    required this.customUserData,
    required this.userAttainedBadges,
    required this.allBadges,
    required this.nextBadges
  });
}
