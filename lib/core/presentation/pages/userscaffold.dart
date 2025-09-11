import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:founderx/core/presentation/blocs/userscaffold_blocs/blocs.dart';
import 'package:founderx/core/presentation/blocs/userscaffold_blocs/events.dart';
import 'package:founderx/core/presentation/blocs/userscaffold_blocs/states.dart';
import 'package:founderx/core/presentation/widgets/userScaffold_animation.dart';
import 'package:founderx/features/dashboard/presentation/pages/dashboard.dart';
import 'package:founderx/features/download_pdf/presentation/pages/downloadPdf.dart';
import 'package:founderx/features/investors/presentation/pages/investors.dart';
import 'package:founderx/features/re-enter_pitch/presentation/pages/re-enter_pitch.dart';
import 'package:founderx/features/settings/presentation/pages/settings.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core_di/core_di.dart';

class UserScaffold extends StatefulWidget {
  const UserScaffold({super.key});

  @override
  State<UserScaffold> createState() => _UserScaffoldState();
}

class _UserScaffoldState extends State<UserScaffold> {
  // Define your pages here
  Widget getCurrentPage(MovingState state) {
    if (state.alignment == Alignment(-1, -0.95)) {
      return DashboardScreen();
    } else if (state.alignment == Alignment(-0.52, -0.95)) {
      return DownloadPdf();
    } else if (state.alignment == Alignment(0, -0.95)) {
      return ReEnterPitch();
    }else if (state.alignment == Alignment(0.5, -0.95)) {
      return Investors();
    }else if (state.alignment == Alignment(1, -0.95)) {
      return SettingsScreen();
    }
    return DashboardScreen(); 
  }
  final userScaffoldBloc =sl<UserScaffoldBloc>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => userScaffoldBloc,
      child: BlocBuilder<UserScaffoldBloc, MovingState>(
        builder: (context, state) {
          return Scaffold(
            extendBody: true,
            body: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SlideTransition(
                  position: animation.drive(
                    Tween(begin: Offset(1.0, 0.0), end: Offset.zero),
                  ),
                  child: child,
                );
              },
              child: Container(
                key: ValueKey(state.alignment.toString()),
                child: getCurrentPage(state),
              ),
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              height: size.height * 0.18,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: size.height * 0.12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        color: Color.fromRGBO(153, 54, 219, 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            offset: Offset(0, -2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // Dashboard Tab
                          Expanded(
                            child: _buildNavItem(
                              context: context,
                              state: state,
                              alignment: Alignment(-1, -0.95),
                              label: "Dashboard",
                              svgAsset: "assets/core/dashboard.svg",
                              page: DashboardScreen(),
                              size: size,
                            ),
                          ),
                          // Investors Tab
                          Expanded(
                            child: _buildNavItem(
                              context: context,
                              state: state,
                              alignment: Alignment(-0.52, -0.95),
                              label: "Download",
                              svgAsset: "assets/core/download.svg",
                              page: SettingsScreen(),
                              size: size,
                            ),
                          ),
                          Expanded(
                            child: _buildNavItem(
                              context: context,
                              state: state,
                              alignment: Alignment(0, -0.95),
                              label: "Re-enter",
                              svgAsset: "assets/core/re_enter.svg",
                              page: SettingsScreen(),
                              size: size,
                            ),
                          ),
                          Expanded(
                            child: _buildNavItem(
                              context: context,
                              state: state,
                              alignment: Alignment(0.5, -0.95),
                              label: "Investors",
                              svgAsset: "assets/core/investors.svg",
                              page: SettingsScreen(),
                              size: size,
                            ),
                          ),
                          Expanded(
                            child: _buildNavItem(
                              context: context,
                              state: state,
                              alignment: Alignment(1, -0.95),
                              label: "Settings",
                              svgAsset: "assets/core/settings.svg",
                              page: SettingsScreen(),
                              size: size,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AnimatedAlign(
                    duration: Duration(milliseconds: 500),
                    alignment: state.alignment,
                    curve: Curves.easeInOut,
                    child: UserScaffoldAnimation(svg: state.svg),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required MovingState state,
    required Alignment alignment,
    required String label,
    required String svgAsset,
    required Widget page,
    required Size size,
  }) {
    bool isSelected = state.alignment == alignment;
    
    return InkWell(
      onTap: () {
        context.read<UserScaffoldBloc>().add(
          MovingEvent(
            alignment: alignment,
            svg: svgAsset,
            page: page,
          ),
        );
      },
      child: isSelected
          ? Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.01,
                top: size.height * 0.05,
              ),
              child: Text(
                label,
                style: GoogleFonts.raleway(
                  fontSize:size.width * 0.035,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(243, 242, 242, 1),
                ),
              ),
            )
          : SvgPicture.asset(
              svgAsset,
              height: (size.width >= 800)
                  ? size.height * 0.05
                  : size.height * 0.04,
            ),
    );
  }
}