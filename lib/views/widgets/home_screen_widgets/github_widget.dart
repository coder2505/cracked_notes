import 'package:cracked_notes/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class GithubWidget extends CustomPainter {

  final double padding_between_cells = 4.0;
  final double padding_from_box = 16.0;
  final int columns = 15;
  final int rows = 7;
  final Map<RRect, DateTime> cellToDate = {};
  final endTime = DateTime.now();
  final double cellRadius = 25;

  final Map<DateTime, int> userCalendar;

  GithubWidget(this.userCalendar);

  Color returnColorBlue(double amount) {
    return Color.lerp(
        AppColors.app_base_blue_github, AppColors.app_highest_blue_github,
        amount) ?? AppColors.app_base_blue_github;
  }


  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();

    p.color = Color(0xFF050505);

    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    RRect rRect = RRect.fromRectAndCorners(
      rect,
      topRight: Radius.circular(25),
      topLeft: Radius.circular(25),
      bottomRight: Radius.circular(25),
      bottomLeft: Radius.circular(25),
    );
    canvas.drawRRect(rRect, p);

    Paint didSubmit = Paint();
    Paint didNotSubmit = Paint();
    didSubmit.color = AppColors.app_blue;
    didNotSubmit.color = Color(0xFF201f25);

    double availableWidth = size.width - (2 * padding_from_box);
    double availableHeight = size.height - (2 * padding_from_box);

    // Calculate cell dimensions
    double cellWidth =
        (availableWidth - (padding_between_cells * (columns - 1))) / columns;
    double cellHeight =
        (availableHeight - (padding_between_cells * (rows - 1))) / rows;

    for (int i = 0; i < columns; i++) {
      for (int j = 0; j < rows; j++) {
        double dx =
            padding_from_box + (i * (cellWidth + padding_between_cells));
        double dy =
            padding_from_box + (j * (cellHeight + padding_between_cells));

        Rect rect = Rect.fromLTWH(dx, dy, cellWidth, cellHeight);

        RRect rRect = RRect.fromRectAndCorners(
          rect,
          topRight: Radius.circular(cellRadius),
          topLeft: Radius.circular(cellRadius),
          bottomRight: Radius.circular(cellRadius),
          bottomLeft: Radius.circular(cellRadius),
        );

        DateTime time = endTime.subtract(
          Duration(days: (((columns - i -1) * rows) + (rows - j) - 1)),
        );

        cellToDate[rRect] = DateTime(time.year, time.month, time.day);

        if (userCalendar.containsKey(cellToDate[rRect])) {
          switch (userCalendar[cellToDate[rRect]]) {
            case 1:
              didSubmit.color = returnColorBlue(0);
              break;
            case 2:
              didSubmit.color = returnColorBlue(0.1);
              break;
            case 3:
              didSubmit.color = returnColorBlue(0.2);
              break;
            case 4:
              didSubmit.color = returnColorBlue(0.3);
              break;
            case 5:
              didSubmit.color = returnColorBlue(0.4);
              break;
            case 6:
              didSubmit.color = returnColorBlue(0.5);
              break;
            case 7:
              didSubmit.color = returnColorBlue(0.6);
              break;
            case 8:
              didSubmit.color = returnColorBlue(0.7);
              break;
            case 9:
              didSubmit.color = returnColorBlue(0.8);
              break;
            case 10:
              didSubmit.color = returnColorBlue(0.9);
              break;
            default:  
              didSubmit.color = returnColorBlue(1);
          }

          canvas.drawRect(rect, didSubmit);
        } else {
          canvas.drawRect(rect, didNotSubmit);
        }

        // canvas.drawRRect(rRect, p2);

      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
