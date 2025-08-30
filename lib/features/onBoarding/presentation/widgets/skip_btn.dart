import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkipBtn extends StatelessWidget {
  const SkipBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: 100,
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Color.fromRGBO(153, 54, 219, 1), width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            tr("onboarding1.skip"),
            style: GoogleFonts.raleway(
              color: Color.fromRGBO(153, 54, 219, 1),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
