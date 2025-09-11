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
    final size=MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        color: Colors.white,
        child: Stack(
          children: [
            Align(alignment: Alignment(0, -0.92), child: TitleWidgetWithBack()),
            Align(
              alignment: const Alignment(0, -0.75),
              child: SizedBox(
                height: size.height*0.1,
                child: Column(
                  children: [
                    Text(
                      tr("setup4.subtitle"),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                        fontSize: size.width*0.045 ,
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
              alignment: Alignment(0, -0.55),
              child: Progressbar(
                step: "setup4.step",
                percentage: "setup4.persentage",
                widthFactor: 0.4,
              ),
            ),
            Align(
              alignment:(size.width>=800)? Alignment(0,-0.3): Alignment(0,-0.1),
              child: SizedBox(
                height: 250,
                child:SizedBox(
                  height: 80,
                  width: double.infinity,
                
                  child:Text(tr("setup4.roletitle"),
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.raleway(
                                  fontSize: size.width*0.042,
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontWeight: FontWeight.w500
                                ),
                                ), 
                )  ),
            ),
            Align(
              alignment: Alignment(0, 0.6),
              child: SizedBox(
                
                height:(size.width>=800)?  size.height / 2.3:size.height / 2,
                child: GridView.builder(
                  itemCount: fields.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: size.height*0.07
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
                                  fontSize: size.width*0.04,
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
                Navigator.push(context, SlidePageRoute(page: Setup5()));
              }),
            ),
          ],
        ),
      ),
    );
  }
}
