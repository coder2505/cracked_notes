import 'package:cracked_notes/core/extensions/extensions.dart';
import 'package:cracked_notes/model/user_model.dart';
import 'package:cracked_notes/viewmodel/returnbadgefromdata.dart';
import 'package:cracked_notes/views/screens/next_achievements_screen.dart';
import 'package:cracked_notes/views/widgets/achievment_screen_widgets/badges_tap_widgets.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
      child: nextBadge.isNotEmpty
          ? Row(
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
                              colors: <Color>[
                                Color(0xFFFFD600),
                                Color(0xFF998000),
                              ],
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
                Expanded(child: returnBadge(nextBadge[0]["title"])),
              ],
            )
          : Padding(
              padding: EdgeInsetsGeometry.all(16),
              child: Center(
                child: Text("Did you really go out and achieve everything 😎"),
              ),
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
        child: nextBadge.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                      Expanded(child: SizedBox()),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NextAchievementsScreen(
                                allBadges: allBadges,
                                nextBadge: nextBadge,
                              ),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: nextBadge.length > 3 ? 3 : nextBadge.length,
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
                                  child: returnBadge(curr["title"]),
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
              )
            : Center(
                child: Text(
                  "You have nothing left to achieve, wait for the next update :)",
                ),
              ),
      ),
    );
  }

  static Widget userBadges(
    double height,
    double width,
    BuildContext context,
    UserModel user,
  ) {

    final List<dynamic> userAttainedBadges = user.userAttainedBadges;

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
                      user.userAttainedBadges.length.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showMaterialModalBottomSheet(
                          context: context,
                          builder: (context) {

                              return BadgesTapWidgets.onTapYourbadges(height, user.userAttainedBadges, user.allBadges, width);


                          },
                        );
                      },
                      icon: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height * 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: width / 3.1,
                    child: returnBadge(userAttainedBadges[index]),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: userAttainedBadges.length > 3
                  ? Text(
                      "+${userAttainedBadges.length - 3}",
                      style: TextStyle(
                        color: AppColors.grey_text,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.normal,
                        fontSize: 24,
                      ),
                    )
                  : SizedBox.shrink(),
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
