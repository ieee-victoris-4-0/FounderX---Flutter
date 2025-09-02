import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWidgetWithBack extends StatelessWidget {
  const TitleWidgetWithBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 70,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Color.fromRGBO(15, 15, 15, 1),
            ),
          ),
          Text(
            tr("inputForm.title"),
            style: GoogleFonts.raleway(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(15, 15, 15, 1),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 30),
            width: 80,
            child: SvgPicture.asset('assets/splash_feature/Logo.svg'),
          ),
        ],
      ),
    );
  }
}

class TitleWidgetWithoutBack extends StatelessWidget {
  const TitleWidgetWithoutBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 50,
      margin: EdgeInsets.only(left: screenWidth / 6),
      child: Row(
        children: [
          Text(
            tr("InputTeqnuiqe.title"),
            style: GoogleFonts.raleway(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(15, 15, 15, 1),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 30),
            width: 80,
            child: SvgPicture.asset('assets/splash_feature/Logo.svg'),
          ),
        ],
      ),
    );
  }
}
