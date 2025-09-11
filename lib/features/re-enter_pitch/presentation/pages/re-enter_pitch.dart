import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:founderx/core/transitions/slide_page.dart';
import 'package:founderx/features/re-enter_pitch/presentation/pages/problem_solution.dart';
import 'package:founderx/features/re-enter_pitch/presentation/pages/stage.dart';
import 'package:founderx/features/re-enter_pitch/presentation/pages/target.dart';
import 'package:founderx/features/re-enter_pitch/presentation/widgets/editcContainer.dart';
import 'package:google_fonts/google_fonts.dart';


class ReEnterPitch extends StatelessWidget {
  ReEnterPitch({super.key});

  final List<String> svg = [
    "assets/re_enterPitch/icons/Lightbulb.svg",
    "assets/re_enterPitch/icons/stage.svg",
    "assets/re_enterPitch/icons/target.svg",
  ];

  final List<String> title = [
    "reEnterPitch.container1title",
    "reEnterPitch.container2title",
    "reEnterPitch.container3title",
  ];

  final List<String> subtitle = [
    "reEnterPitch.container1subtitle",
    "reEnterPitch.container2subtitle",
    "reEnterPitch.container3subtitle",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bottomInset = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05,
          vertical: size.height * 0.05,
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: bottomInset),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// العنوان
              Text(
                tr("reEnterPitch.title"),
                style: GoogleFonts.raleway(
                  fontSize: size.width * 0.06,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 15, 15, 15),
                ),
                textAlign: TextAlign.center,
              ),
    
              SizedBox(height: size.height * 0.04),
    
              /// الـ containers
              Column(
                children: List.generate(3, (index) {
                      return EditContainer(
                        title: title[index],
                        subtitle: subtitle[index],
                        svg: svg[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            SlidePageRoute(
                              page:
                                  (pages.values[index]== pages.problem)
                                  ? ProblemSolution()
                                  : (pages.values[index] == pages.stage)
                                  ? Stage()
                                  : Target(),
                            ),
                          );
                        },
                      );
                
                }),
              ),
    
              SizedBox(height: size.height * 0.04),
    
              SvgPicture.asset(
                "assets/re_enterPitch/images/OBJECTS.svg",
                width: size.width * 0.7,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
