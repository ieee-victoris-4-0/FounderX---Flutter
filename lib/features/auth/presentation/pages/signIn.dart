import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:founderx/core/transitions/slide_page.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/pages/InputTeqnuiqe.dart';
import 'package:founderx/features/auth/auth_di/auth_di.dart';
import 'package:founderx/features/auth/data/models/DTO/login_DTO.dart';
import 'package:founderx/features/auth/domain/entity/auth_entity.dart';
import 'package:founderx/features/auth/presentation/blocs/blocs.dart';
import 'package:founderx/features/auth/presentation/blocs/events.dart';
import 'package:founderx/features/auth/presentation/blocs/states.dart';
import 'package:founderx/features/auth/presentation/pages/Forgot_Password.dart';
import 'package:founderx/features/auth/presentation/pages/signUp.dart';
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
  final loginBloc = sl.get<LoginBloc>();
  final passwordVisibilityBloc = sl.get<PasswordVisibilityBloc>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => loginBloc),
        BlocProvider(create: (context) => passwordVisibilityBloc),
      ],
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is SuccessLoginState) {
            Navigator.push(context, SlidePageRoute(page: InputTeqnuiqe()));
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, loginState) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body:(loginState is LoadingLoginState)? Center(
                child:  Image.asset('assets/core/loading.gif'),
              ): Stack(
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
                        color: Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment(0, -0.9),
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                tr("signIn.signIn"),
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
                              alignment: Alignment(0, -0.6),
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        vertical: 25,
                                      ),
                                      child: EmailTextField(
                                        hintText: "signIn.emailhint",
                                        controller: emailController,
                                      ),
                                    ),
                                    BlocBuilder<PasswordVisibilityBloc, PasswordVisibilityState>(
                                      builder: (context, passwordVisibilityState) {
                                        return Container(
                                          margin: EdgeInsets.only(top: 25),
                                          child: PasswordTextField(
                                            validator:(value) {
          final bool hasStrongPassword= AuthEntity(password: value).hasStrongPassword['c1']==1&&
          AuthEntity(password: value).hasStrongPassword['c2']==1&&
          AuthEntity(password: value).hasStrongPassword['c3']==1;
          print(hasStrongPassword);
          if(!hasStrongPassword){
            return "Please enter a valid password";
          }
          return null;
        },
                                            onTapIcon: () {
                                              passwordVisibilityBloc.add(
                                                PasswordVisibilityEvent(isPasswordVisible: !passwordVisibilityState.isPasswordVisible),
                                              );
                                            },
                                            onChanged: (value) {},
                                            hintText: "signIn.passwordhint",
                                            obsecureText: passwordVisibilityState.isPasswordVisible,
                                            controller: passwordController,
                                          ),
                                        );
                                      },
                                    ),
                                    Container(
                                      child: Align(
                                        alignment: Alignment(0.8, -0.2),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              SlidePageRoute(
                                                page: ForgetPassword(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(top: 5),
                                            width: size.width * 0.4,
                                            height: size.height * 0.05,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                LayoutBuilder(
                                                  builder: (context, constraints) {
                                                    return Text(
                                                      tr(
                                                        "signIn.forgotPassword",
                                                      ),
                                                      style:
                                                          GoogleFonts.raleway(
                                                            fontSize:
                                                                constraints
                                                                    .maxWidth *
                                                                0.11,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                Color.fromRGBO(
                                                                  15,
                                                                  15,
                                                                  15,
                                                                  1,
                                                                ),
                                                          ),
                                                    );
                                                  },
                                                ),
                                                Divider(
                                                  height: 3,
                                                  color: Color.fromRGBO(
                                                    153,
                                                    54,
                                                    219,
                                                    1,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
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
                              child: SignUpBtn(
                                text: "signIn.signIn",
                                onTap: () {
                                  final loginDto=LoginDto(email: emailController.text, password: passwordController.text);
                                  if (_formKey.currentState!.validate()) {
                                    loginBloc.add(LoadingLoginEvent(loginDto: loginDto));
                                  }
                                },
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0, 0.5),
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: OrSignUp(text: "signIn.or"),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0, 0.75),
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: SignUpMethods(),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0, 0.9),
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: AlreadyHaveAccount(
                                text: "signIn.dontHaveAccount",
                                textbtn: "signUp.signUp",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    SlidePageRoute(page: SignUpScreen()),
                                  );
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
          },
        ),
      ),
    );
  }
}
