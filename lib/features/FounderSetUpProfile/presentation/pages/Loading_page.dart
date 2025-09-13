import 'package:flutter/material.dart';
import 'package:founderx/core/presentation/pages/userscaffold.dart';
import 'package:founderx/core/transitions/slide_page.dart';

class LoadingPage extends StatefulWidget {
   LoadingPage();

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 7), () {
      if(mounted){
        Navigator.pushReplacement(
          context,
          SlidePageRoute(page: UserScaffold()),
        );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/core/loading.gif"),
      ),
    );
  }
}