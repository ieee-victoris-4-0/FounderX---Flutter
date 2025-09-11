import 'package:flutter/material.dart';

class FadePageRoute extends PageRouteBuilder {
  FadePageRoute({required super.pageBuilder})
      : super(transitionDuration: const Duration(milliseconds: 500));

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {

    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
