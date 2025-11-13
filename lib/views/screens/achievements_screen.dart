import 'package:cracked_notes/model/user_model.dart';
import 'package:cracked_notes/views/widgets/achievment_screen_widgets/achievements_widgets.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class AchievementsScreen extends StatefulWidget {
  final UserModel user;

  const AchievementsScreen({super.key, required this.user});

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
  Map<String, dynamic> nextAchievements = {
    "length": 3,
    "names": [
      {
        "title": "Pattern Prodigy",
        "shortDesc": "Solve 50 easy problems",
        "completed": 42,
        "total": 50,
        "badge": "link",
      },
      {
        "title": "Fearless Coder",
        "shortDesc": "Solve Your First Hard Problem",
        "completed": 0,
        "total": 1,
        "badge": "link",
      },
      {
        "title": "Routine Builder",
        "shortDesc": "Keep a 10 Day Streak !",
        "completed": 6,
        "total": 10,
        "badge": "link",
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.background_black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              children: [
                AchievementsWidgets.nextAchievement(
                  context,
                  widget.user.nextBadges,
                  widget.user.allBadges,
                ),
                AchievementsWidgets.listViewBuilderNextAchievements(
                  width,
                  context,
                  widget.user.nextBadges,
                  widget.user.allBadges,
                ),
                AchievementsWidgets.userBadges(width, context),
                AchievementsWidgets.allBadges(width, context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
