import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:founderx/core/routes/routingSys.dart';
import 'package:founderx/features/FounderSetUpProfile/presentation/pages/InputTeqnuiqe.dart';
void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, 
    DeviceOrientation.portraitDown, 
  ]);
   runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US')],
      path: 'assets/localization', // <-- change the path of the translation files 
      fallbackLocale: Locale('en', 'US'),
      child: MainApp()
    ),
  );
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
      home:InputTeqnuiqe(),
      routes: RoutingSys.allRoutes,
    );
  }
}
