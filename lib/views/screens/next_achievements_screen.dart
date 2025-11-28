import 'package:cracked_notes/viewmodel/returnbadgefromdata.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../widgets/stacked_progressbar_twovariables.dart';

class NextAchievementsScreen extends StatefulWidget {
  final Map<String, dynamic> allBadges;
  final List<dynamic> nextBadge;

  const NextAchievementsScreen({
    super.key,
    required this.allBadges,
    required this.nextBadge,
  });

  @override
  State<NextAchievementsScreen> createState() => _NextAchievementsScreenState();
}

class _NextAchievementsScreenState extends State<NextAchievementsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background_black,
      appBar: AppBar(
        backgroundColor: AppColors.background_black,
        iconTheme: IconThemeData(color: AppColors.faded_yellow),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: SafeArea(
          child: ListView.builder(
            itemCount: widget.nextBadge.length,
            itemBuilder: (context, index) {
              Map curr = widget.nextBadge[index];
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              curr["title"],
                              style: TextStyle(
                                color: AppColors.faded_yellow,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                fontSize: 26,
                              ),
                            ),
                            Text(
                              widget.allBadges[curr["title"]]["shortDesc"],
                              style: TextStyle(
                                color: AppColors.grey_text,
                                fontFamily: 'Inter',
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 75,
                          child: returnBadge(curr["title"]),
                        ),
                        Text(
                          "${curr["completed"]}/${curr["total"]}",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 26,
                          ),
                        ),
                      ],
                    ),
                    StackedProgressbarTwoVariables(
                      completed: curr["completed"],
                      total: curr["total"],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
