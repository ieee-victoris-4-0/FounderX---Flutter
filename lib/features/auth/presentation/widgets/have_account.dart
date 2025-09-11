import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccount extends StatelessWidget {
  final String text;
  final String textbtn;
  final Function() onTap;
  const AlreadyHaveAccount({super.key, required this.text, required this.textbtn, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(text: tr(text),
                style: TextStyle(
                  fontSize: size.width*0.04,
                  color: Color.fromRGBO(15, 15, 15, 1),
                  fontWeight: FontWeight.w500,
                ),
            ),
            TextSpan(
              text: tr(textbtn),
              style: TextStyle(
                fontSize: size.width*0.04,
                color: Color.fromRGBO(153, 54, 219, 1),
                fontWeight: FontWeight.w500,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}