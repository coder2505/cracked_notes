import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class helperWidgets {
  static Widget makeBadge(String imgUrl, bool blackAndWhite, double height) {
    return SizedBox(
      height: height,
      child: blackAndWhite == true
          ? ColorFiltered(
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
              child: Image.network(
                imgUrl,
                errorBuilder: (context, object, stackTrace) =>
                    SizedBox.shrink(),
              ),
            )
          : Image.network(
              imgUrl.startsWith('/static')? "https://leetcode.com$imgUrl": imgUrl,
              errorBuilder: (context, object, stackTrace) => SizedBox.shrink(),
            ),
    );
  }

  static Color returnTitleColor(String status) {
    switch (status) {
      case 'Compile Error':
      case 'Time Limit Exceeded':
        return AppColors.app_yellow;

      case 'Accepted':
        return AppColors.green_counter;
    }

    return AppColors.app_red;
  }

  static Image returnLangIcon(String lang) {
    print(lang);
    switch (lang) {
      case 'cpp':
        return Image.asset('assets/lang_icons/c++.png');
      case 'java':
        return Image.asset('assets/lang_icons/java.png');
      case 'python':
        return Image.asset('assets/lang_icons/python.png');
      case 'c':
        return Image.asset('assets/lang_icons/c_icon+.png');
    }

    return Image.asset('assets/dummy_img/q_mark.jpg');
  }
}
