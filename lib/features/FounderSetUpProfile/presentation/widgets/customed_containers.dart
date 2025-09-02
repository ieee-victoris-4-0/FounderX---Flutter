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
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.only(left: 10),
      height: 60,
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
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color:Color.fromRGBO(19, 22, 12, 1)
          ),
          ),
        ],
      )
    ),
  );}
}