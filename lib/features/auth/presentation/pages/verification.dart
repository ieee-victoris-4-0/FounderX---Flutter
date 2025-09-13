import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:founderx/core/core_di/core_di.dart';
import 'package:founderx/core/transitions/slide_page.dart';
import 'package:founderx/core/presentation/widgets/progress_bar.dart';
import 'package:founderx/features/auth/data/models/DTO/verificationCode_DTO.dart';
import 'package:founderx/features/auth/presentation/blocs/events.dart';
import 'package:founderx/features/auth/presentation/blocs/states.dart';
import 'package:founderx/features/auth/presentation/pages/set_password.dart';
import 'package:founderx/features/auth/presentation/blocs/blocs.dart';
import 'package:founderx/features/auth/presentation/widgets/mainbody.dart';
import 'package:founderx/features/auth/presentation/widgets/otp_widget.dart';
import 'package:founderx/features/auth/presentation/widgets/signUpbtn.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/forget_password_subtitle.dart';

class VerificationCodeScreen extends StatelessWidget {
  final TextEditingController codeController = TextEditingController();
  final int id;
  final bool isResetPassword;
  final verificationBloc = sl<VerificationCodeBloc>();
  VerificationCodeScreen({
    super.key,
    required this.isResetPassword,
    required this.id,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => verificationBloc,
      child: BlocListener<VerificationCodeBloc, VerificationCodeState>(
        listener: (context, state) {
          if(state is SuccessVerificationCodeState){
            Navigator.push(
                              context,
                              SlidePageRoute(
                                page: PasswordScreen(
                                  id: id,
                                  isResetPassword: isResetPassword,
                                ),
                              ),
                            );
          }
          else if(state is ErrorVerificationCodeState){
             ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(state.failure.message),
      backgroundColor: Colors.red,
    ),
  );
          }
        },
        child: BlocBuilder<VerificationCodeBloc, VerificationCodeState>(
          builder: (context, state) {
            return CustomMainBody(
              isloading:state is LoadingVerificationCodeState ,
              page: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: 0.8 * MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    (isResetPassword)
                        ? SizedBox.shrink()
                        : Align(
                            alignment: Alignment(0, -0.9),
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              child: ProgressBar(numOfSteps: 2),
                            ),
                          ),
                    Align(
                      alignment: Alignment(0, -0.7),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
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
                              tr("VerificationCode.title"),
                              style: GoogleFonts.raleway(
                                fontSize: (size.width >= 800)
                                    ? size.width * 0.05
                                    : size.width * 0.06,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(15, 15, 15, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, -0.4),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: ForgetPasswordSubtitle(
                          subtitle: "VerificationCode.subtitle",
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, -0.1),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: OtpWidget(onSubmit: (code) {
                          codeController.text=code;
                        }),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0.3),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: SignUpBtn(
                          text: "VerificationCode.verify",
                          onTap: () {
                            print("====================");
                            print(codeController.text);
                            print(id);
                            context.read<VerificationCodeBloc>().add(
                              LoadingVerificationCodeEvent(
                                verificationCodeDto: VerificationCodeDto(
                                  id: id,
                                  otpConfirmationCode: codeController.text,
                                ),
                              )
                            );
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0.6),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: tr("VerificationCode.havent"),
                                style: GoogleFonts.raleway(
                                  fontSize: (size.width >= 800)
                                      ? size.width * 0.03
                                      : size.width * 0.04,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(15, 15, 15, 1),
                                ),
                              ),
                              TextSpan(
                                text: tr("VerificationCode.resend"),
                                style: GoogleFonts.raleway(
                                  fontSize: (size.width >= 800)
                                      ? size.width * 0.03
                                      : size.width * 0.04,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(153, 54, 219, 1),
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
