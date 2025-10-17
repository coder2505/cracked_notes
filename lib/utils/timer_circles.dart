import 'package:flutter/material.dart';

class TimerCircles extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.strokeWidth = 2;
    paint.color = Color.fromARGB(100, 0, 0, 0);
    paint.style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 45, paint);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 38, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw UnimplementedError();
  }
}
