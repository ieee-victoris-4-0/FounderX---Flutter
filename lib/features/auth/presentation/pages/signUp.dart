import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:founderx/core/transitions/slide_page.dart';
import 'package:founderx/features/auth/presentation/pages/signIn.dart';
import 'package:founderx/features/auth/presentation/pages/verification.dart';
import 'package:founderx/features/auth/presentation/widgets/have_account.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/widgets/progress_bar.dart';
import '../widgets/orSignUp.dart';
import '../widgets/other_sigUp_methods.dart';
import '../widgets/signUpbtn.dart';
import '../widgets/textfields.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
            alignment: Alignment(0,0.5),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 0.8*MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Color.fromRGBO(235, 234, 234, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment(0,-1),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ProgressBar(numOfSteps: 1),
                    )),
                    Align(
                      alignment: Alignment(0,-0.9),
                      child:
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Text(tr("signUp.signUp"),
                        style: GoogleFonts.raleway(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(15, 15, 15, 1)
                        ),
                        ),
                      )
                    ),
                    Form(
                      key: _formKey,
                      child:Align(
                      alignment: Alignment(0,-0.6),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 25),
                              child: NameTextField(hintText: "signUp.namehint", controller: nameController)),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 25),
                              child: EmailTextField(hintText: "signUp.emailhint", controller: emailController)),
                          ],
                        ),
                      ),
                    )),
                    Align(
                      alignment: Alignment(0,0),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: SignUpBtn(text: "signUp.verify", onTap: (){
                          Navigator.push(context, SlidePageRoute(pageBuilder: (context, animation, secondaryAnimation) => VerificationCode(isResetPassword: false,)));
                        }),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0,0.3),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: OrSignUp(text: "signUp.or"),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0,0.55),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: SignUpMethods(),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0,0.75),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: AlreadyHaveAccount(text: "signUp.alreadyHaveAccount", textbtn: "signUp.signIn", onTap: (){
                          Navigator.of(context).push(SlidePageRoute(pageBuilder: (context, animation, secondaryAnimation) {
                        return SignInScreen();
                      }));
                        }),
                      ),
                    )
                ],
              )
            ),
          )
        ]
      ) ,
    );
  }
}