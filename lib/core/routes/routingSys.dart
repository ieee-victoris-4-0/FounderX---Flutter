import 'package:flutter/material.dart';
import 'package:founderx/features/auth/presentation/pages/signUp.dart';

import '../../features/auth/presentation/pages/signIn.dart';
import '../../features/onBoarding/presentation/pages/onboarding1.dart';

class RoutingSys{
  static Map<String, WidgetBuilder>get allRoutes => {
    '/onBoarding1': (context) => OnBoardingScreen1(),
    '/signUp': (context) => SignUpScreen(),
    '/signIn': (context) => SignInScreen(),
  };
}
