import 'dart:math' as math;
import 'package:flutter/material.dart';
class DashboardScreen extends StatelessWidget {
   DashboardScreen({super.key});
 final Map<String, double> scores={
    "Market":5,
    "Team":5,
    "Competition":5,
    "Financials":5,
    "Traction\n/GTM":5,
  };
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: CustomPaint(
          size: Size(size.width, size.width),
          painter: PentagonPainter(scores: scores),
        ),
      ),
    );
  }
}

class PentagonPainter extends CustomPainter {
  final Map<String, double> scores;
  PentagonPainter({required this.scores});
  @override
  void paint(Canvas canvas, Size size) {
    
    final step = (size.width / 15).toInt();
    final allsteps = step*5;
    final Offset center = Offset(((size.width / 2).toInt()).toDouble(), ((size.height / 2).toInt()).toDouble());

    final newPath=Path();
    int c=1;
    List<Offset> points=[];
    for (int i = 0; i < allsteps; i +=step) {
      final path = Path();
      final int sides = 5; // خماسي
      final double radius = (step + i).toDouble();
      for (int j = 0; j <= sides; j++) {
        double angle = (2 * math.pi * j / sides) - math.pi / 2;
        double x = center.dx + radius * math.cos(angle);
        double y = center.dy + radius * math.sin(angle);
       if(i==allsteps-step && j<5){
        final labelSpan = TextSpan(
      text: scores.keys.elementAt(j),
      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)
      , fontSize: 14, fontWeight: FontWeight.w600),
      
    );    
    final labelPainter = TextPainter(
      text: labelSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
        labelPainter.layout(minWidth: 0, maxWidth: size.width);
    labelPainter.paint(
      canvas,
      (y<center.dy)?
      Offset(x - ((x<center.dx)?labelPainter.width+40:labelPainter.width) / 2, y - ((x!=center.dx)?labelPainter.height+60:labelPainter.height+20) / 2):
      Offset(x - (labelPainter.width) / 2, y - (labelPainter.height-40) / 2),
    );
          double xn=center.dx + (scores.values.elementAt(j)/5)*radius * math.cos(angle);
          double yn=center.dy + (scores.values.elementAt(j)/5)*radius * math.sin(angle);
          final offset=Offset(xn, yn);
          if(j==0){
            newPath.moveTo(xn, yn);
          }else{
            newPath.lineTo(xn, yn);
          }
          points.add(offset);          
        }
        if (j == 0) {
      path.moveTo(x, y);
      final textSpan = TextSpan(
      text: c.toString(),
      style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
      
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
      Offset(x - textPainter.width / 2, y - (textPainter.height-22) / 2),
    );
        } else {
      path.lineTo(x, y);
        }
      }
      newPath.close();
          final paint=Paint()
            ..strokeWidth=4
            ..color=Color.fromARGB(255, 153, 54, 219)
            ..style=PaintingStyle.stroke;
          canvas.drawPath(newPath, paint);
          final paint2=Paint()
            ..color = Colors.purple.withValues(alpha: 0.3) // 30% بس من اللون
            ..style = PaintingStyle.fill;
          canvas.drawPath(newPath, paint2);
      path.close();

      final borderPaint = Paint()
        ..color = Color.fromARGB(255, 150, 148, 148)
        ..strokeWidth = 3
        ..style = PaintingStyle.stroke;
      canvas.drawPath(path, borderPaint);
      }
      
      for(Offset offset in points){
                final centerPaint = Paint()
            ..color = Color.fromARGB(255, 153, 54, 219)
            ..style = PaintingStyle.fill;
          canvas.drawCircle(offset, 4, centerPaint);
          final paint=Paint()
            ..strokeWidth=4
            ..color=Color.fromARGB(255, 153, 54, 219)
            ..style=PaintingStyle.stroke;
          canvas.drawPath(newPath, paint);
    }

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
