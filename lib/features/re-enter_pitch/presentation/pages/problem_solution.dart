import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:founderx/features/re-enter_pitch/presentation/widgets/button.dart';
import 'package:founderx/features/re-enter_pitch/presentation/widgets/inputTextfield.dart';
import 'package:founderx/features/re-enter_pitch/presentation/widgets/pagebar.dart';
import 'package:google_fonts/google_fonts.dart';

class ProblemSolution extends StatelessWidget {
  ProblemSolution({super.key});

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final TextEditingController textProblemController = TextEditingController();
  final TextEditingController textSolutionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    textProblemController.text="1w2krlq21r47";
  final size=MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        color: Colors.white,
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0, -0.92),
              child: PageBar(),
            ),
            Align(
                    alignment: const Alignment(0, -0.7),
                    child: SizedBox(
                      width: double.infinity,
                      height: size.height*0.4,
                      child: Column(
                        children: [
                          Expanded(

                            flex: 3
                            ,child: Transform.scale(
                              scale:(size.width>=800)?3: 1.5,
                              child: SvgPicture.asset("assets/re_enterPitch/icons/Lightbulb.svg",
                              fit: BoxFit.contain,
                              ),
                            )),
                          Expanded(flex: 1,
                            child: Text(
                              tr("setup3.subtitle"),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.raleway(
                                fontSize: size.width*0.045,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(153, 54, 219, 1),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
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
                      InputTextfield(
                        textEditingController: textProblemController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a problem';
                          }
                          return null;
                        },
                        onchabged: (value) {},
                      ),
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
                    InputTextfield(
                        textEditingController: textSolutionController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a solution';
                          }
                          return null;
                        },
                        onchabged: (value) {},
                      ),
                  ],
                )
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.9),
              child:InkWell(
                onTap: (){},
                child:ReEnterButton() )
            ),
          ],
        ),
      ),
    );
 
  }
}