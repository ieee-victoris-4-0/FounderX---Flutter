import 'dart:math' as math;

import 'package:flutter/material.dart';

class PerformancePainter extends CustomPainter {
  final Map<String, double> scores;
  PerformancePainter({required this.scores});
  @override
  void paint(Canvas canvas, Size size) {
    final step = (size.width / 15).toInt();
    final allsteps = step * 5;
    final Offset center = Offset(
      ((size.width / 2).toInt()).toDouble(),
      ((size.height / 2).toInt()).toDouble(),
    );

    final newPath = Path();
    int c = 1;
    List<Offset> points = [];
    for (int i = 0; i < allsteps; i += step) {
      final path = Path();
      final int sides = 5; // خماسي
      final double radius = (step + i).toDouble();
      for (int j = 0; j <= sides; j++) {
        double angle = (2 * math.pi * j / sides) - math.pi / 2;
        double x = center.dx + radius * math.cos(angle);
        double y = center.dy + radius * math.sin(angle);
        if (i == allsteps - step && j < 5) {
          final labelSpan = TextSpan(
            text: scores.keys.elementAt(j),
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: size.width*0.03,
              fontWeight: FontWeight.w600,
            ),
          );
          final labelPainter = TextPainter(
            text: labelSpan,
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
          );
          labelPainter.layout(minWidth: 0, maxWidth: size.width);
          labelPainter.paint(
            canvas,
            (y < center.dy)
                ? Offset(
                    x -
                        ((x < center.dx)
                                ? (labelPainter.width + size.width*0.07)/2
                                :(x < center.dx)? (labelPainter.width-size.width*0.05)/2:
                                (labelPainter.width)/2
                                ) ,
                    y -
                        ((x != center.dx)
                                ? labelPainter.height + size.width*0.09
                                : labelPainter.height + size.width*0.07) /
                            2,
                  )
                : Offset(
                    x - (labelPainter.width) / 2,
                    y - (labelPainter.height - size.width*0.08) / 2,
                  ),
          );
          double xn =
              center.dx +
              (scores.values.elementAt(j) / 5) * radius * math.cos(angle);
          double yn =
              center.dy +
              (scores.values.elementAt(j) / 5) * radius * math.sin(angle);
          final offset = Offset(xn, yn);
          if (j == 0) {
            newPath.moveTo(xn, yn);
          } else {
            newPath.lineTo(xn, yn);
          }
          points.add(offset);
        }
        if (j == 0) {
          path.moveTo(x, y);
          final textSpan = TextSpan(
            text: c.toString(),
            style: TextStyle(
              color: Colors.grey,
              fontSize: size.width*0.03,
              fontWeight: FontWeight.bold,
            ),
          );
          c++;

          final textPainter = TextPainter(
            text: textSpan,
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
          );
          textPainter.layout(minWidth: 0, maxWidth: size.width);
          textPainter.paint(
            canvas,
            Offset(
              x - textPainter.width / 2,
              y - (textPainter.height - size.width*0.04) / 2,
            ),
          );
        } else {
          path.lineTo(x, y);
        }
      }
      newPath.close();
      final paint = Paint()
        ..strokeWidth = 4
        ..color = Color.fromARGB(255, 153, 54, 219)
        ..style = PaintingStyle.stroke;
      canvas.drawPath(newPath, paint);
      final paint2 = Paint()
        ..color = Colors.purple
            .withValues(alpha: 0.3) // 30% بس من اللون
        ..style = PaintingStyle.fill;
      canvas.drawPath(newPath, paint2);
      path.close();

      final borderPaint = Paint()
        ..color = Color.fromARGB(255, 150, 148, 148)
        ..strokeWidth = 3
        ..style = PaintingStyle.stroke;
      canvas.drawPath(path, borderPaint);
    }

    for (Offset offset in points) {
      final centerPaint = Paint()
        ..color = Color.fromARGB(255, 153, 54, 219)
        ..style = PaintingStyle.fill;
      canvas.drawCircle(offset, size.width*0.008, centerPaint);
      final paint = Paint()
        ..strokeWidth = size.width*0.006
        ..color = Color.fromARGB(255, 153, 54, 219)
        ..style = PaintingStyle.stroke;
      canvas.drawPath(newPath, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}