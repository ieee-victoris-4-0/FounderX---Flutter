import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:founderx/features/auth/domain/entity/auth_entity.dart';
import 'package:google_fonts/google_fonts.dart';

class NameTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const NameTextField({super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
      child: TextFormField(
        validator: (value) {
          if(!AuthEntity(fullName: value).hasValidFullName){
            return "Please enter a valid name which contains at least 2 words";
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
          prefixIcon: Icon(Icons.person),
          hintText: tr(hintText),
          hintStyle: GoogleFonts.raleway(
            fontSize: size.width*0.04,
            fontWeight: FontWeight.w500,
            color: Colors.black45,
          ),
        ),
      ),
    );
  }
}
class EmailTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const EmailTextField({super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
      child: TextFormField(
        validator: (value) {
          if(!AuthEntity(email: value).hasValidEmail){
            return "Please enter a valid email";
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
          prefixIcon: Icon(Icons.email_outlined),
          hintText: tr(hintText),
          hintStyle: GoogleFonts.raleway(
            fontSize: size.width*0.04,
            fontWeight: FontWeight.w500,
            color: Colors.black45,
          ),
        ),
      ),
    );
  }
}
class PasswordTextField extends StatelessWidget {
  final FormFieldValidator<String> validator;
  final Function()? onTapIcon;
  final String hintText;
  final bool obsecureText;
  final bool? isConfirmation;
  final TextEditingController controller;
  final  Function(String) onChanged;
  final Function()? onTap;
  final void Function(String)? onsubmit;
  final void Function(PointerEvent)? onTapOutside;
  const PasswordTextField({super.key, required this.hintText, required this.obsecureText,
   required this.controller, this.isConfirmation, required this.onChanged, this.onTap, this.onsubmit, this.onTapOutside, this.onTapIcon,
   required this.validator
   });

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
      child: TextFormField(
        validator: validator,
        onFieldSubmitted: onsubmit,
        onTapOutside: onTapOutside,
        onTap: onTap,
        controller: controller,
        onChanged: onChanged,
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
          prefixIcon: Transform.scale(
            scale: 0.75,
            child: (isConfirmation == null)? SvgPicture.asset('assets/auth_feature/icons/Key.svg',
            fit: BoxFit.fill,
            ): Icon(Icons.lock_outlined,
            size: 40,
            ),
          ),
          suffixIcon:  InkWell(
            onTap:onTapIcon,
            child:(!obsecureText)? Icon(Icons.visibility_outlined): Icon(Icons.visibility_off_outlined)),
          hintText: tr(hintText),
          hintStyle: GoogleFonts.raleway(
            fontSize: size.width*0.04,
            fontWeight: FontWeight.w500,
            color: Colors.black45,
          ),
        ),
        obscureText: obsecureText,
      ),
    );
  }
}
