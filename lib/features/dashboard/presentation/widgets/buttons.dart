import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
enum clickedLabel { reenter, download, none }
class Button extends StatelessWidget {
  final String text;
  final String svg;
  final clickedLabel clicked;
  final clickedLabel buttontype;
  const Button({
    super.key,
    required this.text,
    required this.svg,
    required this.clicked,
    required this.buttontype,
    
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(flex: 1, child: AnimatedContainer(
          padding: EdgeInsets.all(size.width*0.02),
          decoration: BoxDecoration(
            gradient: clicked ==buttontype ? LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(47, 229, 147, 1),
                Color.fromRGBO(153, 54, 219, 1),
              ],
            ):null,
            shape: BoxShape.circle,
          ),
          duration: Duration(milliseconds: 800),
          child: SvgPicture.asset(svg,
          height: size.height*0.1,
          ),
        )),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                text,
                style: GoogleFonts.raleway(
                  fontSize: (size.width >= 800)
                      ? size.width * 0.028
                      : size.width * 0.04,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(153, 54, 219, 1),
                ),
              ),
                            Container(
                width:size.width*0.28,
                height: size.height*0.0015,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(153, 54, 219, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
