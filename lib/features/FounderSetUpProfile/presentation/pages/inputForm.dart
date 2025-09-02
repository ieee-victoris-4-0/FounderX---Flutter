import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/blocs/blocs.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/blocs/events.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/blocs/states.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/titleWidget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/analyzebutton.dart';
import '../widgets/inputfield.dart';

class InputForm extends StatelessWidget {
  InputForm({super.key});

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => ButtonBloc(),
        child: BlocBuilder<ButtonBloc, ButtonState>(
          builder: (context, state) {
            return Container(
              color: Colors.white,
              child: Stack(
                children: [
                  Align(
                    alignment: const Alignment(0, -0.92),
                    child: TitleWidgetWithBack(),
                  ),
                  Align(
                    alignment: const Alignment(0, -0.65),
                    child: SizedBox(
                      height: 100,
                      child: Column(
                        children: [
                          Text(
                            tr("inputForm.subtitle"),
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
                                tr("inputForm.subtitle2"),
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
                    alignment: const Alignment(0, 0.2),
                    child: Inputfield(textEditingController: textEditingController, onchabged:
                    (value) {
                          if (value.isNotEmpty) {
                            context
                                .read<ButtonBloc>()
                                .add(EnableButtonEvent());
                          } else {
                            context
                                .read<ButtonBloc>()
                                .add(DisableButtonEvent());
                          }
                        },
                     height: MediaQuery.of(context).size.width - 40,),
                  ),
                  Align(
                    alignment: const Alignment(0, 0.8),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Analyzebutton(
                        text: "inputForm.next",
                        onTap: () {
                          // Action when button tapped
                        },
                        state: state,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
