import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:google_fonts/google_fonts.dart';
enum pages{
  problem,
  stage,
  target,
}
class EditContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final String svg;
  final void Function()? onTap;
  const EditContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.svg,
    this.onTap,    

  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height*0.1,
        margin: EdgeInsets.symmetric(vertical: size.height*0.02),
        padding: EdgeInsets.all(size.height*0.01),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color.fromRGBO(188, 108, 242, 1), width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: SvgPicture.asset(svg)),
            Expanded(flex: 7, child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(tr(title),
                  style: GoogleFonts.raleway(
                    fontSize: size.width*0.035,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(15, 15, 15, 1),
                  ),
                  ),
                  Text(tr(subtitle),
                  style: GoogleFonts.raleway(
                    fontSize: size.width*0.03,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(64, 63, 63, 1),
                  ),
                  ),
                ],
              ),
            )),
            Expanded(flex: 1, child: InkWell(
              onTap: onTap,
              child: Icon(Icons.edit,
              color: Color.fromRGBO(153, 54, 219, 1),
              size: size.width*0.05,
              ),
            )),
          ],
        ),
      
    );
  }
}
