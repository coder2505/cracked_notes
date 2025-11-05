import 'package:cracked_notes/core/extensions/extensions.dart';
import 'package:cracked_notes/views/widgets/user_stats_screen_widgets/userstats_screen_widgets2.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({super.key});

  @override
  State<ChallengesScreen> createState() => _ChallengesScreenState();
}

class _ChallengesScreenState extends State<ChallengesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            spacing: 10,
            children: [
              Container(
                decoration: context.containerDecoration,
                width: MediaQuery.sizeOf(context).width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: UserStatsScreenWidgets2.ContestHistory(
                    MediaQuery.sizeOf(context).width,MediaQuery.sizeOf(context).height, context.containerDecoration
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
