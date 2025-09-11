import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:founderx/features/investors/presentation/widgets/pagebar.dart';

class InvestorProfile extends StatelessWidget {
  const InvestorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: double.infinity,
              child: SvgPicture.asset("assets/investors_features/investot_background.svg",
              fit: BoxFit.cover,
              ),
            )),
          Align(
            alignment: Alignment(0,-0.9),
            child: InvestorPageBar()
          )
        ],
      ) ,
    );
  }
}