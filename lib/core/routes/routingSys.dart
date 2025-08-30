import 'package:flutter/material.dart';

import '../../features/onBoarding/presentation/pages/onboarding1.dart';

class RoutingSys{
  static Map<String, WidgetBuilder>get allRoutes => {
    '/onBoarding1': (context) => OnBoardingScreen1(),
  };
}
