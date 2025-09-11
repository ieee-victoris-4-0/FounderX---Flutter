import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Align(
      alignment: Alignment(0, -0.8),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: size.width*0.02,
        ),
        width: size.width,
        height: size.height*0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Expanded(
              flex: 1,
              child:
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.arrow_back_ios_new,
                  color: Colors.black,
                  size: size.width*0.1,
                  ),
                ),
                Text(tr("loadingPage.title"),
                style: GoogleFonts.raleway(
                  fontSize: size.width*0.05,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                ),

                  SizedBox(
                    width: size.width*0.15,
                    child: SvgPicture.asset("assets/splash_feature/Logo.svg",
                    fit: BoxFit.contain,
                    ),
                  ),
              ],
              )
              ),
            Expanded(
              flex: 4,
              child: Image.asset("assets/core/loading.gif")),
            Expanded(
              flex: 1,
              child: Text(tr("loadingPage.subtitle"),
              style: GoogleFonts.raleway(
                fontSize: size.width*0.05,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              ),
            ),
            
            
            
            ],
          )
      
      
      ),
    );
  }
}