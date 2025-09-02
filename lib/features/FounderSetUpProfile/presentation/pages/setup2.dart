import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:founderx/core/transitions/slide_page.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/blocs/blocs.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/blocs/events.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/blocs/states.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/pages/setup3.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/customed_containers.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/nextBtn.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/progressBar.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/titleWidget.dart';
import 'package:google_fonts/google_fonts.dart';

class Setup2 extends StatelessWidget {
   Setup2({Key? key}) : super(key: key);
  final List<String> svgs=['assets/setUp_profile_feature/health.svg',
  'assets/setUp_profile_feature/finetech.svg',
  'assets/setUp_profile_feature/techandsoftware.svg',
  'assets/setUp_profile_feature/consumer.svg',
  ];
  final List<String> fields=[
    "setup2.f1",
    "setup2.f2",
    "setup2.f3",
    "setup2.f4",
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
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
                            tr("setup2.subtitle"),
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
                                tr("setup2.subtitle2"),
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
              child:Progressbar(step: "setup2.step", percentage: "setup2.persentage", widthFactor: 0.33) 
            ),
            Align(
              alignment: Alignment(0, 0.4),
              child: BlocProvider(
                create: (context) => SelectedContainerBloc(),
                child: BlocBuilder<SelectedContainerBloc, SelectedContainerState>(
                  builder: (context, state) {
                    return Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ListView.builder(

                      itemCount: svgs.length,
                      itemBuilder: (context, index) {
                        return SelectableContainer(field: fields[index], onTap: () {
                          context.read<SelectedContainerBloc>().add(SelectContainerEvent(choosenContainerField: fields[index]));
                        }, state: state, svg: svgs[index]);
                      },
                    ),
                  );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.8),
              child: NextBtn(
                text: "setup1.next",
                onTap: () {
                    Navigator.push(context, SlidePageRoute(pageBuilder: (context, animation, secondaryAnimation) =>
                             Setup3()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}