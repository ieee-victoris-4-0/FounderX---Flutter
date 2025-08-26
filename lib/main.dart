import 'package:flutter/material.dart';
import 'package:founderx/features/splash_screen/presentation/pages/splash1.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:SplashScreen1(),
    );
  }
}
