import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:founderx/core/transitions/slide_page.dart';
import 'package:founderx/core/widgets/progress_bar.dart';
import 'package:founderx/features/auth/presentation/pages/set_password.dart';
import 'package:founderx/features/auth/presentation/widgets/otp_widget.dart';
import 'package:founderx/features/auth/presentation/widgets/signUpbtn.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/forget_password_subtitle.dart';
class VerificationCode extends StatelessWidget {
  final TextEditingController codeController = TextEditingController();
  final bool isResetPassword;
  VerificationCode({super.key, required this.isResetPassword});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
resizeToAvoidBottomInset: false,
      body:Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SvgPicture.asset('assets/auth_feature/images/background.svg',
              fit: BoxFit.fill,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0,-0.3),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 0.5*MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Color.fromRGBO(235, 234, 234, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  (isResetPassword)?SizedBox.shrink():Align(
                    alignment: Alignment(0, -0.9),
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: ProgressBar(numOfSteps: 2),
                    ),
                  ),
                    Align(
                      alignment: Alignment(0,-0.7),
                      child:
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back_ios,
                              color: Color.fromRGBO(15, 15, 15, 1),
                              ),
                            ),
                            SizedBox(width: 25,),
                            Text(tr("VerificationCode.title"),
                            style: GoogleFonts.raleway(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(15, 15, 15, 1)
                            ),
                            ),
                          ],
                        ),
                      )
                    ),
                    Align(
                      alignment: Alignment(0,-0.5),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: ForgetPasswordSubtitle(subtitle: "VerificationCode.subtitle"),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0,-0.3),
                      child:Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: OtpWidget(onSubmit: (code){
                          
                        }),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0,0.6),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child:SignUpBtn(text: "VerificationCode.verify", onTap: (){
                          Navigator.push(context, SlidePageRoute(pageBuilder: (context, animation, secondaryAnimation) =>
                           PasswordScreen(isResetPassword: isResetPassword,)));
                        }),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0,0.8),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child:RichText(text: TextSpan(children: [
                          TextSpan(text: tr("VerificationCode.havent"),style: GoogleFonts.raleway(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(15, 15, 15, 1)
                        )),
                        TextSpan(text: tr("VerificationCode.resend"),style: GoogleFonts.raleway(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(153, 54, 219, 1)
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = (){},
                        )
                        ])),
                      ),
                    ),
                ],
              ),
            )
          )
        ],
      ),
    );
  
  }
  }