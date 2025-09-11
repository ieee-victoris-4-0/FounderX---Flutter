import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/download_pdf/success.svg"),
            Padding(
              padding: EdgeInsets.only(
                top: size.height*0.05,
              ),
              child: Text(tr("loadingPage.done"),style: GoogleFonts.raleway(
                fontSize: size.width*0.06,
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(0, 0, 0, 1),
              ),),
            )
          ],
        ),
      ),
    );
  }
}
