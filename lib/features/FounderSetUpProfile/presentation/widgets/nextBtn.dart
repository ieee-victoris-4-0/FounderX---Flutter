import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextBtn extends StatelessWidget {
  final String text;
  final Function() onTap;
  const NextBtn({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Color.fromRGBO(153, 54, 219, 1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(tr(text),
              style: GoogleFonts.raleway(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(247, 247, 247, 1)
                      ),),
                      SizedBox(width: 25,),
                      Icon(Icons.arrow_forward_ios,
                      color: Color.fromRGBO(247, 247, 247, 1),
                      size: 30,
                      )
            ],
          )
        ),
      ),
    );
  }
}