import 'package:cracked_notes/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../stacked_progressbar_twovariables.dart';

class AchievementsWidgets {
  static Widget nextAchievement(
    BuildContext context,
    List nextBadge,
    Map<String, dynamic> allBadges,
  ) {
    return Container(
      decoration: context.containerDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
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
                        colors: <Color>[Color(0xFFFFD600), Color(0xFF998000)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds);
                    },
                    child: Text(
                      nextBadge[0]["title"],
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: AppColors.faded_yellow,
                      ),
                    ),
                  ),
                  Text(
                    allBadges[nextBadge[0]["title"]]["shortDesc"],
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
          ),
          Expanded(child: Image.asset("assets/dummy_img/prettybadge.png")),
        ],
      ),
    );
  }

  static Widget listViewBuilderNextAchievements(
    double width,
    BuildContext context,
    List nextBadge,
    Map<String, dynamic> allBadges,
  ) {
    return Container(
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
              itemCount: nextBadge.length > 3? 3 : nextBadge.length,
              itemBuilder: (context, index) {
                Map curr = nextBadge[index];
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
                                allBadges[curr["title"]]["shortDesc"],
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
    );
  }

  static Widget userBadges(double width, BuildContext context) {
    return Container(
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
                  child: Image.asset('assets/dummy_img/prettybadge.png'),
                ),
                Expanded(
                  child: Image.asset('assets/dummy_img/prettybadge.png'),
                ),
                Expanded(
                  child: Image.asset('assets/dummy_img/prettybadge.png'),
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
    );
  }

  static Widget allBadges(double width, BuildContext context) {
    return Container(
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
                    child: Image.asset('assets/dummy_img/prettybadge.png'),
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
                    child: Image.asset('assets/dummy_img/prettybadge.png'),
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
                    child: Image.asset('assets/dummy_img/prettybadge.png'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
