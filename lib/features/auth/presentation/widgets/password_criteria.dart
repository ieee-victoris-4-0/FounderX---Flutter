import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordCriteria extends StatelessWidget {
  final Map passwordRef;
  const PasswordCriteria({super.key,
  required this.passwordRef,
   });

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(Icons.check_circle_rounded,
              color:(passwordRef["c1"]==0)? Color.fromRGBO(64, 63, 63, 1):Colors.greenAccent,
              weight: 20,
              

              ),
              SizedBox(width: 10,),
              Text(tr("password_criteria.1"),
              style: GoogleFonts.raleway(
                fontSize: size.width*0.03,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(64, 63, 63, 1)
              ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Icon(Icons.check_circle_rounded,
              color:(passwordRef["c2"]==0)? Color.fromRGBO(64, 63, 63, 1):Colors.greenAccent,
              weight: 20,
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Text(tr("password_criteria.2"),
                softWrap: true,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.raleway(
                  fontSize: size.width*0.03,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(64, 63, 63, 1)
                ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Icon(Icons.check_circle_rounded,
              color:(passwordRef["c3"]==0)? Color.fromRGBO(64, 63, 63, 1):Colors.greenAccent,
              weight: 20,
              ),
              SizedBox(width: 10,),
              Text(tr("password_criteria.3"),
              style: GoogleFonts.raleway(
                fontSize: size.width*0.03,
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