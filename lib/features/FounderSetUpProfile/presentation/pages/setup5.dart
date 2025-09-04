import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/blocs/blocs.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/blocs/events.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/blocs/states.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/pages/setup6.dart';

import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/nextBtn.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/progressBar.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/titleWidget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/transitions/slide_page.dart';
import '../widgets/customslider.dart';

class Setup5 extends StatelessWidget {
  const Setup5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        color: Colors.white,
        child: Stack(
          children: [
            Align(alignment: Alignment(0, -0.92), child: TitleWidgetWithBack()),
            Align(
              alignment: const Alignment(0, -0.65),
              child: SizedBox(
                height: 100,
                child: Column(
                  children: [
                    Text(
                      tr("setup5.subtitle"),
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
                          tr("setup5.subtitle2"),
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
              child: Progressbar(
                step: "setup5.step",
                percentage: "setup5.persentage",
                widthFactor: 0.55,
              ),
            ),
            Align(
              alignment: Alignment(0, 0),
              child: SizedBox(
                height: 300,
                width: double.infinity,
                child: SvgPicture.asset("assets/setUp_profile_feature/setup5.svg"),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.5),
              child: BlocProvider(
                create: (context) => SliderBloc(),
                child: BlocBuilder<SliderBloc, SliderState>(
                  builder: (context, sliderstate) {
                      return SizedBox(
                        width: double.infinity,
                        child: CustomizedSlider(
                          value: (sliderstate as SliderValue).value,
                          onChanged: (value) {
                            context.read<SliderBloc>().add(
                              SliderValueEvent(value: value),
                            );
                          },
                        ),
                      );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.58),
              child: SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(tr("setup5.Juniors"),
                    style: GoogleFonts.raleway(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(15, 15, 15, 1),
                    ),
                    ),
                    Text(tr("setup5.Seniors"),
                    style: GoogleFonts.raleway(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(15, 15, 15, 1),
                    ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.92),
              child: NextBtn(
                text: "setup4.next",
                onTap: () {
                  Navigator.push(
                    context,
                    SlidePageRoute(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          Setup6(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
