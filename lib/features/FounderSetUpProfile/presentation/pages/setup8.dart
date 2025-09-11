import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:founderx/core/transitions/slide_page.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/blocs/blocs.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/pages/setup9.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/nextBtn.dart';

import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/progressBar.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/titleWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import '../blocs/events.dart';
import '../blocs/states.dart';import '../widgets/customed_containers.dart';
class Setup8 extends StatelessWidget {
  Setup8({super.key});

  final List<String> svgs = [
    "assets/setUp_profile_feature/seed.svg",
    "assets/setUp_profile_feature/early_stage.svg",
    "assets/setUp_profile_feature/growing.svg",
  ];

  final List<String> titles = ["setup8.s1", "setup8.s2", "setup8.s3"];

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
                        tr("setup8.subtitle"),
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
                            tr("setup8.subtitle2"),
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
                  step: "setup8.step",
                  percentage: "setup8.persentage",
                  widthFactor: 0.8,
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
                    child: NextBtn(
                      onTap: () {
                        Navigator.of(context).push(SlidePageRoute(page: Setup9()));
                      },
                      text: "setup8.next",
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
