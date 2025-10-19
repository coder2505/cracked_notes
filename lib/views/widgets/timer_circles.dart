import 'package:cracked_notes/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as Math;

class TimerCircles extends CustomPainter {

  final double outerRadius = 45;
  final double innerRadius = 38;
  final double startPoint = (3*Math.pi) / 2;
  final double endPoint = Math.pi;
  final double percentage  = 100.0;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Paint timer = Paint();

    paint.strokeWidth = 2;
    paint.color = Color.fromARGB(100, 0, 0, 0);
    paint.style = PaintingStyle.stroke;

    timer.strokeWidth = 7;
    timer.color = AppColors.app_red;
    timer.style = PaintingStyle.stroke;


    canvas.drawCircle(Offset(size.width / 2, size.height / 2), outerRadius, paint);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), innerRadius, paint);
    canvas.drawArc(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: (outerRadius+innerRadius)/2),
        startPoint,endPoint, false, timer);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
