import 'package:cracked_notes/core/theme/app_colors.dart';
import 'package:cracked_notes/utils/datacleaning_user.dart';
import 'package:cracked_notes/views/widgets/user_stats_screen_widgets/helper_widgets.dart';
import 'package:flutter/material.dart';

class UserStatsScreenWidgets2 {
  static Widget BadgeRow(Map<String, dynamic> badgeData) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ...badgeData["badges"].map(
            (data) => helperWidgets.makeBadge(data["icon"], false, 100),
          ),
          ...badgeData["upcomingBadges"].map(
            (data) => helperWidgets.makeBadge(
              "https://leetcode.com${data["icon"]}",
              true,
              100,
            ),
          ),
        ],
      ),
    );
  }

  static Widget ContestHistory(
    double width,
    double height,
    BoxDecoration decoration,
  ) {
    return Column(
      spacing: 10,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          decoration: decoration,
          width: width,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                helperWidgets.contestText("78169", 48, FontWeight.w800, true),
                helperWidgets.contestText(
                  "Participants",
                  16,
                  FontWeight.w700,
                  false,
                ),
              ],
            ),
          ),
        ),
        Row(
          spacing: 5,
          children: [
            Column(
              spacing: 1,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: width / 3.2,
                  height: height / 9,
                  decoration: decoration,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      helperWidgets.contestText(
                        "22",
                        48,
                        FontWeight.w700,
                        true,
                      ),
                      helperWidgets.contestText(
                        "Attended",
                        14,
                        FontWeight.w700,
                        false,
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: width / 3.2,
                  height: height / 9,
                  decoration: decoration,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      helperWidgets.contestText(
                        "2.6%",
                        44,
                        FontWeight.w700,
                        true,
                      ),
                      helperWidgets.contestText(
                        "Top Percent",
                        13,
                        FontWeight.w700,
                        false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              decoration: decoration,
              width: width / 3.2,
              height: 2 * (height / 9),
              child: Column(
                spacing: 15,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/dummy_img/trophy.png'),
                  helperWidgets.contestText(
                    "Contests",
                    18,
                    FontWeight.w800,
                    false,
                  ),
                ],
              ),
            ),
            Container(
              decoration: decoration,
              width: width / 3.8,
              height: 2 * (height / 9),
              child: Column(
                spacing: 15,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  helperWidgets.contestText("2550", 40, FontWeight.w700, true),
                  helperWidgets.contestText(
                    "Contest Rating",
                    13,
                    FontWeight.w700,
                    false,
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          spacing: 10,
          children: [
            Container(
              decoration: decoration,
              width: width / 1.6,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    helperWidgets.contestText(
                      "1931",
                      40,
                      FontWeight.w700,
                      true,
                    ),
                    helperWidgets.contestText(
                      "Global Rating",
                      13,
                      FontWeight.w700,
                      false,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: height/11,
                decoration: decoration,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.faded_yellow,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  static Widget onTapBadgeContainer(
    double height,
    Map<String, dynamic> badgeData,
    double width,
  ) {
    return Container(
      height: height * 0.75,
      decoration: BoxDecoration(color: AppColors.background_black),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (badgeData["badges"].length > 0)
                Text(
                  "All",
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    color: AppColors.faded_yellow,
                  ),
                ),

              Wrap(
                spacing: 10,
                children: badgeData["badges"].map<Widget>((data) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
                    child: Container(
                      width: width / 2.2,
                      decoration: BoxDecoration(
                        color: AppColors.secondary_black_trans,
                        border: BoxBorder.all(
                          color: AppColors.secondary_black_outline,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          spacing: 10,
                          children: [
                            helperWidgets.makeBadge(data["icon"], false, 125),
                            Text(
                              textAlign: TextAlign.center,
                              data["displayName"],
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Inter',
                                fontSize: 16,
                                color: AppColors.faded_yellow,
                              ),
                            ),
                            Text(
                              DataCleaningUser.formatDate(data["creationDate"]),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Inter',
                                fontSize: 16,
                                color: AppColors.faded_yellow,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              Text(
                "Upcoming",
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  color: AppColors.faded_yellow,
                ),
              ),
              Wrap(
                spacing: 10,
                children: badgeData["upcomingBadges"].sublist(0, 2).map<Widget>(
                  (data) {
                    return Container(
                      width: width / 2.2,
                      decoration: BoxDecoration(
                        color: AppColors.secondary_black_trans,
                        border: BoxBorder.all(
                          color: AppColors.secondary_black_outline,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          spacing: 10,
                          children: [
                            helperWidgets.makeBadge(
                              "https://leetcode.com${data["icon"]}",
                              false,
                              125,
                            ),
                            Text(
                              data["name"],
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Inter',
                                fontSize: 16,
                                color: AppColors.faded_yellow,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
