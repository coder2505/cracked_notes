import 'package:carousel_slider/carousel_slider.dart';
import 'package:cracked_notes/viewmodel/ui_stateproviders.dart';
import 'package:cracked_notes/views/widgets/user_dashboard_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_colors.dart';
import '../../utils/datacleaning_user.dart';

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

  static Widget buttonRow(WidgetRef ref){
    ref.watch(clickedonAllSubmissions);

    return  Row(
      spacing: 10,
      children: [
        TextButton(
          onPressed: () {
            ref.read(clickedonAllSubmissions.notifier).state = !ref.read(clickedonAllSubmissions);
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
          onPressed: () {
            ref.read(clickedonAllSubmissions.notifier).state = !ref.read(clickedonAllSubmissions);
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
    );
  }
}
