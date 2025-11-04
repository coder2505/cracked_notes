import 'package:flutter/material.dart';

class helperWidgets {
  static Widget makeBadge(String imgUrl, bool blackAndWhite) {
    return SizedBox(
      height: 100,
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
              child: Image.network(imgUrl),
            )
          : Image.network(imgUrl),
    );
  }
}
