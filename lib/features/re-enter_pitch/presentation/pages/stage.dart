import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/blocs/blocs.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/blocs/events.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/blocs/states.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/customed_containers.dart';

import 'package:founderx/features/re-enter_pitch/presentation/widgets/button.dart';
import 'package:founderx/features/re-enter_pitch/presentation/widgets/pagebar.dart';
import 'package:google_fonts/google_fonts.dart';
class Stage extends StatelessWidget {
  Stage({super.key});

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
          BlocProvider(create: (context) => SelectedContainerBloc()..add(SelectContainerEvent(choosenContainerField: ""))),
        ],
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          color: Colors.white,
          child: Stack(
            children: [
              Align(
                alignment: const Alignment(0, -0.92),
                child: const PageBar(),
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
                              child: SvgPicture.asset("assets/re_enterPitch/icons/stage.svg",
                              fit: BoxFit.contain,
                              ),
                            )),
                          Expanded(flex: 1,
                            child: Text(
                              tr("setup8.subtitle"),
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
                alignment: const Alignment(0, 0.1),
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
                    child:InkWell(
                onTap: (){},
                child:ReEnterButton() )
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
