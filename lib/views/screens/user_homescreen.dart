import 'package:cracked_notes/core/theme/app_colors.dart';
import 'package:cracked_notes/utils/timer_countdown.dart';
import 'package:cracked_notes/views/widgets/github_widget.dart';
import 'package:cracked_notes/views/widgets/timer_circles.dart';
import 'package:flutter/material.dart';

class UserHomescreen extends StatefulWidget {
  const UserHomescreen({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            spacing: 12,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.green_trans_counter,
                  border: BoxBorder.all(color: AppColors.green_counter),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                height: height * 0.12,
                width: width,
                child: Row(
                  spacing: 10,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: 100,
                          child: StreamBuilder(
                            initialData: TimerCountDown().printPercentageInitial(),
                            stream: TimerCountDown.percentageController.stream,
                            builder: (context, snapshot) {
                              return CustomPaint(
                                painter: TimerCircles(snapshot.data ?? 0),
                                size: Size(200, 300),
                              );
                            },
                          ),
                        ),
                        Positioned(
                          left: 38,
                          top: 20,
                          child: StreamBuilder(
                            initialData: TimerCountDown().printTimeInitial(),
                            stream: TimerCountDown.controller.stream,
                            builder: (context, snapshot) {
                              return Text(
                                '${snapshot.data}',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        Text(
                          "The Countdown has begun.",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Can you finish a problem before it ends?",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w100,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.faded_yellow,
                  border: BoxBorder.all(color: AppColors.stronger_yellow),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                width: width,

                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 40,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Manish,\n',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                TextSpan(
                                  text: 'The Knight',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.app_trans_blue,
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              border: BoxBorder.all(color: AppColors.app_blue),
                            ),
                            height: height * 0.05,
                            child: Row(
                              spacing: 8,
                              children: [
                                SizedBox(width: 3),
                                Icon(Icons.star, color: Colors.amber.shade800),
                                Icon(
                                  Icons.diamond,
                                  color: Colors.indigo.shade700,
                                ),
                                Icon(
                                  Icons.workspace_premium,
                                  color: Colors.purple.shade800,
                                ),
                                SizedBox(width: 3),
                              ],
                            ),
                          ),
                          Row(
                            spacing: 10,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.app_trans_red,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  border: BoxBorder.all(
                                    color: AppColors.app_red,
                                  ),
                                ),
                                height: height * 0.05,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    spacing: 8,
                                    children: [
                                      Icon(
                                        Icons.whatshot,
                                        color: Colors.orange.shade800,
                                      ),
                                      Text("62"),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.app_trans_yellow,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  border: BoxBorder.all(
                                    color: AppColors.app_yellow,
                                  ),
                                ),
                                height: height * 0.05,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    spacing: 8,
                                    children: [
                                      Icon(
                                        Icons.developer_board,
                                        color: Colors.grey.shade800,
                                      ),
                                      Text("1222"),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                child: CustomPaint(
                  painter: GithubWidget(),
                  size: Size(width, height * 0.25),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
