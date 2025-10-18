import 'package:cracked_notes/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class GithubWidget extends CustomPainter {
  final double padding_between_cells = 4.0;
  final double padding_from_box = 12.0;
  final int columns = 15;
  final int rows = 7;

  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();

    p.color = AppColors.app_blue;

    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    RRect rRect = RRect.fromRectAndCorners(
      rect,
      topRight: Radius.circular(25),
      topLeft: Radius.circular(25),
      bottomRight: Radius.circular(25),
      bottomLeft: Radius.circular(25),
    );
    canvas.drawRRect(rRect, p);

    Paint p1 = Paint();
    p1.color = Color(0xfffdf4e3);

    // Paint p2 = Paint();
    // p2.color = AppColors.app_trans_blue;
    // p2.style = PaintingStyle.stroke;

    // Calculate available space after accounting for box padding
    double availableWidth = size.width - (2 * padding_from_box);
    double availableHeight = size.height - (2 * padding_from_box);

    // Calculate cell dimensions
    double cellWidth =
        (availableWidth - (padding_between_cells * (columns - 1))) / columns;
    double cellHeight =
        (availableHeight - (padding_between_cells * (rows - 1))) / rows;

    for (int i = 0; i < columns; i++) {
      for (int j = 0; j < rows; j++) {
        double dx = padding_from_box + (i * (cellWidth + padding_between_cells));
        double dy = padding_from_box + (j * (cellHeight + padding_between_cells));

        Rect rect = Rect.fromLTWH(dx, dy, cellWidth, cellHeight);

        RRect rRect = RRect.fromRectAndCorners(
          rect,
          topRight: Radius.circular(1),
          topLeft: Radius.circular(1),
          bottomRight: Radius.circular(1),
          bottomLeft: Radius.circular(1),
        );
        canvas.drawRRect(rRect, p1);
        // canvas.drawRRect(rRect, p2);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}