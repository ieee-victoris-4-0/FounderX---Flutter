import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class CustomMainBody extends StatelessWidget {
  final Widget page;
  final bool ? isTextfieldTaped;
  final bool ? isloading;
  const CustomMainBody({super.key, required this.page, this.isTextfieldTaped=false, this.isloading=false});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:(isloading==true)?Center(
        child: Image.asset("assets/core/loading.gif"),
      ) :Stack(
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
            alignment: Alignment(0,(isTextfieldTaped == true)?-1.7:0.8),
            child: page,
          ),
          (isTextfieldTaped == false)?Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: SizedBox(
                height: MediaQuery.of(context).size.height*0.12,
                child: SvgPicture.asset('assets/splash_feature/splash2.svg',
                fit: BoxFit.contain,
                ),
              ),
            ),
          ):SizedBox.shrink(),
        ],
      ),
    );
  }
}