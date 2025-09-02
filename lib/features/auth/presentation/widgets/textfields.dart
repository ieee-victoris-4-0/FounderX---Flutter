import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NameTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const NameTextField({super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          hintText: tr(hintText),
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
    return Container(
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.email_outlined),
          hintText: tr(hintText),
        ),
      ),
    );
  }
}
class PasswordTextField extends StatelessWidget {
  final String hintText;
  final bool obsecureText;
  final bool? isConfirmation;
  final TextEditingController controller;
  const PasswordTextField({super.key, required this.hintText, required this.obsecureText,
   required this.controller, this.isConfirmation});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Transform.scale(
            scale: 0.75,
            child: (isConfirmation == null)? SvgPicture.asset('assets/auth_feature/icons/Key.svg',
            fit: BoxFit.fill,
            ): Icon(Icons.lock_outlined,
            size: 40,
            ),
          ),
          suffixIcon: (obsecureText)? Icon(Icons.visibility_outlined): Icon(Icons.visibility_off_outlined),
          hintText: tr(hintText),
        ),
        obscureText: obsecureText,
      ),
    );
  }
}
