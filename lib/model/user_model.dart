import 'package:cracked_notes/utils/datacleaning_user.dart';

class UserModel {
  final String username, name, ranking;
  final Map<String, dynamic> solved, skillStats, submissions;
  final Map<DateTime, int> calendar;

  factory UserModel.fromJSON(
    Map<String, dynamic> userDetails,
    Map<String,dynamic> calendar,
    submissions,
    solved,
    skillStats,
  ) {

    return UserModel(
      username: userDetails["username"],
      name: userDetails["name"],
      ranking: userDetails["ranking"].toString(),
      calendar: DataCleaningUser.formatCalendar(calendar),
      solved: solved,
      skillStats: skillStats,
      submissions: submissions,
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
  });
}
