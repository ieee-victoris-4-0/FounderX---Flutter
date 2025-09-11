import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:founderx/core/transitions/slide_page.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/pages/setup4.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/inputfield.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/nextBtn.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/progressBar.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/titleWidget.dart';
import 'package:google_fonts/google_fonts.dart';

class Setup3 extends StatelessWidget {
   Setup3({super.key});
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final TextEditingController textProblemController = TextEditingController();
  final TextEditingController textSolutionController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
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
                      height: size.height*0.25,
                      child: Column(
                        children: [
                          Text(
                            tr("setup3.subtitle"),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.raleway(
                              fontSize: size.width*0.045,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(153, 54, 219, 1),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                tr("setup3.subtitle2"),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.raleway(
                                  fontSize: size.width*0.04,
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
              child:Progressbar(step: "setup3.step", percentage: "setup3.persentage", widthFactor: 0.3) 
            ),
            Align(
              alignment: Alignment(0, -0.1),
              child: SizedBox(
                height: size.height*0.25,
                child: Form(
                  key: formKey1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(tr("setup3.problem"),
                      style: GoogleFonts.raleway(
                        fontSize: size.width*0.042,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(0, 0, 0, 1),
                      ),
                  
                      ),
                      Inputfield(textEditingController: textProblemController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a problem';
                        }
                        return null;
                      },
                      onchabged:
                      (value) {
                          },
                       height: MediaQuery.of(context).size.height/5,),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.6),
              child: SizedBox(
                height: size.height*0.25,
                child: Form(
                  key: formKey2,
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(tr("setup3.Solution"),
                    style: GoogleFonts.raleway(
                      fontSize: size.width*0.042,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                    ),

                    ),
                    Inputfield(textEditingController: textSolutionController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a solution';
                      }
                      return null;
                    },
                    onchabged:
                    (value) {
                        },
                     height: MediaQuery.of(context).size.height/5,),
                  ],
                )
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.9),
              child: NextBtn(
                text: "setup3.next",
                onTap: () {
                  if (true) {
                    Navigator.push(context, SlidePageRoute(page: Setup4()));
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