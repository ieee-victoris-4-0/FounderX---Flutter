import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:founderx/core/transitions/slide_page.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/pages/inputForm.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/pages/setup1.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/titleWidget.dart';
import 'package:founderx/features/auth/presentation/widgets/signUpbtn.dart';
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
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(25),
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0, -0.92),
              child: TitleWidgetWithoutBack(),
            ),
            Align(
              alignment: Alignment(0, -0.5),
              child: Container(
                height: 100,
                child: Column(
                  children: [
                    Text(
                      tr("InputTeqnuiqe.subtitle1"),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
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
                            fontSize: 18,
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
              alignment: Alignment(0, 0),
              child: Container(
                height: 120,
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          clickedLabel = ClickedLabel.pitch;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedContainer(
                              padding: EdgeInsets.all(5),
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
                                fontSize: 18,
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
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedContainer(
                              padding: EdgeInsets.all(5),
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
                                fontSize: 18,
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
              alignment: Alignment(0, 0.7),
              child: SignUpBtn(text: "InputTeqnuiqe.next", onTap: () {
                if(clickedLabel == ClickedLabel.pitch){
                 Navigator.push(context, SlidePageRoute(pageBuilder: (context, animation, secondaryAnimation) =>
                             InputForm()));
                }else if(clickedLabel == ClickedLabel.data){
                  Navigator.push(context, SlidePageRoute(pageBuilder: (context, animation, secondaryAnimation) =>
                             Setup1()));
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
