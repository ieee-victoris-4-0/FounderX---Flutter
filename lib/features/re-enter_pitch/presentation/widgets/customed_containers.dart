import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../blocs/states.dart';

class SelectableContainer extends StatelessWidget {
  const SelectableContainer({super.key, required this.field, required this.onTap, required this.state, required this.svg});
  final String field;
  final Function() onTap;
  final SelectedContainerState state;
  final String svg;

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.only(left: 10),
      height: size.height*0.07,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color.fromRGBO(153, 54, 219, 1,),
        width: (state.choosenContainerField == field)? 3:1,
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(svg,
          width: 40,
          ),
          SizedBox(width: 15,),
          Text(tr(field),
          style: GoogleFonts.raleway(
            fontSize: size.width*0.04,
            fontWeight: FontWeight.w500,
            color:Color.fromRGBO(19, 22, 12, 1)
          ),
          ),
        ],
      )
    ),
  );}
}
class MultiselectionContainer extends StatelessWidget {
  final SelectedContainerState state;
  final String field;
  final String svg;
  final Function() onTap;
  const MultiselectionContainer({super.key, required this.state,
   required this.field, required this.svg, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        height: size.height*0.07,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color.fromRGBO(153, 54, 219, 1,),
          width: (state.choosenContainerField==field)? size.width*0.005:size.width*0.002,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(svg,
                width: size.width*0.06,
                ),
                SizedBox(width: 15,),
                Text(tr(field),
                style: GoogleFonts.raleway(
                  fontSize: size.width*0.04,
                  fontWeight: FontWeight.w500,
                  color:Color.fromRGBO(19, 22, 12, 1)
                ),
                ),
              ],
            ),
            (state.choosenContainerField==field)? Icon(Icons.check_circle,
            color: Color.fromRGBO(153, 54, 219, 1,),
            
            size:size.width*0.05,
            ):Container(
              width: size.width*0.04,
              height: size.width*0.04,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color.fromRGBO(153, 54, 219, 1,),
                width: size.width*0.005,
                ),
              ),  
            ),
          ],
        ),
      ),
    );
  }
}