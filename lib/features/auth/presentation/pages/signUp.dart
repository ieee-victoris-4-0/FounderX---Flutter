import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:founderx/core/core_di/core_di.dart';
import 'package:founderx/core/transitions/slide_page.dart';
import 'package:founderx/features/auth/data/models/DTO/register_DTO.dart';
import 'package:founderx/features/auth/presentation/blocs/blocs.dart';
import 'package:founderx/features/auth/presentation/blocs/events.dart';
import 'package:founderx/features/auth/presentation/blocs/states.dart';
import 'package:founderx/features/auth/presentation/pages/signIn.dart';
import 'package:founderx/features/auth/presentation/pages/verification.dart';
import 'package:founderx/features/auth/presentation/widgets/have_account.dart';
import 'package:founderx/features/auth/presentation/widgets/mainbody.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/presentation/widgets/progress_bar.dart';
import '../widgets/orSignUp.dart';
import '../widgets/other_sigUp_methods.dart';
import '../widgets/signUpbtn.dart';
import '../widgets/textfields.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final signUpBloc = sl.get<RegisterBloc>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => signUpBloc,
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, listenerState) {
          if (listenerState is SuccessRegisterState) {
            Navigator.of(context).push(
              SlidePageRoute(
                page: VerificationCodeScreen(
                  id: listenerState.id,
                  isResetPassword: false),
              ),
            );
          }
        },
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, registerState) {
            return CustomMainBody(
              isloading:registerState is LoadingRegisterState ,
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
                    Align(
                      alignment: Alignment(0, -0.9),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ProgressBar(numOfSteps: 1),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, -0.8),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          tr("signUp.signUp"),
                          style: GoogleFonts.raleway(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(15, 15, 15, 1),
                          ),
                        ),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Align(
                        alignment: Alignment(0, -0.5),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: size.height * 0.025,
                                ),
                                child: NameTextField(
                                  hintText: "signUp.namehint",
                                  controller: nameController,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: size.height * 0.025,
                                ),
                                child: EmailTextField(
                                  hintText: "signUp.emailhint",
                                  controller: emailController,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0.2),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: SignUpBtn(text: "signUp.verify", onTap: () {
                          final data=RegisterDto(email: emailController.text, fullName: nameController.text);
                          if (_formKey.currentState!.validate()) {
                          context.read<RegisterBloc>().add(
                            LoadingRegisterEvent(registerDto: data)
                          );
                          }
                        }),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0.4),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: OrSignUp(text: "signUp.or"),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0.65),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: SignUpMethods(),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 0.85),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: AlreadyHaveAccount(
                          text: "signUp.alreadyHaveAccount",
                          textbtn: "signUp.signIn",
                          onTap: () {
                            Navigator.of(
                              context,
                            ).push(SlidePageRoute(page: SignInScreen()));
                          },
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
