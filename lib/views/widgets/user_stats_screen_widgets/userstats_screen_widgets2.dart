import 'package:cracked_notes/core/theme/app_colors.dart';
import 'package:cracked_notes/utils/datacleaning_user.dart';
import 'package:cracked_notes/views/screens/contest_detail_screen.dart';
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
            (data) => helperWidgets.makeBadgeForNetworkImages(data["icon"], false, 100),
          ),
          ...badgeData["upcomingBadges"].map(
            (data) => helperWidgets.makeBadgeForNetworkImages(
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
    Map<String, dynamic> contestData,
    BuildContext context,
  ) {
    return Column(
      spacing: 10, // Keep your existing spacing
      mainAxisSize: MainAxisSize.min, // Wrap content height
      children: [
        // --- TOP SECTION (Global Ranking) ---
        // No fixed height. It grows with text size.
        Container(
          width: double.infinity, // Full width
          decoration: decoration,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Column(
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: helperWidgets.contestText(
                  contestData["contestGlobalRanking"].toString(),
                  48,
                  FontWeight.w800,
                  true,
                ),
              ),
              helperWidgets.contestText(
                "Global Ranking",
                16,
                FontWeight.w700,
                false,
              ),
            ],
          ),
        ),

        // --- MIDDLE SECTION (Grid) ---
        // IntrinsicHeight ensures the "Contests" and "Rating" cards
        // match the height of the column on the left.
        IntrinsicHeight(
          child: Row(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Left Column (Attended & Top Percent)
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 10,
                  children: [
                    // Attended
                    Expanded(
                      child: _buildStatCard(
                        decoration: decoration,
                        value: contestData["contestAttend"].toString(),
                        label: "Attended",
                      ),
                    ),
                    // Top Percent
                    Expanded(
                      child: _buildStatCard(
                        decoration: decoration,
                        value: "${contestData["contestTopPercentage"]}%",
                        label: "Top Percent",
                        valueSize: 38, // Slightly smaller font for % to fit
                      ),
                    ),
                  ],
                ),
              ),

              // Middle Column (Contests / Trophy)
              Expanded(
                flex: 1,
                child: Container(
                  decoration: decoration,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Using Flexible to let image shrink if needed
                      Flexible(
                        child: Image.asset(
                          'assets/dummy_img/trophy.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 8),
                      helperWidgets.contestText(
                        "Contests",
                        18,
                        FontWeight.w800,
                        false,
                      ),
                    ],
                  ),
                ),
              ),

              // Right Column (Contest Rating)
              Expanded(
                flex: 1,
                child: _buildStatCard(
                  decoration: decoration,
                  value: contestData["contestRating"].ceil().toString(),
                  label: "Contest Rating",
                  valueSize: 40,
                ),
              ),
            ],
          ),
        ),

        // --- BOTTOM SECTION (Participants & Arrow) ---
        IntrinsicHeight(
          child: Row(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Participants Card
              Expanded(
                child: _buildStatCard(
                  decoration: decoration,
                  value: contestData["totalParticipants"].toString(),
                  label: "Participants",
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),

              // Arrow Button
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ContestDetailScreen(contestData: contestData),
                    ),
                  );
                },
                child: AspectRatio(
                  aspectRatio: 1, // Keeps the button square
                  child: Container(
                    decoration: decoration,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.faded_yellow,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget _buildStatCard({
    required Decoration decoration,
    required String value,
    required String label,
    double valueSize = 44,
    EdgeInsets padding = const EdgeInsets.all(4),
  }) {
    return Container(
      decoration: decoration,
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // FittedBox prevents overflow if the number is huge
          FittedBox(
            fit: BoxFit.scaleDown,
            child: helperWidgets.contestText(
              value,
              valueSize,
              FontWeight.w700,
              true,
            ),
          ),
          helperWidgets.contestText(
            label,
            13, // Standardized label size
            FontWeight.w700,
            false,
          ),
        ],
      ),
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
                            helperWidgets.makeBadgeForNetworkImages(data["icon"], false, 125),
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
                            helperWidgets.makeBadgeForNetworkImages(
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
