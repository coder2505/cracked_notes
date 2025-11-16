import 'dart:math' as math;

import 'package:flutter/material.dart';

class customCircles extends CustomPainter{

  final double rotationDegrees, progress;

  final List<double> rotationAnglesInDegrees = [
    0,
    45,
    90,
    135,
  ];

  customCircles({super.repaint, required this.rotationDegrees, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint();
    paint.color = Color(0x610071FF);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;
    Offset center = Offset(size.width/2, size.height/2);

    Rect ovalRect = Rect.fromCenter(
        center: center,
        width: size.width * 0.7,  // 70% of the widget width
        height: 400.0
    );

    canvas.translate(center.dx, center.dy);
    canvas.rotate(rotationDegrees);
    canvas.translate(-center.dx, -center.dy);

    final sweep = 2 * math.pi * progress;

    for (double angleDegrees in rotationAnglesInDegrees) {

      double angleRadians = angleDegrees * (math.pi / 180);

      canvas.save();

      canvas.translate(center.dx, center.dy);

      canvas.rotate(angleRadians);

      canvas.translate(-center.dx, -center.dy);

      canvas.drawArc(
        ovalRect,
        0,     // starting angle
        sweep, // animated sweep
        false,
        paint,
      );

      canvas.restore();
    }

  }

  @override
  bool shouldRepaint(covariant customCircles oldDelegate) {
    return oldDelegate.rotationDegrees != rotationDegrees;
  }

}