import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TxtContainer1 extends StatelessWidget {
  const TxtContainer1({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                tr("onboarding1.welcome"),
                style: GoogleFonts.raleway(
                  color: Color.fromRGBO(15, 15, 15, 1),
                  fontSize: (size.width>=800)?size.width*0.06:size.width*0.07,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(height: 5,),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Founder",
                      style: GoogleFonts.raleway(
                        color: Color.fromRGBO(153, 54, 219, 1),
                        fontSize: (size.width>=800)?size.width*0.06:size.width*0.07,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: " X",
                      style: GoogleFonts.raleway(
                        color: Color.fromRGBO(81, 246, 171, 1),
                        fontSize: (size.width>=800)?size.width*0.06:size.width*0.07,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class TxtContainer2 extends StatelessWidget {
  const TxtContainer2({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
            child:
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: tr("onboarding2.welcome"),
                      style: GoogleFonts.raleway(
                        color: Color.fromRGBO(15, 15, 15, 1),
                        fontSize: (size.width>=800)?size.width*0.06:size.width*0.07,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: tr("onboarding2.aiInsights"),
                      style: GoogleFonts.raleway(
                        color: Color.fromRGBO(153, 54, 219, 1),
                        fontSize: (size.width>=800)?size.width*0.06:size.width*0.07,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ));

  }
}
class TxtContainer3 extends StatelessWidget {
  const TxtContainer3({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
            child:
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: tr("onboarding3.welcome1"),
                      style: GoogleFonts.raleway(
                        color: Color.fromRGBO(15, 15, 15, 1),
                        fontSize: (size.width>=800)?size.width*0.06:size.width*0.07,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: tr("onboarding3.welcome2"),
                      style: GoogleFonts.raleway(
                        color: Color.fromRGBO(153, 54, 219, 1),
                        fontSize: (size.width>=800)?size.width*0.06:size.width*0.07,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ));

  }
}