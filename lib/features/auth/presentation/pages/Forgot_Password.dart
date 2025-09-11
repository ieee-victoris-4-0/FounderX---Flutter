import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:founderx/core/transitions/slide_page.dart';
import 'package:founderx/features/auth/presentation/pages/verification.dart';
import 'package:founderx/features/auth/presentation/widgets/mainbody.dart';
import 'package:founderx/features/auth/presentation/widgets/signUpbtn.dart';
import 'package:founderx/features/auth/presentation/widgets/textfields.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/forget_password_subtitle.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return CustomMainBody(
      page:
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 0.8*MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                  Align(
                    alignment: Alignment.topCenter,
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
                          Text(tr("forgotPassword.title"),
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
                    alignment: Alignment(0,-0.7),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: ForgetPasswordSubtitle(subtitle: "forgotPassword.subtitle"),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child:Align(
                    alignment: Alignment(0,-0.3),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child:EmailTextField(hintText: "forgotPassword.emailhint", controller: emailController),
                    ),
                  ),
                  ),
                  Align(
                    alignment: Alignment(0,0.2),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child:SvgPicture.asset('assets/auth_feature/images/email.svg',
                      width: MediaQuery.of(context).size.width/2,
                      fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0,0.7),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child:SignUpBtn(text: "forgotPassword.send", onTap: (){
                        Navigator.push(context, SlidePageRoute(page: VerificationCodeScreen(isResetPassword: true,)));
                      }),
                    ),
                  ),
              ],
            ),
          ),
    );
  }
}