import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'painters/progresspainter.dart';

class ScoreContainerContent extends StatelessWidget {
  final String title;
  final String strength;
  final String advice;
  final double score;
  const ScoreContainerContent({
    super.key,
    required this.title,
    required this.strength,
    required this.advice,
    required this.score,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Padding(

              padding: const EdgeInsets.only(left:15,top: 15 ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      title,
                      style: GoogleFonts.raleway(
                        fontSize: (size.width >= 800)
                            ? size.width * 0.028
                            : size.width * 0.045,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(153, 54, 219, 1),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 7),
                                child: SvgPicture.asset("assets/dashboard_feature/strength.svg",
                                width: size.width*0.04,
                                ),
                              ),
                              
                              SingleChildScrollView(
                                child: Text(
                                  "Strength",
                                  style: GoogleFonts.raleway(
                                    fontSize: (size.width >= 800)
                                        ? size.width * 0.03
                                        : size.width * 0.04,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(15, 15, 15, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            strength,
                            style: GoogleFonts.raleway(
                              fontSize: (size.width >= 800)
                                  ? size.width * 0.028
                                  : size.width * 0.035,
                              fontWeight: FontWeight.w300,
                              color: Color.fromRGBO(64, 63, 63, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 7),
                                child: SvgPicture.asset("assets/dashboard_feature/advice.svg",
                                width: size.width*0.05,
                                ),
                              ),
                              Text(
                                "Advice",
                                style: GoogleFonts.raleway(
                                  fontSize: (size.width >= 800)
                                      ? size.width * 0.03
                                      : size.width * 0.04,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(15, 15, 15, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: SingleChildScrollView(
                            child: Text(
                              advice,
                              style: GoogleFonts.raleway(
                                fontSize: (size.width >= 800)
                                    ? size.width * 0.028
                                    : size.width * 0.035,
                                fontWeight: FontWeight.w300,
                                color: Color.fromRGBO(64, 63, 63, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: CustomPaint(
                painter: RingProgressPainter(((score * 2) / 10)),
                child: Container(
                  alignment: Alignment.center,
                  child: ShaderMask(
                    shaderCallback: (bounds) =>
                        LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(47, 229, 147, 1),
                            Color.fromRGBO(114, 9, 183, 1),
                          ],
                        ).createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                        ),
                    child: Text(
                      "${score.toStringAsFixed(1)}/5",
                      style: GoogleFonts.raleway(
                        fontSize: (size.width >= 800)
                            ? size.width * 0.04
                            : size.width * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
