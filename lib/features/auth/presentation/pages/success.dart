import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessScreen extends StatelessWidget {
  final bool isResetPassword;
  const SuccessScreen({super.key, required this.isResetPassword});

  @override
  Widget build(BuildContext context) {
    return isResetPassword ? ResetPasswordSuccessScreen() : SetPasswordSuccessScreen();
  }
}
class ResetPasswordSuccessScreen extends StatelessWidget {
  const ResetPasswordSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(47, 229, 147, 1),
            Color.fromRGBO(114, 9, 183, 1),
          ],
        ),
      ),
      child:Stack(
        children: [
          Align(
            alignment: Alignment(0,-0.3),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/auth_feature/gif/success.gif',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0,0.7),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    tr("Password_reset_successfully.title"),
                    style: GoogleFonts.raleway(
                      decoration: TextDecoration.none,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(247, 247, 247, 1),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    tr("Password_reset_successfully.subtitle"),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                      decoration: TextDecoration.none,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(247, 247, 247, 1),
                    ),
                  ),
                ],
              ),
            )
          )
        ],
      )
    );
  }
}
class SetPasswordSuccessScreen extends StatelessWidget {
  const SetPasswordSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(47, 229, 147, 1),
            Color.fromRGBO(114, 9, 183, 1),
          ],
        ),
      ),
      child:Stack(
        children: [
          Align(
            alignment: Alignment(0,-0.3),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/auth_feature/gif/success.gif',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0,0.7),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    tr("Account_created_successfully.title"),
                    style: GoogleFonts.raleway(
                      decoration: TextDecoration.none,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(247, 247, 247, 1),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    tr("Account_created_successfully.subtitle"),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                      decoration: TextDecoration.none,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(247, 247, 247, 1),
                    ),
                  ),
                ],
              ),
            )
          )
        ],
      )
    );
  
  }
}