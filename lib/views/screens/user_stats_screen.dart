import 'package:cracked_notes/core/extensions/extensions.dart';
import 'package:cracked_notes/core/theme/app_colors.dart';
import 'package:cracked_notes/model/user_model.dart';
import 'package:cracked_notes/viewmodel/ui_stateproviders.dart';
import 'package:cracked_notes/views/screens/recent_activity_screen.dart';
import 'package:cracked_notes/views/widgets/stacked_progress_bar.dart';
import 'package:cracked_notes/views/widgets/user_stats_screen_widgets/userstat_widgets_3.dart';
import 'package:cracked_notes/views/widgets/user_stats_screen_widgets/userstats_screen_widgets.dart';
import 'package:cracked_notes/views/widgets/user_stats_screen_widgets/userstats_screen_widgets2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
    double height = MediaQuery.of(context).size.height;

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
                    Expanded(
                      child: Text.rich(
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
                            TextSpan(text: widget.userModel.username),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: Image.network(widget.userModel.profilepic),
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
                    padding: const EdgeInsets.all(12),
                    child: GestureDetector(
                      onTap: () {
                        showMaterialModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return UserStatsScreenWidgets2.onTapBadgeContainer(
                              height,
                              widget.userModel.badges,
                              width,
                            );
                          },
                        );
                      },
                      child: UserStatsScreenWidgets2.BadgeRow(
                        widget.userModel.badges,
                      ),
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
                  child: widget.userModel.solved["solvedProblem"] >0? Padding(
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
                          totalProblems:
                              widget.userModel.solved['solvedProblem'] == 0
                              ? 100
                              : widget.userModel.solved['solvedProblem'],
                        ),
                        UserstatsScreenWidgets.carouselStats(
                          widget.userModel.skillStats,
                          widget.userModel.languageStats,
                        ),
                      ],
                    ),
                  ) : userStatWidget3.noProblemSolved(context),
                ),
                widget.userModel.contests["contestParticipation"].length > 0
                    ? Container(
                        decoration: BoxDecoration(
                          color: AppColors.secondary_black_trans,
                          border: BoxBorder.all(
                            color: AppColors.secondary_black_outline,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        width: width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: UserStatsScreenWidgets2.ContestHistory(
                            width,
                            height,
                            context.containerDecoration,
                            widget.userModel.contests,
                            context,
                          ),
                        ),
                      )
                    : userStatWidget3.noContestData_Widget(context),
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
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        RecentActivityScreen(widget.userModel),
                                  ),
                                );
                              },
                              icon: Icon(Icons.arrow_forward_ios),
                              color: AppColors.faded_yellow,
                            ),
                          ],
                        ),
                        UserstatsScreenWidgets.buttonRow(ref),

                        ref.read(clickedonAllSubmissions)
                            ? UserstatsScreenWidgets.recentAllActivity(
                                widget.userModel.submissions,
                                false,
                              )
                            : UserstatsScreenWidgets.recentAcActivity(
                                widget.userModel.acSubmissions,
                                false,
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
