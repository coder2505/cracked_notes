import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cracked_notes/viewmodel/returnbadgefromdata.dart';
import 'package:cracked_notes/views/widgets/home_screen_widgets/timer_circles.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../utils/timer_countdown.dart';

class HomeScreenWidgets {
  static Widget streakContainer(
    double height,
    Map<String, dynamic> customUserData,
  ) {
    return Column(
      spacing: 10,

      children: [
        Align(
          alignment: Alignment.center,
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xffED3F27), Color(0xff999999)],
              ).createShader(bounds);
            },
            child: Align(
              alignment: Alignment.topCenter,
              child: AutoSizeText(
                customUserData["currentStreak"].toString(),
                maxLines: 1,
                style: TextStyle(
                  color: AppColors.faded_yellow,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w800,
                  fontSize: height * 0.1,
                ),
                minFontSize: 60,
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(
            "Day Streak",
            style: TextStyle(
              color: AppColors.faded_yellow,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }

  static Widget carouselHomeScreen(
    List<dynamic> nextbadge,
    Map badgeData,
    double height,
  ) {
    List<Widget> listCarousel = [
      nextBadge(nextbadge, height),
      userMessage(nextbadge, badgeData),
    ];

    return CarouselSlider(
      items: listCarousel,
      options: CarouselOptions(
        initialPage: 0,
        enableInfiniteScroll: false,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 4),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        viewportFraction: 1,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  static Widget userMessage(List<dynamic> nextbadge, Map attainableBadgeData) {
    return Center(
      child: Text(
        "${attainableBadgeData[nextbadge[0]["title"]]["shortDesc"]}\nProgress: ${nextbadge[0]["completed"]}/${nextbadge[0]["total"]}",
        style: TextStyle(
          color: AppColors.faded_yellow,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
          fontSize: 14,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  static Widget nextBadge(List<dynamic> nextbadge, double height) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double availableHeight = constraints.maxHeight - 45;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Next\nAchievement",
              style: TextStyle(
                color: AppColors.faded_yellow,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 15,
                height: 1.0,
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                // Force the badge to fit in the remaining space
                height: availableHeight > 0 ? availableHeight : 10,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: returnBadge(nextbadge[0]["title"]),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static Widget timerRow() {
    return Row(

      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: 100,
          child: Stack(
            alignment: Alignment.center,
            children: [
              StreamBuilder(
                initialData: TimerCountDown().printPercentageInitial(),
                stream: TimerCountDown.percentageController.stream,
                builder: (context, snapshot) {
                  return CustomPaint(
                    // Ensure your CustomPaint fits the 100x100 box
                    painter: TimerCircles(snapshot.data ?? 0),
                    size: const Size(100, 100),
                  );
                },
              ),
              StreamBuilder(
                initialData: TimerCountDown().printTimeInitial(),
                stream: TimerCountDown.controller.stream,
                builder: (context, snapshot) {
                  return Text(
                    '${snapshot.data}',
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ],
          ),
        ),

        const SizedBox(width: 15),

        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "The Countdown has begun.",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: Colors.white,
                ),
                softWrap: true,
              ),
              SizedBox(height: 4),
              Text(
                "Can you finish a problem before it ends?",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w100,
                  fontStyle: FontStyle.italic,
                  color: Colors.white70,
                ),
                softWrap: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget homeUserContainerInfo(
    double height,
    double width,
    String name,
    String title,
    List<dynamic> attainedBadges,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text.rich(
                  TextSpan(
                    style: TextStyle(fontFamily: 'Inter', fontSize: 40),
                    children: <TextSpan>[
                      TextSpan(
                        text: '$name,\n',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColors.faded_yellow,
                        ),
                      ),
                      TextSpan(
                        text: "$title.",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: AppColors.faded_yellow,
                        ),
                      ),
                    ],
                  ),
                ),
                attainedBadges.isNotEmpty? Container(
                  decoration: BoxDecoration(
                    color: AppColors.secondary_black_outline,
                    border: BoxBorder.all(
                      color: AppColors.secondary_black_trans,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  height: height * 0.1,
                  child: Row(
                    children: [
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: attainedBadges.length > 3
                            ? 3
                            : attainedBadges.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: width / 5,
                            child: returnBadge(attainedBadges[index]),
                          );
                        },
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            attainedBadges.length > 3?"+${attainedBadges.length - 3}":"",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 32,
                              color: AppColors.grey_text,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ): SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
