import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
enum Drop{
  down,
  up,
}
class RolesContainer extends StatelessWidget {
   const RolesContainer({super.key, required this.txt, required this.drop, required this.onTap});
   final String txt;
   final Drop drop;
   final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {

    final size=MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: size.height*0.06,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color.fromRGBO(223, 175, 255, 1),
        width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(txt,
          style: GoogleFonts.raleway(
            fontSize: size.width*0.04,
            fontWeight: FontWeight.w400,
            color:Color.fromRGBO(110, 109, 109, 1) 
          ),
          ),
          InkWell(
            onTap: onTap,
            child: Icon((drop==Drop.down)?Icons.arrow_drop_down_outlined:Icons.arrow_drop_up_outlined,
            size: size.width*0.08,
            color: Color.fromRGBO(153, 54, 219, 1),
            ),
          ),
        ],
      ),
    );
  }
}