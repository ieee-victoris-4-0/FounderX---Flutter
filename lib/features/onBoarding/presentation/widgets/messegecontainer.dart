import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessegeContainer extends StatelessWidget {
  final String messege;
  const MessegeContainer({super.key, required this.messege});
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            tr(messege),
            style: GoogleFonts.raleway(
              color: Color.fromRGBO(15, 15, 15, 1),
              fontSize: (size.width>=800)?size.width*0.04:size.width*0.05,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}