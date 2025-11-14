import 'package:cracked_notes/core/extensions/extensions.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/theme/app_colors.dart';

class userStatWidget3 {

  static Widget noContestData_Widget(BuildContext context) {
    return Container(
      decoration: context.containerDecoration,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          spacing: 10,
          children: [

            SizedBox(
                width: 100, child: Image.asset('assets/dummy_img/trophy.png')),
            Expanded(
              child: Text(
                "Your contest stats are waiting — compete once to reveal them!",
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.faded_yellow
                ),),
            )

          ],

        ),
      ),
    );
  }

  static Widget noProblemSolved(BuildContext context){

    return Container(

      decoration: context.containerDecoration,
      child: Padding(padding: EdgeInsets.all(16), child: Row(

        children: [

          SizedBox(
              width: 100, child: Image.asset('assets/dummy_img/stats.png')),
          Expanded(
            child: Text(
              "Your learning stats are hidden — crack your first problem to open them.",
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.faded_yellow
              ),),
          )

        ],


      ),),

    );

  }

}