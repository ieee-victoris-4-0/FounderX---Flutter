import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class InvestorPageBar extends StatelessWidget {
  const InvestorPageBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return SizedBox(
      height: size.height*0.07,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child:InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back_ios_new, size: size.width*0.06,)),
             ),
             Expanded(
              flex: 8,
               child: Center(
                 child: Text("Investor Profile",
                 style: GoogleFonts.raleway(
                   fontSize: size.width*0.06,
                   fontWeight: FontWeight.w600,
                   color: const Color.fromRGBO(15, 15, 15, 1),
                 ),
                 ),
               ),
             ),
             Expanded(
              flex: 2,
               child:SvgPicture.asset("assets/splash_feature/Logo.svg")
                ),
        ],
      ),
        );
  }
}