import 'package:cracked_notes/core/extensions/extensions.dart';
import 'package:cracked_notes/core/theme/app_colors.dart';
import 'package:cracked_notes/utils/datacleaning_user.dart';
import 'package:cracked_notes/views/widgets/contest_detail_screen_widgets.dart';
import 'package:flutter/material.dart';

class ContestDetailScreen extends StatefulWidget {
  const ContestDetailScreen({super.key, required this.contestData});

  final Map<String, dynamic> contestData;

  @override
  State<ContestDetailScreen> createState() => _ContestDetailScreenState();
}

class _ContestDetailScreenState extends State<ContestDetailScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .sizeOf(context)
        .width;
    return Scaffold(
      backgroundColor: AppColors.background_black,
      appBar: AppBar(
        backgroundColor: AppColors.background_black,
        iconTheme: IconThemeData(color: AppColors.faded_yellow),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ContestDetailScreenWidgets.userInfo(
                  widget.contestData,
                  context,
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0,15,0,15),
                  child: Row(
                    children: [
                      Text("All", style: TextStyle(fontFamily: 'Inter',
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: AppColors.faded_yellow),),
                      Expanded(child: SizedBox()),
                      Text("(${widget.contestData["contestParticipation"].length
                          .toString()})", style: TextStyle(fontFamily: 'Inter',
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: AppColors.faded_yellow),)
                    ],
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.contestData["contestParticipation"].length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> data = widget
                        .contestData["contestParticipation"][index];
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: Container(
                        decoration: context.containerDecoration,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            spacing: 10,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    data["contest"]["title"],
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: 'Inter',
                                      color: AppColors.faded_yellow,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  data["trendDirection"] == "UP"
                                      ? Icon(Icons.trending_up_outlined,
                                    color: AppColors.app_highest_blue_github,)
                                      : Icon(Icons.trending_down_outlined,
                                    color: AppColors.app_highest_blue_github,),
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  DataCleaningUser.formatTimestampContest(
                                      data["contest"]["startTime"]),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    color: AppColors.faded_yellow,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Text(
                                "${data["problemsSolved"]}/${data["totalProblems"]} Problems Solved",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  color: Color(0xAAFFFFFF),
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: width / 4.5,
                                    decoration: BoxDecoration(
                                      color: data["problemsSolved"] >= 1
                                          ? Color(0xFF00C853)
                                          : Color(0xffCF6455),
                                      border: BoxBorder.all(
                                        color:
                                        AppColors.secondary_black_outline,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: width / 4.5,
                                    decoration: BoxDecoration(
                                      color: data["problemsSolved"] >= 2
                                          ? Color(0xFF00C853)
                                          : Color(0xffCF6455),
                                      border: BoxBorder.all(
                                        color:
                                        AppColors.secondary_black_outline,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: width / 4.5,
                                    decoration: BoxDecoration(
                                      color: data["problemsSolved"] >= 3
                                          ? Color(0xFF00C853)
                                          : Color(0xffCF6455),
                                      border: BoxBorder.all(
                                        color:
                                        AppColors.secondary_black_outline,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: width / 4.5,
                                    decoration: BoxDecoration(
                                      color: data["problemsSolved"] >= 4
                                          ? Color(0xFF00C853)
                                          : Color(0xffCF6455),
                                      border: BoxBorder.all(
                                        color:
                                        AppColors.secondary_black_outline,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Ranking",
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w200,
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        data["ranking"].round().toString(),
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                          color: Color(0xff66FF00),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Rating",
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w200,
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        data["rating"].toString(),
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                          color: Color(0xff66FF00),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Time Taken",
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w200,
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        DataCleaningUser.formatTimeInSeconds(
                                            data["finishTimeInSeconds"]),
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                          color: Color(0xff66FF00),
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
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
