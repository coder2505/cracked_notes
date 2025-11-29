import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class helperWidgets {
  static Widget makeBadgeForNetworkImages(
    String imgUrl,
    bool blackAndWhite,
    double height,
  ) {
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
              imgUrl.startsWith('/static')
                  ? "https://leetcode.com$imgUrl"
                  : imgUrl,
              errorBuilder: (context, object, stackTrace) => SizedBox.shrink(),
            ),
    );
  }

  static Widget makeBadgeForAssetImages(
    Image image,
    bool blackAndWhite,
    double height,
  ) {
    return SizedBox(
      height: height,
      child: blackAndWhite
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
              child: image,
            )
          : image,
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

  static Widget contestText(
    String text,
    double size,
    FontWeight weight,
    bool color,
  ) {
    return !color
        ? Text(
            text,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: size,
              fontWeight: weight,
              color: AppColors.faded_yellow,
            ),
          )
        : ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: <Color>[Color(0xFFFFD600), Color(0xFF998000)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(bounds);
            },
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: size,
                fontWeight: weight,
                color: AppColors.faded_yellow,
              ),
            ),
          );
  }
}
