import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpWidget extends StatelessWidget {
  final Function(String) onSubmit;
  const OtpWidget({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return SizedBox(
      width: (size.width>=800)?400:300,
      height: (size.width>=800)?80:50,
      child: OtpTextField(
        
        borderColor: Color.fromRGBO(153, 54, 219, 1),
        borderWidth: 2,
        enabled: true,
        enabledBorderColor: Color.fromRGBO(153, 54, 219, 1),
        borderRadius: BorderRadius.circular(8),
        showFieldAsBox: true,
        fieldWidth: (size.width>=800)?80:50,
        fieldHeight: (size.width>=800)?80:50,
        keyboardType: TextInputType.number,
        numberOfFields: 4,
        cursorColor: Color.fromRGBO(153, 54, 219, 1),
        onSubmit: onSubmit,
      )
    );
  }
}