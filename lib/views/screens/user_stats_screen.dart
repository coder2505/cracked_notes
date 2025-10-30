import 'package:cracked_notes/core/theme/app_colors.dart';
import 'package:cracked_notes/model/user_model.dart';
import 'package:cracked_notes/viewmodel/ui_stateproviders.dart';
import 'package:cracked_notes/views/widgets/stacked_progress_bar.dart';
import 'package:cracked_notes/views/widgets/userstats_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserStatsScreen extends ConsumerStatefulWidget {
  const UserStatsScreen({super.key, required this.userModel});

  final UserModel userModel;

  @override
  ConsumerState<UserStatsScreen> createState() => _UserStatsScreenState();
}

class _UserStatsScreenState extends ConsumerState<UserStatsScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    ref.watch(clickedonAllSubmissions);

    return Scaffold(
      backgroundColor: AppColors.background_black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 15,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: AppColors.faded_yellow,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '${widget.userModel.name}.',
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(text: "\n"),
                          TextSpan(text: '${widget.userModel.username}'),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: Image.asset('assets/dummy_img/icon.png'),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    color: AppColors.secondary_black_trans,
                    border: BoxBorder.all(
                      color: AppColors.secondary_black_outline,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      spacing: 12,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Solved",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 34,
                                fontWeight: FontWeight.w600,
                                color: AppColors.faded_yellow,
                              ),
                            ),
                            Text(
                              widget.userModel.solved["solvedProblem"]
                                  .toString(),
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 36,
                                fontWeight: FontWeight.w600,
                                color: AppColors.faded_yellow,
                              ),
                            ),
                          ],
                        ),
                        StackedProgressBar(
                          easySolved: widget.userModel.solved['easySolved'],
                          mediumSolved: widget.userModel.solved['mediumSolved'],
                          hardSolved: widget.userModel.solved['hardSolved'],
                          totalProblems: widget.userModel.solved['solvedProblem'],
                        ),
                        UserstatsScreenWidgets.carouselStats(
                          widget.userModel.skillStats,
                          widget.userModel.languageStats,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    color: AppColors.secondary_black_trans,
                    border: BoxBorder.all(
                      color: AppColors.secondary_black_outline,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      spacing: 12,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Recent Activity",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 34,
                                fontWeight: FontWeight.w600,
                                color: AppColors.faded_yellow,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_ios),
                              color: AppColors.faded_yellow,
                            ),
                          ],
                        ),
                        UserstatsScreenWidgets.buttonRow(ref),

                        ref.read(clickedonAllSubmissions)
                            ? UserstatsScreenWidgets.recentAllActivity(
                                widget.userModel.submissions,
                              )
                            : UserstatsScreenWidgets.recentAcActivity(
                                widget.userModel.acSubmissions,
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
