import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpMethods extends StatelessWidget {
  const SignUpMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){},
            child: Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: SvgPicture.asset('assets/auth_feature/icons/Google.svg',
              fit: BoxFit.fill,
              ),
              
            ),
          ),
          InkWell(
            onTap: (){},
            child: Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: SvgPicture.asset('assets/auth_feature/icons/Facebook.svg',
              fit: BoxFit.fill,
              ),
              
            ),
          ),
        ],
      ),
    );
  }
}