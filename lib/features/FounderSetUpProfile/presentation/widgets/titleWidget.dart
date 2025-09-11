import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWidgetWithBack extends StatelessWidget {
  const TitleWidgetWithBack({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: size.height*0.07,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Color.fromRGBO(15, 15, 15, 1),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Text(
              tr("inputForm.title"),
              style: GoogleFonts.raleway(
                fontSize: size.width*0.05,
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(15, 15, 15, 1),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              height: size.height*0.07,
              child: SvgPicture.asset('assets/splash_feature/Logo.svg',fit: BoxFit.contain,
                
                ),
            ),
          ),
        ],
      ),
    );
  }
}

class TitleWidgetWithoutBack extends StatelessWidget {
  const TitleWidgetWithoutBack({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return SizedBox(
      height: size.height*0.07,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            tr("InputTeqnuiqe.title"),
            style: GoogleFonts.raleway(
              fontSize: size.width*0.05,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(15, 15, 15, 1),
            ),
          ),

        ],
      ),
    );
  }
}
