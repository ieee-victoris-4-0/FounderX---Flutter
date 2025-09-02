import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpBtn extends StatelessWidget {
  final String text;
  final Function() onTap;
  const SignUpBtn({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.blue.withAlpha(30),
      highlightColor: Colors.blue.withAlpha(10),

      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Color.fromRGBO(153, 54, 219, 1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(tr(text),
          style: GoogleFonts.raleway(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(247, 247, 247, 1)
          ),
          ),
        ),
      ),
    );
  }
}