import 'package:carousel_slider/carousel_slider.dart';
import 'package:cracked_notes/viewmodel/ui_stateproviders.dart';
import 'package:cracked_notes/views/widgets/user_dashboard_widgets.dart';
import 'package:cracked_notes/views/widgets/user_stats_screen_widgets/helper_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../utils/datacleaning_user.dart';

class UserstatsScreenWidgets {
  static Widget carouselStats(
    Map<String, dynamic> skillstatsData,
    final List<Map<String, dynamic>> languageStats,
  ) {
    List<Widget> carouselWidgets = [
      Padding(
        padding: const EdgeInsets.fromLTRB(8, 30, 8, 30),
        child: UserDashboardWidgets.radarChart(
          DataCleaningUser.sortProblemCounts(skillstatsData),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(8, 30, 8, 30),
        child: UserDashboardWidgets.pieChart(languageStats),
      ),
    ];
    return CarouselSlider(
      items: carouselWidgets,
      options: CarouselOptions(
        height: 300,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: false,
        reverse: false,
        autoPlay: false,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.vertical,
      ),
    );
  }

  static Widget recentAcActivity(Map<String, dynamic> submissions, bool displayAll) {
    return ListView.builder(
      itemCount: displayAll? submissions["submission"].length: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        String title = submissions["submission"][index]["title"];
        String language = submissions["submission"][index]["lang"];
        String time = DataCleaningUser.formatSubmissionTime(
          submissions["submission"][index]["timestamp"],
        );
        String status = submissions["submission"][index]["statusDisplay"];
        return ListTile(
          // 1. Title remains the same
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                    color: helperWidgets.returnTitleColor(status),
                  ),
                ),
              ),

              SizedBox(
                width: 50,
                height: 40,
                child: helperWidgets.returnLangIcon(language),
              )
            ],
          ),

          // 2. Subtitle is replaced with a Row for two-sided alignment
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Row(
              // Ensure items are aligned to the baseline for consistent text size
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                // Extreme Left Field (Language)
                Expanded(
                  child: Text(
                    status,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w100,
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),

                // Spacer pushes the next widget to the far right end
                const Spacer(),

                // Extreme Right Field (Time)
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

  }

  static Widget recentAllActivity(Map<String, dynamic> submissions, bool displayAll) {
    /*

    {"count":20,"submission":
    [{"title":"Add Two Numbers","titleSlug":"add-two-numbers","timestamp":"1761579056",
    "statusDisplay":"Compile Error","lang":"java"}....]}
     */

    return ListView.builder(
      itemCount: displayAll? submissions["submission"].length:3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        String title = submissions["submission"][index]["title"];
        String language = submissions["submission"][index]["lang"];
        String time = DataCleaningUser.formatSubmissionTime(
          submissions["submission"][index]["timestamp"],
        );
        String status = submissions["submission"][index]["statusDisplay"];
        return ListTile(
          // 1. Title remains the same
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                    color:helperWidgets.returnTitleColor(status),
                  ),
                ),
              ),

              SizedBox(
                width: 50,
                height: 40,
                child: helperWidgets.returnLangIcon(language),
              )
            ],
          ),

          // 2. Subtitle is replaced with a Row for two-sided alignment
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Row(
              // Ensure items are aligned to the baseline for consistent text size
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                // Extreme Left Field (Language)
                Text(
                  status,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w100,
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Inter',
                  ),
                ),

                // Spacer pushes the next widget to the far right end
                const Spacer(),

                // Extreme Right Field (Time)
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  static Widget buttonRow(WidgetRef ref) {
    ref.watch(clickedonAllSubmissions);

    return Row(
      spacing: 10,
      children: [
        TextButton(
          onPressed: () {
            ref.read(clickedonAllSubmissions.notifier).state = !ref.read(
              clickedonAllSubmissions,
            );
          },
          style: ButtonStyle(
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: BorderSide(
                  color: ref.read(clickedonAllSubmissions)
                      ? const Color(0xFF0071FF)
                      : const Color(0xFFFDF4E3),
                  width: 2,
                ),
              ),
            ),
            backgroundColor: WidgetStateProperty.all(Colors.transparent),
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
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
          onPressed: () {
            ref.read(clickedonAllSubmissions.notifier).state = !ref.read(
              clickedonAllSubmissions,
            );
          },
          style: ButtonStyle(
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: BorderSide(
                  color: !ref.read(clickedonAllSubmissions)
                      ? const Color(0xFF0071FF)
                      : const Color(0xFFFDF4E3),
                  width: 2,
                ),
              ),
            ),
            backgroundColor: WidgetStateProperty.all(Colors.transparent),
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
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
    );
  }
}
