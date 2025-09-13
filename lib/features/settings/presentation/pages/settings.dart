import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:founderx/features/settings/presentation/blocs/blocs.dart';
import 'package:founderx/features/settings/presentation/blocs/events.dart';
import 'package:founderx/features/settings/presentation/blocs/states.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: (size.height * 0.15)),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.04,
          vertical: size.height * 0.05,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Text(
                    "Account",
                    style: GoogleFonts.raleway(
                      fontSize: size.width * 0.06,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(left: size.width * 0.03),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/settings_feature/user.svg",
                              ),
                              SizedBox(width: size.width * 0.03),
                              Text(
                                "Main Information",
                                style: GoogleFonts.raleway(
                                  fontSize: size.width * 0.05,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: const Color.fromARGB(255, 110, 109, 109),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/settings_feature/subscription.svg",
                              ),
                              SizedBox(width: size.width * 0.03),
                              Text(
                                "Subscription Plan",
                                style: GoogleFonts.raleway(
                                  fontSize: size.width * 0.05,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: const Color.fromARGB(255, 110, 109, 109),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Text(
                    "Notification Settings",
                    style: GoogleFonts.raleway(
                      fontSize: size.width * 0.06,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(left: size.width * 0.03),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/settings_feature/notification.svg",
                              ),
                              SizedBox(width: size.width * 0.03),
                              Text(
                                "Email Notifications",
                                style: GoogleFonts.raleway(
                                  fontSize: size.width * 0.05,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        BlocProvider(
                          create: (context) => SwitchBloc(),
                          child: BlocBuilder<SwitchBloc, SwitchState>(
                            builder: (context, state) {
                              return Padding(
                                padding: EdgeInsets.only(right: size.width * 0.04),
                                child: Switch(
                                  value: state.value,
                                  onChanged: (value) {
                                    context.read<SwitchBloc>().add(SwitchEvent(value: value));
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/settings_feature/newsletter.svg",
                              ),
                              SizedBox(width: size.width * 0.03),
                              Text(
                                "Weekly Newsletter",
                                style: GoogleFonts.raleway(
                                  fontSize: size.width * 0.05,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child:BlocProvider(
                          create: (context) => SwitchBloc(),
                          child: BlocBuilder<SwitchBloc, SwitchState>(
                            builder: (context, state) {
                              return Padding(
                                padding: EdgeInsets.only(right: size.width * 0.04),
                                child: Switch(
                                  value: state.value,
                                  onChanged: (value) {
                                    context.read<SwitchBloc>().add(SwitchEvent(value: value));
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Text(
                    "Other Settings",
                    style: GoogleFonts.raleway(
                      fontSize: size.width * 0.06,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.only(left: size.width * 0.03),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/settings_feature/help.svg",
                              ),
                              SizedBox(width: size.width * 0.03),
                              Text(
                                "Get Help",
                                style: GoogleFonts.raleway(
                                  fontSize: size.width * 0.05,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: const Color.fromARGB(255, 110, 109, 109),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/settings_feature/about.svg",
                              ),
                              SizedBox(width: size.width * 0.03),
                              Text(
                                "About App",
                                style: GoogleFonts.raleway(
                                  fontSize: size.width * 0.05,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: const Color.fromARGB(255, 110, 109, 109),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/settings_feature/logout.svg",
                              ),
                              SizedBox(width: size.width * 0.03),
                              Text(
                                "Log Out",
                                style: GoogleFonts.raleway(
                                  fontSize: size.width * 0.05,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: const Color.fromARGB(255, 110, 109, 109),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
