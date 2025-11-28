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
