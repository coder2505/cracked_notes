import 'dart:math' as math;

import 'package:flutter/material.dart';

class customCircles extends CustomPainter{

  final List<double> rotationAnglesInDegrees = [
    0,    // 0 degrees
    45,   // 45 degrees
    90,   // 90 degrees
    135,  // 135 degrees
  ];

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

    for (double angleDegrees in rotationAnglesInDegrees) {

      double angleRadians = angleDegrees * (math.pi / 180);

      canvas.save();

      canvas.translate(center.dx, center.dy);

      canvas.rotate(angleRadians);

      canvas.translate(-center.dx, -center.dy);

      Path path = Path();
      path.addOval(ovalRect);

      canvas.drawPath(path, paint);
      canvas.restore();
    }

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
  
}