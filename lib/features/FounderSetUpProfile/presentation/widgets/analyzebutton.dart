import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/blocs/states.dart';
import 'package:google_fonts/google_fonts.dart';

class Analyzebutton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final ButtonState state;
  const Analyzebutton({super.key, required this.onTap,
   required this.text, required this.state});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors:(state is EnabledButtonState)? [
              Color.fromRGBO(47, 229, 147, 1),
              Color.fromRGBO(153, 54, 219, 1),
            ]: [
              Color.fromRGBO(110, 109, 109, 1),
              Color.fromRGBO(110, 109, 109, 1),
            ],
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(tr(text),
              style: GoogleFonts.raleway(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(247, 247, 247, 1)
              ),
              
              ),
              SizedBox(width: 10,),
              Icon(Icons.arrow_forward_ios,
              color: Color.fromRGBO(247, 247, 247, 1),
              size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}