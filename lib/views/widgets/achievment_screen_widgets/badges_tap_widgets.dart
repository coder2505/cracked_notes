import 'package:cracked_notes/viewmodel/returnbadgefromdata.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../user_stats_screen_widgets/helper_widgets.dart';

class BadgesTapWidgets {
  static Widget onTapYourbadges(
    double height,
    List<dynamic> attainedBadges,
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
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (attainedBadges.isNotEmpty)
                Text(
                  "Your Badges",
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    color: AppColors.faded_yellow,
                  ),
                ),

              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: attainedBadges.length,
                itemBuilder: (context, index) {
                  String name = attainedBadges[index];
                  final data = badgeData[name];

                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      // width: width / 2.2, // Removed so it fills the list width
                      decoration: BoxDecoration(
                        color: AppColors.secondary_black_trans,
                        border: Border.all(
                          color: AppColors.secondary_black_outline,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          spacing: 10, // Keeps the spacing logic for children
                          children: [
                            helperWidgets.makeBadgeForAssetImages(
                              returnBadge(name),
                              false,
                              150,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      color: AppColors.faded_yellow,
                                    ),
                                  ),
                                  Text(
                                    data["shortDesc"],
                                    textAlign: TextAlign.center,
                                    // softWrap: true,
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
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
