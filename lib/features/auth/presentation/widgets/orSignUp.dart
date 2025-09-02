import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrSignUp extends StatelessWidget {
  final String text;
  const OrSignUp({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 3,
              decoration: BoxDecoration(
                color: Color.fromRGBO(153, 54, 219, 1),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                tr(text),
                style: GoogleFonts.raleway(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(153, 54, 219, 1),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 3,
              decoration: BoxDecoration(
                color: Color.fromRGBO(153, 54, 219, 1),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
