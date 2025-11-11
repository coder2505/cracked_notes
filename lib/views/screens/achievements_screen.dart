import 'package:cracked_notes/core/extensions/extensions.dart';
import 'package:cracked_notes/views/widgets/stacked_progressbar_twovariables.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class AchievementsScreen extends StatefulWidget {
  const AchievementsScreen({super.key});

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
    double height = MediaQuery.of(context).size.height;
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
                Container(
                  decoration: context.containerDecoration,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          spacing: 10,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Next Achievement",
                              style: TextStyle(
                                color: AppColors.grey_text,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                letterSpacing: -0.5,
                              ),
                            ),
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return LinearGradient(
                                  colors: <Color>[
                                    Color(0xFFFFD600),
                                    Color(0xFF998000),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ).createShader(bounds);
                              },
                              child: Text(
                                "Pattern Prodigy",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.faded_yellow,
                                ),
                              ),
                            ),
                            Text(
                              "Solved 50 Easy problems — \nyou’ve cracked the beginner matrix.",
                              style: TextStyle(
                                color: AppColors.faded_yellow,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Image.asset("assets/dummy_img/prettybadge.png"),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: width,
                  decoration: context.containerDecoration,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Next Achievements",
                          style: TextStyle(
                            color: AppColors.grey_text,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            letterSpacing: -0.5,
                          ),
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: nextAchievements["length"],
                          itemBuilder: (context, index) {
                            Map curr = nextAchievements["names"][index];
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            curr["shortDesc"],
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
                                        child: Image.asset(
                                          "assets/dummy_img/prettybadge.png",
                                        ),
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
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: context.containerDecoration,
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Your Badges",
                              style: TextStyle(
                                color: AppColors.grey_text,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                letterSpacing: -0.5,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "17",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_forward_ios),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Image.asset(
                                'assets/dummy_img/prettybadge.png',
                              ),
                            ),
                            Expanded(
                              child: Image.asset(
                                'assets/dummy_img/prettybadge.png',
                              ),
                            ),
                            Expanded(
                              child: Image.asset(
                                'assets/dummy_img/prettybadge.png',
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "+14",
                            style: TextStyle(
                              color: AppColors.grey_text,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.normal,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: context.containerDecoration,
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "All Badges",
                              style: TextStyle(
                                color: AppColors.grey_text,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                letterSpacing: -0.5,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_ios),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ColorFiltered(
                                colorFilter: ColorFilter.matrix(<double>[
                                  0.2126,
                                  0.7152,
                                  0.0722,
                                  0,
                                  0,
                                  0.2126,
                                  0.7152,
                                  0.0722,
                                  0,
                                  0,
                                  0.2126,
                                  0.7152,
                                  0.0722,
                                  0,
                                  0,
                                  0,
                                  0,
                                  0,
                                  1,
                                  0,
                                ]),
                                child: Image.asset(
                                  'assets/dummy_img/prettybadge.png',
                                ),
                              ),
                            ),
                            Expanded(
                              child: ColorFiltered(
                                colorFilter: ColorFilter.matrix(<double>[
                                  0.2126,
                                  0.7152,
                                  0.0722,
                                  0,
                                  0,
                                  0.2126,
                                  0.7152,
                                  0.0722,
                                  0,
                                  0,
                                  0.2126,
                                  0.7152,
                                  0.0722,
                                  0,
                                  0,
                                  0,
                                  0,
                                  0,
                                  1,
                                  0,
                                ]),
                                child: Image.asset(
                                  'assets/dummy_img/prettybadge.png',
                                ),
                              ),
                            ),
                            Expanded(
                              child: ColorFiltered(
                                colorFilter: ColorFilter.matrix(<double>[
                                  0.2126,
                                  0.7152,
                                  0.0722,
                                  0,
                                  0,
                                  0.2126,
                                  0.7152,
                                  0.0722,
                                  0,
                                  0,
                                  0.2126,
                                  0.7152,
                                  0.0722,
                                  0,
                                  0,
                                  0,
                                  0,
                                  0,
                                  1,
                                  0,
                                ]),
                                child: Image.asset(
                                  'assets/dummy_img/prettybadge.png',
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
      ),
    );
  }
}
