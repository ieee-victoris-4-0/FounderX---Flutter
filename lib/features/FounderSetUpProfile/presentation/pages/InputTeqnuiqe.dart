import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:founderx/core/transitions/slide_page.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/pages/inputForm.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/pages/setup1.dart';
import 'package:google_fonts/google_fonts.dart';

enum ClickedLabel { pitch, data, none }

class InputTeqnuiqe extends StatefulWidget {
  const InputTeqnuiqe({super.key});

  @override
  State<InputTeqnuiqe> createState() => _InputTeqnuiqeState();
}

class _InputTeqnuiqeState extends State<InputTeqnuiqe> {
  ClickedLabel clickedLabel = ClickedLabel.none;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(25),
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0, -0.92),
              child: SizedBox(
                height: size.height * 0.07,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment(0, 0),
                      child: Text(
                        tr("InputTeqnuiqe.title"),
                        style: GoogleFonts.raleway(
                          fontSize: size.width * 0.055,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(15, 15, 15, 1),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(1, 0),
                      child: SizedBox(
                        width: size.width * 0.12,
                        height: size.height * 0.07,
                        child: SvgPicture.asset(
                          'assets/splash_feature/Logo.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, -0.55),
              child: SizedBox(
                height: size.height * 0.17,
                child: Column(
                  children: [
                    Text(
                      tr("InputTeqnuiqe.subtitle1"),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                        fontSize: size.width * 0.06,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(153, 54, 219, 1),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          tr("InputTeqnuiqe.subtitle2"),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.raleway(
                            fontSize: size.width * 0.04,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(15, 15, 15, 1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, -0.25),
              child: Container(
                height: size.height * 0.18,
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          clickedLabel = ClickedLabel.pitch;
                        });
                        Future.delayed(const Duration(milliseconds: 300), () {
                          Navigator.push(
                            context,
                            SlidePageRoute(page: InputForm()),
                          ).then((_) {
                            setState(() {
                              clickedLabel = ClickedLabel.none;
                            });
                          });
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedContainer(
                              height: size.height * 0.1,
                              width: size.width * 0.2,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: (clickedLabel != ClickedLabel.pitch)
                                    ? Color.fromRGBO(247, 247, 247, 1)
                                    : Color.fromRGBO(153, 54, 219, 1),
                                shape: BoxShape.circle,
                              ),
                              duration: Duration(milliseconds: 200),
                              child: SvgPicture.asset(
                                'assets/setUp_profile_feature/pitch.svg',
                              ),
                            ),
                            Text(
                              tr("InputTeqnuiqe.pitchlabel"),
                              style: GoogleFonts.raleway(
                                fontSize: size.width * 0.04,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(15, 15, 15, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          clickedLabel = ClickedLabel.data;
                        });
                        Future.delayed(const Duration(milliseconds: 300), () {
                          Navigator.push(
                            context,
                            SlidePageRoute(page: Setup1()),
                          ).then((_) {
                            setState(() {
                              clickedLabel =
                                  ClickedLabel.none;
                            });
                          });
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedContainer(
                              padding: EdgeInsets.all(10),
                              height: size.height * 0.1,
                              width: size.width * 0.2,
                              duration: Duration(milliseconds: 200),
                              decoration: BoxDecoration(
                                color: (clickedLabel != ClickedLabel.data)
                                    ? Color.fromRGBO(247, 247, 247, 1)
                                    : Color.fromRGBO(153, 54, 219, 1),
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                'assets/setUp_profile_feature/data.svg',
                              ),
                            ),
                            Text(
                              tr("InputTeqnuiqe.datalabel"),
                              style: GoogleFonts.raleway(
                                fontSize: size.width * 0.04,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(15, 15, 15, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.5),
              child: SvgPicture.asset(
                'assets/setUp_profile_feature/input_pitch.svg',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
