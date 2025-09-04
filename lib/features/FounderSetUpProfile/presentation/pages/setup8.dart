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
import '../blocs/states.dart';
import '../widgets/customed_containers.dart';

class Setup8 extends StatelessWidget {
  Setup8({super.key});
  final List<String> svgs = [
    "assets/setUp_profile_feature/Genz.svg",
    "assets/setUp_profile_feature/Millennials.svg",
    "assets/setUp_profile_feature/Elderly.svg",
  ];
  final List<String> titles = ["setup8.aud1", "setup8.aud2", "setup8.aud3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => SelectedContainerBloc(),
        child: Container(
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
                        tr("setup8.subtitle"),
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
                            tr("setup8.subtitle2"),
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
                  step: "setup8.step",
                  percentage: "setup8.persentage",
                  widthFactor: 0.88,
                ),
              ),
              Align(
                alignment: Alignment(0, -0.33),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    tr("setup8.audience"),
                    style: GoogleFonts.raleway(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(15, 15, 15, 1),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, 0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: BlocProvider(
                    create: (context) => SelectedContainerBloc(),
                    child: ListView.builder(
                      itemCount: svgs.length,

                      itemBuilder: (context, index) {
                        return BlocBuilder<
                          SelectedContainerBloc,
                          SelectedContainerState
                        >(
                          builder: (context, containerState) {
                            return Container(
                              padding: EdgeInsets.only(bottom: 20),
                              child: MultiselectionContainer(
                                state: containerState,
                                field: titles[index],
                                svg: svgs[index],
                                onTap: () {
                                  if (containerState is Unselected) {
                                    context.read<SelectedContainerBloc>().add(
                                      SelectContainerEvent(
                                        choosenContainerField: titles[index],
                                      ),
                                    );
                                  } else if (containerState is Selected) {
                                    context.read<SelectedContainerBloc>().add(
                                      UnselectContainerEvent(
                                        choosenContainerField: titles[index],
                                      ),
                                    );
                                  }
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, 0.42),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    tr("setup8.CustomerSegment"),
                    style: GoogleFonts.raleway(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(15, 15, 15, 1),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, 0.55),
                child: BlocBuilder<SelectedContainerBloc, SelectedContainerState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                if (state is Unselected) {
                                  context.read<SelectedContainerBloc>().add(
                                    SelectContainerEvent(
                                      choosenContainerField: "setup8.seg1",
                                    ),
                                  );
                                } else if (state is Selected) {
                                  context.read<SelectedContainerBloc>().add(
                                    UnselectContainerEvent(
                                      choosenContainerField: "setup8.seg1",
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 14),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Color.fromRGBO(153, 54, 219, 1),
                                    width: (state.choosenContainerField == "setup8.seg1")? 3:1,
                                  ),
                                ),
                                child: Text(
                                  tr("setup8.seg1"),
                                  style: GoogleFonts.raleway(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromRGBO(15, 15, 15, 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                if (state is Unselected) {
                                  context.read<SelectedContainerBloc>().add(
                                    SelectContainerEvent(
                                      choosenContainerField: "setup8.seg2",
                                    ),
                                  );
                                } else if (state is Selected) {
                                  context.read<SelectedContainerBloc>().add(
                                    UnselectContainerEvent(
                                      choosenContainerField: "setup8.seg2",
                                    ),
                                  );
                                }
                              },
                              child: Container(
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color.fromRGBO(153, 54, 219, 1),
                                  width: (state.choosenContainerField == "setup8.seg2")? 3:1,
                                ),
                              ),
                              child: Text(
                                tr("setup8.seg2"),
                                style: GoogleFonts.raleway(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(15, 15, 15, 1),
                                ),
                              ),
                            ),
                          ),)
                        ],
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment(0, 0.8),
                child: NextBtn(
                  text: "setup8.next",
                  onTap: () {
                    Navigator.push(
                      context,
                      SlidePageRoute(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            Setup9(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
