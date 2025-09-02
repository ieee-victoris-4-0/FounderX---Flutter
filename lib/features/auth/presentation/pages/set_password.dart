import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:founderx/core/transitions/slide_page.dart';
import 'package:founderx/features/auth/presentation/pages/success.dart';
import 'package:founderx/features/auth/presentation/widgets/password_criteria.dart';
import 'package:founderx/features/auth/presentation/widgets/textfields.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/widgets/progress_bar.dart';
import '../widgets/signUpbtn.dart';

class PasswordScreen extends StatelessWidget {
  final bool isResetPassword;
  const PasswordScreen({super.key, required this.isResetPassword});

  @override
  Widget build(BuildContext context) {
    return isResetPassword ? ResetPassword() : SetPassword();
  }
}

class SetPassword extends StatelessWidget {
  SetPassword({super.key});
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SvgPicture.asset(
                'assets/auth_feature/images/background.svg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.5),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 0.8 * MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Color.fromRGBO(235, 234, 234, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment(0, -0.95),
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: ProgressBar(numOfSteps: 3),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, -0.8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Color.fromRGBO(15, 15, 15, 1),
                          ),
                        ),
                        SizedBox(width: 25),
                        Text(
                          tr("setPassword.title"),
                          style: GoogleFonts.raleway(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(15, 15, 15, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Align(
                      alignment: Alignment(0, -0.6),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 25),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  PasswordTextField(
                                    hintText: "setPassword.passwordhint",
                                    controller: passwordController,
                                    obsecureText: false,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        tr("setPassword.subtitle"),
                                        style: GoogleFonts.raleway(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(64, 63, 63, 1),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 25),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  PasswordTextField(
                                    hintText: "setPassword.passwordhint",
                                    controller: passwordConfirmationController,
                                    obsecureText: false,
                                    isConfirmation: true,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        tr("setPassword.confirmPassword"),
                                        style: GoogleFonts.raleway(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(64, 63, 63, 1),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(1, 0.2),
                    child: PasswordCriteria(),
                  ),
                  Align(
                    alignment: Alignment(0, 0.6),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: SignUpBtn(
                        text: "setPassword.reset",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(context, SlidePageRoute(pageBuilder: (context, animation, secondaryAnimation) =>
                             SuccessScreen(isResetPassword: false,)));
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );}
}

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SvgPicture.asset(
                'assets/auth_feature/images/background.svg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.5),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 0.8 * MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Color.fromRGBO(235, 234, 234, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment(0, -0.9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Color.fromRGBO(15, 15, 15, 1),
                          ),
                        ),
                        SizedBox(width: 25),
                        Text(
                          tr("resetPassword.title"),
                          style: GoogleFonts.raleway(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(15, 15, 15, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Align(
                      alignment: Alignment(0, -0.6),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 25),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  PasswordTextField(
                                    hintText: "resetPassword.passwordhint",
                                    controller: passwordController,
                                    obsecureText: false,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        tr("resetPassword.subtitle2"),
                                        style: GoogleFonts.raleway(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(64, 63, 63, 1),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 25),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  PasswordTextField(
                                    hintText: "resetPassword.passwordhint",
                                    controller: passwordConfirmationController,
                                    obsecureText: false,
                                    isConfirmation: true,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        tr("resetPassword.confirmPassword"),
                                        style: GoogleFonts.raleway(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(64, 63, 63, 1),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(1, 0.2),
                    child: PasswordCriteria(),
                  ),
                  Align(
                    alignment: Alignment(0, 0.6),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: SignUpBtn(
                        text: "resetPassword.reset",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(context, SlidePageRoute(pageBuilder: (context, animation, secondaryAnimation) =>
                             SuccessScreen(isResetPassword: true,)));
                            
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
