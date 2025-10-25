import 'package:cracked_notes/core/theme/app_colors.dart';
import 'package:cracked_notes/model/user_model.dart';
import 'package:cracked_notes/views/widgets/stacked_progress_bar.dart';
import 'package:cracked_notes/views/widgets/userstats_screen_widgets.dart';
import 'package:flutter/material.dart';

import '../../utils/datacleaning_user.dart';
import '../widgets/user_dashboard_widgets.dart';

class UserStatsScreen extends StatefulWidget {
  const UserStatsScreen({super.key, required this.userModel});

  final UserModel userModel;

  @override
  State<UserStatsScreen> createState() => _UserStatsScreenState();
}

class _UserStatsScreenState extends State<UserStatsScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.background_black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                          text: "Manish.",
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(text: "\n"),
                        TextSpan(text: "manishraja2505"),
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
                            "88",
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
                        easySolved: 50,
                        mediumSolved: 40,
                        hardSolved: 10,
                        totalProblems: 100,
                      ),
                      UserstatsScreenWidgets.carousel_stats(widget.userModel.skillStats)
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
                      Row(
                        spacing: 10,
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  side: BorderSide(
                                    color: true
                                        ? const Color(0xFF0071FF)
                                        : const Color(0xFFFDF4E3),
                                    width: 2,
                                  ),
                                ),
                              ),
                              backgroundColor: WidgetStateProperty.all(
                                Colors.transparent,
                              ),
                              padding: WidgetStateProperty.all(
                                const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 10,
                                ),
                              ),
                            ),
                            child: Text(
                              "All",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.faded_yellow,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  side: BorderSide(
                                    color: false
                                        ? const Color(0xFF0071FF)
                                        : const Color(0xFFFDF4E3),
                                    width: 2,
                                  ),
                                ),
                              ),
                              backgroundColor: WidgetStateProperty.all(
                                Colors.transparent,
                              ),
                              padding: WidgetStateProperty.all(
                                const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 10,
                                ),
                              ),
                            ),
                            child: Text(
                              "Accepted",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.faded_yellow,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
