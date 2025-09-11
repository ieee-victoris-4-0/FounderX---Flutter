import 'package:flutter/material.dart';

class SlidePageRoute extends PageRouteBuilder {
  final Widget page;
  SlidePageRoute({
    required this.page,
    Duration duration = const Duration(milliseconds: 500),
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: duration,
          reverseTransitionDuration: duration,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.easeInOut;

    final tween =
        Tween<Offset>(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
}

