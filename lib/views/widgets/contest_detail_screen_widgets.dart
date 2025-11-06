import 'package:cracked_notes/core/extensions/extensions.dart';
import 'package:flutter/cupertino.dart';

import '../../core/theme/app_colors.dart';

class ContestDetailScreenWidgets{

  static userInfo(Map<String, dynamic> data, BuildContext context){

    return  Container(
      decoration: context.containerDecoration,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Contest Attended",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Inter',
                    color: AppColors.faded_yellow,
                  ),
                ),
                Expanded(child: SizedBox()),
                Text(data["contestAttend"].toString(),  style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Inter',
                  color: AppColors.faded_yellow,
                  fontWeight: FontWeight.w600,
                )),
              ],
            ),
            Row(
              children: [
                Text(
                  "Participants",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Inter',
                    color: AppColors.faded_yellow,
                  ),
                ),
                Expanded(child: SizedBox()),
                Text(data["totalParticipants"].toString(),  style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Inter',
                  color: AppColors.faded_yellow,
                  fontWeight: FontWeight.w600,
                )),
              ],
            ),
            Row(
              children: [
                Text(
                  "Contest Rating",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Inter',
                    color: AppColors.faded_yellow,
                  ),
                ),
                Expanded(child: SizedBox()),
                Text(data["contestRating"].toString(),  style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Inter',
                  color: AppColors.faded_yellow,
                  fontWeight: FontWeight.w600,
                )),
              ],
            ),
            Row(
              children: [
                Text(
                  "Global Ranking",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Inter',
                    color: AppColors.faded_yellow,
                  ),
                ),
                Expanded(child: SizedBox()),
                Text(data["contestGlobalRanking"].toString(),  style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Inter',
                  color: AppColors.faded_yellow,
                  fontWeight: FontWeight.w600,
                )),
              ],
            ),
            Row(
              children: [
                Text(
                  "Top Percentage",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Inter',
                    color: AppColors.faded_yellow,
                  ),
                ),
                Expanded(child: SizedBox()),
                Text("${(data["contestTopPercentage"]*10).toString()} %",  style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Inter',
                  color: AppColors.faded_yellow,
                  fontWeight: FontWeight.w600,
                )),
              ],
            ),
          ],
        ),
      ),
    );

  }

}