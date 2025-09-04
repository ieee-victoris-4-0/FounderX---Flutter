import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/blocs/blocs.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/pages/setup5.dart';

import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/nextBtn.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/progressBar.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/titleWidget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/transitions/slide_page.dart';
import '../blocs/events.dart';
import '../blocs/states.dart';

class Setup4 extends StatelessWidget {
  final List<String> fields = [
    "setup4.r1",
    "setup4.r2",
    "setup4.r3",
    "setup4.r4",
    "setup4.r5",
    "setup4.r6",
    "setup4.r7",
    "setup4.r8",
    "setup4.r9",
    "setup4.r10",
  ];
   Setup4({super.key});
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
                      tr("setup4.subtitle"),
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
                          tr("setup4.subtitle2"),
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
              alignment: Alignment(0, -0.5),
              child: Progressbar(
                step: "setup4.step",
                percentage: "setup4.persentage",
                widthFactor: 0.44,
              ),
            ),
            Align(
              alignment: Alignment(0,-0.05),
              child: SizedBox(
                height: 250,
                child:SizedBox(
                  height: 80,
                  width: double.infinity,
                
                  child:Text(tr("setup4.roletitle"),
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.raleway(
                                  fontSize: 18,
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontWeight: FontWeight.w500
                                ),
                                ), 
                )  ),
            ),
            Align(
              alignment: Alignment(0, 0.5),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: GridView.builder(
                  itemCount: fields.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 60
                  ),
                  itemBuilder: (context, index) {
                    return BlocProvider(
                      create: (context) => SelectedContainerBloc(),
                      child: BlocBuilder<SelectedContainerBloc, SelectedContainerState>(
                        builder: (context, state) {
                          return InkWell(
                            onTap: () {
                              if(state.choosenContainerField == fields[index]){
                              context.read<SelectedContainerBloc>().add(
                                UnselectContainerEvent(choosenContainerField: fields[index])
                              );
                              }else{
                              context.read<SelectedContainerBloc>().add(
                                SelectContainerEvent(choosenContainerField: fields[index])
                              );
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Color.fromRGBO(153, 54, 219, 1),
                                  width: (state.choosenContainerField == fields[index])? 3:1,
                                ),
                              ),
                              child: Center(
                                child: Text(tr(fields[index]),
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.raleway(
                                  fontSize: 20,
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontWeight: FontWeight.w600
                                ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.92),
              child: NextBtn(text: "setup4.next", onTap: () {
                Navigator.push(context, SlidePageRoute(pageBuilder: (context, animation, secondaryAnimation) =>
                              Setup5()));
              }),
            ),
          ],
        ),
      ),
    );
  }
}
