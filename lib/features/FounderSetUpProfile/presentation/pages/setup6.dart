import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:founderx/core/transitions/slide_page.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/blocs/blocs.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/blocs/events.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/blocs/states.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/pages/setup7.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/nextBtn.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/progressBar.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/roles_container.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/widgets/titleWidget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/txtfields.dart';

class Setup6 extends StatelessWidget {
  Setup6({super.key});
  final List<String> roles = ["CEO", "CTO", "CFO"];
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController roleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => RoleContainerBloc(),
        child: BlocBuilder<RoleContainerBloc, RoleContainerState>(
          builder: (context, roleContainerState) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              color: Colors.white,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment(0, -0.92),
                    child: TitleWidgetWithBack(),
                  ),
                  Align(
                    alignment: const Alignment(0, -0.92),
                    child: TitleWidgetWithBack(),
                  ),
                  Align(
                    alignment: const Alignment(0, -0.65),
                    child: SizedBox(
                      height: size.height * 0.25,
                      child: Column(
                        children: [
                          Text(
                            tr("setup6.subtitle"),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.raleway(
                              fontSize: size.width * 0.045,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(153, 54, 219, 1),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                tr("setup6.subtitle2"),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.raleway(
                                  fontSize: size.width * 0.04,
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
                      step: "setup6.step",
                      percentage: "setup6.persentage",
                      widthFactor: 0.6,
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, -0.1),
                    child: Form(
                      key: formKey,
                      child: SizedBox(
                        height: size.height*0.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomTextField(
                              hint: "setup6.hint1",
                              controller: nameController,
                            ),

                            RolesContainer(
                              txt: roleContainerState.role,
                              drop: roleContainerState.drop,
                              onTap: () {
                                context.read<RoleContainerBloc>().add(RoleContainerEvent(drop: roleContainerState.drop==Drop.down?Drop.up:Drop.down, role: roleContainerState.role));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, roleContainerState.drop==Drop.up?0.7:0.5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        (roleContainerState.drop==Drop.up)?
                        Container(

                          margin: EdgeInsets.only(bottom: size.height*0.05),
                          height: size.height*0.2,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(227, 229, 229, 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children:roles.map<Widget>((item){
                              return Container(
                                height: size.height*0.05,
                                margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                decoration: BoxDecoration(
                                color:(roleContainerState.role==item)? Colors.white:Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: ListTile(
                                    titleTextStyle: GoogleFonts.raleway(
                                      fontSize: size.width*0.04,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(15, 15, 15, 1),
                                    ),
                                    title: Text(item),
                                    enabled: true,
                                    onTap: () {
                                      context.read<RoleContainerBloc>().add(RoleContainerEvent(drop: roleContainerState.drop==Drop.down?Drop.up:Drop.down, role: item));
                                    },
                                  ),
                                ),
                              );
                            }).toList()
                          ),
                        ):SizedBox.shrink(),
                        NextBtn(
                          text: "setup6.next",
                          onTap: () {
                            if (true) {
                              Navigator.push(
                                context,
                                SlidePageRoute(page: Setup7()),
                              );
                            }
                          },
                        ),
                      ],
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
