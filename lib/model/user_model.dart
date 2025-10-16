class UserModel {
  final String username, name, ranking;
  final Map<String, dynamic> calendar, solved, skillStats, submissions;


  // factory UserModel.fromJSON(Map<String, dynamic> data){
  //
  //
  //
  //
  // }

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
