import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:founderx/core/transitions/slide_page.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/pages/InputTeqnuiqe.dart';
import 'package:founderx/features/auth/presentation/pages/Forgot_Password.dart';
import 'package:founderx/features/auth/presentation/widgets/have_account.dart';
import 'package:founderx/features/auth/presentation/widgets/orSignUp.dart';
import 'package:founderx/features/auth/presentation/widgets/other_sigUp_methods.dart';
import 'package:founderx/features/auth/presentation/widgets/textfields.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/signUpbtn.dart';
class SignInScreen extends StatelessWidget {
 SignInScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                      alignment: Alignment(0,-0.9),
                      child:
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Text(tr("signIn.signIn"),
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
                              child: NameTextField(hintText: "signIn.emailhint", controller: emailController)),
                            Container(
                              margin: EdgeInsets.only(top: 25),
                              child: PasswordTextField(hintText: "signIn.passwordhint", obsecureText: false, controller: passwordController)),
                            Container(
                                child: Align(
                                  alignment: Alignment(1,-0.2),
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.push(context, SlidePageRoute(
                                        pageBuilder: (context, animation, secondaryAnimation) => ForgetPassword(),
                                      ));
                                    },
                                    child:Container(
                                      margin: EdgeInsets.only(top: 5),
                                      width: 140,
                                      height: 30,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(tr("signIn.forgotPassword"),
                                          style: GoogleFonts.raleway(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromRGBO(15, 15, 15, 1)
                                          ),
                                          ),
                                          Divider(
                                            height: 3,
                                            color: Color.fromRGBO(153, 54, 219, 1),)
                                        ],
                                      ),
                                    )
                                  ),
                                )
                              )
                          ],
                        ),
                      ),
                    )),
                    Align(
                      alignment: Alignment(0,0.1),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: SignUpBtn(text: "signIn.signIn", onTap: (){
                          if(_formKey.currentState!.validate()){
                            Navigator.push(context, SlidePageRoute(
                              pageBuilder: (context, animation, secondaryAnimation) => InputTeqnuiqe(),
                            ));
                          }
                        }),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0,0.4),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: OrSignUp(text: "signIn.or"),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0,0.65),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: SignUpMethods(),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0,0.85),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: AlreadyHaveAccount(text: "signIn.dontHaveAccount", textbtn: "signUp.signUp", onTap: (){
                          Navigator.push(context, SlidePageRoute(
                            pageBuilder: (context, animation, secondaryAnimation) => InputTeqnuiqe(),
                          ));
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