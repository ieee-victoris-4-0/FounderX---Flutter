import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:founderx/core/presentation/pages/userscaffold.dart';
import 'package:founderx/core/routes/routingSys.dart';

import 'global_di/global_di.dart';
void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    setupLocator();
    await EasyLocalization.ensureInitialized();
 SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
     runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US')],
      path: 'assets/localization', 
      fallbackLocale: Locale('en', 'US'),

      child: DevicePreview(
        builder: (context) => 
        MainApp(),
      ),
      // child: MainApp(),
    ),
  );
  });
  
}

class MainApp extends StatelessWidget {

  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      builder: (context, child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
        child: child!,
      );
    },
      // home:InputTeqnuiqe(),
      // home:SignUpScreen(),
      home:UserScaffold(),
      routes: RoutingSys.allRoutes,
    );
  }
}