import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:founderx/core/transitions/slide_page.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/pages/setup2.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/nextBtn.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/progressBar.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/titleWidget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/txtfields.dart';

class Setup1 extends StatelessWidget {
   Setup1({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController missionStatementController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        color: Colors.white,
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0, -0.95),
              child: TitleWidgetWithBack(),
            ),

                  Align(
                    alignment: const Alignment(0, -0.65),
                    child: SizedBox(
                      height: size.height*0.17,
                      child: Column(
                        children: [
                          Text(
                            tr("setup1.subtitle"),
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
                                tr("setup1.subtitle2"),
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
              alignment: Alignment(0, -0.35),
              child:Progressbar(step: "setup1.step", percentage: "setup1.persentage", widthFactor: 0.1) 
            ),
            Align(
              alignment: Alignment(0, 0.1),
              child: Form(
                key: formKey,
                child: SizedBox(
                  height: size.height*0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextField(hint: "setup1.namehint", controller: nameController,),
                      
                      CustomTextField(hint: "setup1.MissionStatement", controller: missionStatementController,),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.7),
              child: NextBtn(
                text: "setup1.next",
                onTap: () {
                  if (true) {
                    Navigator.push(context, SlidePageRoute(page: Setup2()));
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