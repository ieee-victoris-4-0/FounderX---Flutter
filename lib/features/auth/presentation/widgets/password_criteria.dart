import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordCriteria extends StatelessWidget {
  const PasswordCriteria({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(Icons.check_circle_outline,
              color: Color.fromRGBO(64, 63, 63, 1),
              weight: 20,
              

              ),
              SizedBox(width: 10,),
              Text(tr("password_criteria.1"),
              style: GoogleFonts.raleway(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(64, 63, 63, 1)
              ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Icon(Icons.check_circle_outline,
              color: Color.fromRGBO(64, 63, 63, 1),
              weight: 20,
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Text(tr("password_criteria.2"),
                softWrap: true,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textScaler: TextScaler.linear(0.9),
                style: GoogleFonts.raleway(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(64, 63, 63, 1)
                ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Icon(Icons.check_circle_outline,
              color: Color.fromRGBO(64, 63, 63, 1),
              weight: 20,
              ),
              SizedBox(width: 10,),
              Text(tr("password_criteria.3"),
              style: GoogleFonts.raleway(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(64, 63, 63, 1)
              ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}