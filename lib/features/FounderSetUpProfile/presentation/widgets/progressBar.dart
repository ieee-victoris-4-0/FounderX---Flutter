import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Progressbar extends StatelessWidget {
  final String step;
  final String percentage;
  final double widthFactor;
  const Progressbar({super.key, required this.step, required this.percentage, required this.widthFactor});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: [
              Text(tr(step),
              style: GoogleFonts.raleway(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(64, 63, 63, 1)
              ),
              ),
              Text(tr(percentage),
              style: GoogleFonts.raleway(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(64, 63, 63, 1)
              ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,

                  height: 10,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(227, 189, 253, 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: FractionallySizedBox(
                    widthFactor: widthFactor,
                    heightFactor: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(153, 54, 219, 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}