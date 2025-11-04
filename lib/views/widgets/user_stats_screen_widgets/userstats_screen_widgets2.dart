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

  static Widget onTapBadgeContainer(
    double height,
    Map<String, dynamic> badgeData,
      double width
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
                    padding: const EdgeInsets.fromLTRB(0,8.0,0,8.0),
                    child: Container(
                      width: width/2.2,
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
                children: badgeData["upcomingBadges"].sublist(0,2).map<Widget>((data) {
                  return Container(
                    width: width/2.2,
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
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
