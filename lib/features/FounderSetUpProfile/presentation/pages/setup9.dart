import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:founderx/core/transitions/slide_page.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/blocs/blocs.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/pages/setup10.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/nextBtn.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/progressBar.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/titleWidget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../blocs/events.dart';
import '../blocs/states.dart';
import '../widgets/customed_containers.dart';

class Setup9 extends StatelessWidget {
  Setup9({super.key});
  final List<String> svgs = [
    "assets/setUp_profile_feature/Genz.svg",
    "assets/setUp_profile_feature/Millennials.svg",
    "assets/setUp_profile_feature/Elderly.svg",
  ];
  final List<String> titles = ["setup9.aud1", "setup9.aud2", "setup9.aud3"];

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
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
                  height: size.height*0.25,
                  child: Column(
                    children: [
                      Text(
                        tr("setup9.subtitle"),
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
                            tr("setup9.subtitle2"),
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
                child: Progressbar(
                  step: "setup9.step",
                  percentage: "setup9.persentage",
                  widthFactor: 0.9,
                ),
              ),
              Align(
                alignment: Alignment(0, -0.33),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    tr("setup9.audience"),
                    style: GoogleFonts.raleway(
                      fontSize: size.width*0.04,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(15, 15, 15, 1),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: (size.width>=800)? Alignment(0, 0.2):Alignment(0, 0),
                child: SizedBox(
                  height: size.height*0.35,
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
                    tr("setup9.CustomerSegment"),
                    style: GoogleFonts.raleway(
                      fontSize: size.width*0.04,
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
                                      choosenContainerField: "setup9.seg1",
                                    ),
                                  );
                                } else if (state is Selected) {
                                  context.read<SelectedContainerBloc>().add(
                                    UnselectContainerEvent(
                                      choosenContainerField: "setup9.seg1",
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
                                    width: (state.choosenContainerField == "setup9.seg1")? 3:1,
                                  ),
                                ),
                                child: Text(
                                  tr("setup9.seg1"),
                                  style: GoogleFonts.raleway(
                                    fontSize: size.width*0.04,
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
                                      choosenContainerField: "setup9.seg2",
                                    ),
                                  );
                                } else if (state is Selected) {
                                  context.read<SelectedContainerBloc>().add(
                                    UnselectContainerEvent(
                                      choosenContainerField: "setup9.seg2",
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
                                  width: (state.choosenContainerField == "setup9.seg2")? 3:1,
                                ),
                              ),
                              child: Text(
                                tr("setup9.seg2"),
                                style: GoogleFonts.raleway(
                                  fontSize: size.width*0.04,
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
                  text: "setup9.next",
                  onTap: () {
                    Navigator.push(
                      context,
                      SlidePageRoute(
                        page: Setup10(),
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
