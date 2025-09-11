import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:founderx/core/core_di/core_di.dart';
import 'package:founderx/core/transitions/slide_page.dart';
import 'package:founderx/features/auth/domain/entity/auth_entity.dart';
import 'package:founderx/features/auth/presentation/blocs/blocs.dart';
import 'package:founderx/features/auth/presentation/blocs/events.dart';
import 'package:founderx/features/auth/presentation/blocs/states.dart';
import 'package:founderx/features/auth/presentation/pages/success.dart';
import 'package:founderx/features/auth/presentation/widgets/mainbody.dart';
import 'package:founderx/features/auth/presentation/widgets/password_criteria.dart';
import 'package:founderx/features/auth/presentation/widgets/textfields.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/presentation/widgets/progress_bar.dart';
import '../widgets/signUpbtn.dart';

class PasswordScreen extends StatelessWidget {
  final bool isResetPassword;
  const PasswordScreen({super.key, required this.isResetPassword});

  @override
  Widget build(BuildContext context) {
    return isResetPassword ? ResetPassword() : SetPassword();
  }
}

class SetPassword extends StatefulWidget {
  const SetPassword({super.key});

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController passwordConfirmationController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isTextfieldTaped = false;

  final passwordCriteriaBloc =sl<PasswordCriteriaBloc>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomMainBody(
      isTextfieldTaped: isTextfieldTaped,
      page: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => passwordCriteriaBloc)],
        child: SingleChildScrollView(
          child: Container(
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
                          size: (size.width >= 800)
                              ? size.width * 0.06
                              : size.width * 0.07,
                        ),
                      ),
                      SizedBox(width: 25),
                      Text(
                        tr("setPassword.title"),
                        style: GoogleFonts.raleway(
                          fontSize: (size.width >= 800)
                              ? size.width * 0.06
                              : size.width * 0.07,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(15, 15, 15, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<PasswordCriteriaBloc, PasswordCriteriaState>(
                  builder: (context, passwordCriteriaState) {
                    return Form(
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
                                      onsubmit: (value) {
                                        setState(() {
                                          isTextfieldTaped = false;
                                        });
                                      },
                                      onTap: () {
                                        setState(() {
                                          isTextfieldTaped = true;
                                        });
                                      },
                                      onChanged: (value) {
                                        final entity = AuthEntity(
                                          password: value,
                                        );
                                        context
                                            .read<PasswordCriteriaBloc>()
                                            .add(
                                              PasswordCriteriaEvent(
                                                passwordRef:
                                                    entity.hasStrongPassword,
                                              ),
                                            );
                                      },
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
                                            fontSize: (size.width >= 800)
                                                ? size.width * 0.03
                                                : size.width * 0.04,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(
                                              64,
                                              63,
                                              63,
                                              1,
                                            ),
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
                                      onTap: () {
                                        setState(() {
                                          isTextfieldTaped = false;
                                        });
                                      },
                                      onChanged: (value) {},
                                      hintText: "setPassword.passwordhint",
                                      controller:
                                          passwordConfirmationController,
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
                                            fontSize: (size.width >= 800)
                                                ? size.width * 0.03
                                                : size.width * 0.04,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(
                                              64,
                                              63,
                                              63,
                                              1,
                                            ),
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
                    );
                  },
                ),
                BlocBuilder<PasswordCriteriaBloc, PasswordCriteriaState>(
                  builder: (context, state) {
                    return Align(
                      alignment: Alignment(1, 0.4),
                      child: PasswordCriteria(passwordRef: state.passwordRef),
                    );
                  },
                ),
                Align(
                  alignment: Alignment(0, 0.8),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: SignUpBtn(
                      text: "setPassword.reset",
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            SlidePageRoute(
                              page: SuccessScreen(isResetPassword: false),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final passwordCriteriaBloc =sl<PasswordCriteriaBloc>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomMainBody(
      page: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => passwordCriteriaBloc)],
        child: Container(
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
                        size: (size.width >= 800)
                            ? size.width * 0.06
                            : size.width * 0.07,
                      ),
                    ),
                    SizedBox(width: 25),
                    Text(
                      tr("resetPassword.title"),
                      style: GoogleFonts.raleway(
                        fontSize: (size.width >= 800)
                            ? size.width * 0.06
                            : size.width * 0.07,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(15, 15, 15, 1),
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<PasswordCriteriaBloc, PasswordCriteriaState>(
                builder: (context, passwordCriteriaState) {
                  return Form(
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
                                    onChanged: (value) {
                                      final entity = AuthEntity(
                                        password: value,
                                      );
                                      BlocProvider.of<PasswordCriteriaBloc>(
                                        context,
                                      ).add(
                                        PasswordCriteriaEvent(
                                          passwordRef: entity.hasStrongPassword,
                                        ),
                                      );
                                    },
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
                                          fontSize: (size.width >= 800)
                                              ? size.width * 0.03
                                              : size.width * 0.04,
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
                                    onChanged: (value) {},
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
                                          fontSize: (size.width >= 800)
                                              ? size.width * 0.03
                                              : size.width * 0.04,
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
                  );
                },
              ),
              Align(
                alignment: Alignment(1, 0.4),
                child: PasswordCriteria(passwordRef: {}),
              ),
              Align(
                alignment: Alignment(0, 0.8),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: SignUpBtn(
                    text: "resetPassword.reset",
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          SlidePageRoute(
                            page: SuccessScreen(isResetPassword: true),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
