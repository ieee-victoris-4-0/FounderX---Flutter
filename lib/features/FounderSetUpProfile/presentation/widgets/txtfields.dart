import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
   CustomTextField({Key? key, required this.hint, required this.controller}) : super(key: key);

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
          hintText: tr(hint), 
        ),
      ),
    );
  }
}