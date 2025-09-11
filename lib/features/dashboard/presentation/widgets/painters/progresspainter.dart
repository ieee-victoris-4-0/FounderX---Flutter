import 'dart:math' as math;

import 'package:flutter/material.dart';

class RingProgressPainter extends CustomPainter {
  final double progress;
  RingProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2)-size.width*0.1;

    final backgroundPaint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.1;

    canvas.drawCircle(center, radius, backgroundPaint);

    final rect = Rect.fromCircle(center: center, radius: radius);
    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(47, 229, 147, 1),
        Color.fromRGBO(114, 9, 183, 1),
      ],
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.1
      ..strokeCap = StrokeCap.butt;

    // نرسم قوس (Arc) بنسبة progress
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi/2, // البداية من فوق
      -math.pi * 2 * progress, // زاوية النسبة
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}