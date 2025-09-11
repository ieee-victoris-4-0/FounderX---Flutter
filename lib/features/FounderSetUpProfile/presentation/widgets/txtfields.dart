import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
   const CustomTextField({super.key, required this.hint, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return tr("errormesseges.empty");
          }
          return null;
        },
        controller: controller,
        
        decoration: InputDecoration(
           enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 1,
              color: Color.fromRGBO(223, 175, 255, 1),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 2,
              color: Color.fromRGBO(223, 175, 255, 1),
            ),
          ),
          hintText: tr(hint), 
          hintStyle: GoogleFonts.raleway(
            fontSize: MediaQuery.of(context).size.width*0.04,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(15, 15, 15, 1)
          ),
        ),
      ),
    );
  }
}