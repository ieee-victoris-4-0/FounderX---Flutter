import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:founderx/core/transitions/slide_page.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/inputfield.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/nextBtn.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/progressBar.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/titleWidget.dart';
import 'package:google_fonts/google_fonts.dart';

class Setup3 extends StatelessWidget {
   Setup3({Key? key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController textProblemController = TextEditingController();
  final TextEditingController textSolutionController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        color: Colors.white,
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0, -0.92),
              child: TitleWidgetWithBack(),
            ),
            Align(
                    alignment: const Alignment(0, -0.65),
                    child: SizedBox(
                      height: 100,
                      child: Column(
                        children: [
                          Text(
                            tr("setup2.subtitle"),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.raleway(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(153, 54, 219, 1),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                tr("setup2.subtitle2"),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.raleway(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(15, 15, 15, 1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            Align(
              alignment: Alignment(0, -0.45),
              child:Progressbar(step: "setup3.step", percentage: "setup3.persentage", widthFactor: 0.33) 
            ),
            Align(
              alignment: Alignment(0, -0.1),
              child: Container(
                height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(tr("setup3.problem"),
                    style: GoogleFonts.raleway(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                    ),

                    ),
                    Inputfield(textEditingController: textProblemController, onchabged:
                    (value) {
                        },
                     height: MediaQuery.of(context).size.width/3,),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.6),
              child: Container(
                height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(tr("setup3.Solution"),
                    style: GoogleFonts.raleway(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                    ),

                    ),
                    Inputfield(textEditingController: textSolutionController, onchabged:
                    (value) {
                        },
                     height: MediaQuery.of(context).size.width/3,),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.8),
              child: NextBtn(
                text: "setup1.next",
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.push(context, SlidePageRoute(pageBuilder: (context, animation, secondaryAnimation) =>
                             Setup3()));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );

  }
}