import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';

class ForgetPasswordSubtitle extends StatelessWidget {
  final String subtitle;
  const ForgetPasswordSubtitle({super.key, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
        child: Text(
          tr(subtitle),
        style: GoogleFonts.raleway(
          fontSize: (size.width>=800)? size.width*0.03: size.width*0.04,
          fontWeight: FontWeight.w400,
          color: Color.fromRGBO(64, 63, 63, 1)
        ),
        textAlign: TextAlign.center,
        ),
    );
  }
}