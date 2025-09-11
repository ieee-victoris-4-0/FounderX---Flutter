import 'package:flutter/material.dart';

class ScoreContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = RRect.fromLTRBAndCorners(
      0,
      0,
      size.width,
      size.height,
      topLeft: Radius.circular(15),
      topRight: Radius.circular(15),
      bottomLeft: Radius.circular(15),
      bottomRight: Radius.circular(15),
    );

    final backgroundPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01;

    canvas.drawRRect(rect, backgroundPaint);

    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(47, 229, 147, 1),
        Color.fromRGBO(114, 9, 183, 1),
      ],
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect.outerRect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01
      ..strokeCap = StrokeCap.butt;

    canvas.drawRRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}