import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:founderx/core/transitions/slide_page.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/blocs/blocs.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/pages/Loading_page.dart';

import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/progressBar.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/titleWidget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../blocs/events.dart';
import '../blocs/states.dart';
import '../widgets/analyzebutton.dart';
import '../widgets/customed_containers.dart';

class Setup10 extends StatelessWidget {
  Setup10({super.key});

  final List<String> svgs = [
    "assets/setUp_profile_feature/30,000 EGP – 1M EGP.svg",
    "assets/setUp_profile_feature/1M – 10M EGP.svg",
    "assets/setUp_profile_feature/10M – 75M EGP.svg",
  ];

  final List<String> titles = ["setup10.fund1", "setup10.fund2", "setup10.fund3"];

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ButtonBloc()),
          BlocProvider(create: (context) => SelectedContainerBloc()),
        ],
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          color: Colors.white,
          child: Stack(
            children: [
              Align(
                alignment: const Alignment(0, -0.92),
                child: const TitleWidgetWithBack(),
              ),
              Align(
                alignment: const Alignment(0, -0.65),
                child: SizedBox(
                  height: size.height*0.25,
                  child: Column(
                    children: [
                      Text(
                        tr("setup10.subtitle"),
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
                            tr("setup10.subtitle2"),
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
                alignment: const Alignment(0, -0.45),
                child: Progressbar(
                  step: "setup10.step",
                  percentage: "setup10.persentage",
                  widthFactor: 1,
                ),
              ),
              Align(
                alignment: const Alignment(0, 0),
                child: SizedBox(
                  height: size.height*0.35,
                  child: BlocBuilder<SelectedContainerBloc,
                      SelectedContainerState>(
                    builder: (context, state) {
                      return ListView.builder(
                        itemCount: svgs.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding:  EdgeInsets.only(bottom: 20),
                            child: MultiselectionContainer(
                              state: state,
                              field: titles[index],
                              svg: svgs[index],
                              onTap: () {
                                context
                                    .read<ButtonBloc>()
                                    .add(EnableButtonEvent());
                                context
                                    .read<SelectedContainerBloc>()
                                    .add(SelectContainerEvent(
                                      choosenContainerField: titles[index],
                                    ));
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              BlocBuilder<ButtonBloc, ButtonState>(
                builder: (context, state) {
                  return Align(
                    alignment: const Alignment(0, 0.8),
                    child: Analyzebutton(
                      onTap: () {
                        Navigator.of(context).push(SlidePageRoute(page: LoadingPage()));
                      },
                      text: "setup10.next",
                      state: state,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
