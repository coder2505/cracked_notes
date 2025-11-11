import 'package:cracked_notes/core/extensions/extensions.dart';
import 'package:cracked_notes/core/theme/app_colors.dart';
import 'package:cracked_notes/model/user_model.dart';
import 'package:cracked_notes/utils/timer_countdown.dart';
import 'package:cracked_notes/views/widgets/home_screen_widgets/github_widget.dart';
import 'package:cracked_notes/views/widgets/home_screen_widgets/home_screen_widgets.dart';
import 'package:flutter/material.dart';

class UserHomescreen extends StatefulWidget {
  final UserModel user;

  const UserHomescreen({super.key, required this.user});

  @override
  State<UserHomescreen> createState() => _UserHomescreenState();
}

class _UserHomescreenState extends State<UserHomescreen> {
  TimerCountDown timerService = TimerCountDown();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timerService.timeToMidnight();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.background_black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              spacing: 12,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.secondary_black_trans,
                    border: BoxBorder.all(color: AppColors.green_trans_counter),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  height: height * 0.12,
                  width: width,
                  child: HomeScreenWidgets.timerRow(),
                ),
                Row(
                  spacing: 4,
                  children: [
                    Container(
                      decoration: context.containerDecoration,
                      width: ((width - 20) / 2),
                      height: height * 0.2,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: HomeScreenWidgets.streakContainer(height, widget.user.customUserData),
                      ),
                    ),
                    Container(
                      decoration: context.containerDecoration,
                      width: ((width - 20) / 2),
                      height: height * 0.2,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: HomeScreenWidgets.carouselHomeScreen(),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: context.containerDecoration,
                  width: width,
                  child: HomeScreenWidgets.homeUserContainerInfo(
                    height,
                    widget.user.name,
                  ),
                ),
                SizedBox(
                  child: CustomPaint(
                    painter: GithubWidget(widget.user.calendar),
                    size: Size(width, height * 0.25),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
