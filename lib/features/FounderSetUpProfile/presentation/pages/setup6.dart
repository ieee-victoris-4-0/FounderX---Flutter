import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:founderx/core/transitions/slide_page.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/pages/setup7.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/nextBtn.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/progressBar.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/titleWidget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/txtfields.dart';

class Setup6 extends StatelessWidget {
   Setup6({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    alignment: const Alignment(0, -0.92),
                    child: TitleWidgetWithBack(),
                  ),
                  Align(
                    alignment: const Alignment(0, -0.65),
                    child: SizedBox(
                      height: 100,
                      child: Column(
                        children: [
                          Text(
                            tr("setup6.subtitle"),
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
                                tr("setup6.subtitle2"),
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
              child:Progressbar(step: "setup6.step", percentage: "setup6.persentage", widthFactor: 0.66) 
            ),
            Align(
              alignment: Alignment(0, -0.1),
              child: Form(
                key: formKey,
                child: SizedBox(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextField(hint: "setup6.hint1", controller: TextEditingController(),),
                      
                      CustomTextField(hint: "setup6.hint2", controller: TextEditingController(),),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.5),
              child: NextBtn(
                text: "setup6.next",
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.push(context, SlidePageRoute(pageBuilder: (context, animation, secondaryAnimation) =>
                             Setup7()));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}