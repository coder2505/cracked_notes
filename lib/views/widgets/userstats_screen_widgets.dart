import 'package:carousel_slider/carousel_slider.dart';
import 'package:cracked_notes/views/widgets/user_dashboard_widgets.dart';
import 'package:flutter/material.dart';

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
}
