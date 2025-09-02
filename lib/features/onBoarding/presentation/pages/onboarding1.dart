import 'package:flutter/material.dart';
import 'package:founderx/core/transitions/slide_page.dart';
import 'package:founderx/features/onBoarding/presentation/pages/onboarding2.dart';
import 'package:founderx/features/onBoarding/presentation/widgets/arrows.dart';
import 'package:founderx/features/onBoarding/presentation/widgets/messegecontainer.dart';
import '../../../../core/widgets/progress_bar.dart';
import '../widgets/skip_btn.dart';
import '../widgets/txt_container1.dart';
class OnBoardingScreen1 extends StatefulWidget {
  const OnBoardingScreen1({super.key});
  @override
  State<OnBoardingScreen1> createState() => _OnBoardingScreen1State();
}
class _OnBoardingScreen1State extends State<OnBoardingScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: FittedBox(
                      fit: BoxFit.cover,  
                      child: Image.asset(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height-100,
                        "assets/boarding_feature/board1.gif",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(SlidePageRoute(pageBuilder: (context, animation, secondaryAnimation) {
                        return OnBoardingScreen2();
                      }));
                    },
                    child: SkipBtn()),
                ],
              ),
            ),  
          ),
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(235, 234, 234, 1),
              ),
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.topCenter,
                    child: ProgressBar(numOfSteps: 1,),
                  ),
                  Container(alignment: Alignment(-1, -.6),child: TxtContainer1()),
                  Container(alignment: Alignment(-1, 0.1),child: MessegeContainer(messege: "onboarding1.messege")),
                  Container(
                    alignment: Alignment(1, 0.9),
                    margin: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(SlidePageRoute(pageBuilder: (context, animation, secondaryAnimation) {
                          return OnBoardingScreen2();
                        }));
                      },
                      child: Container(
                        child: LeftArrow(widget: OnBoardingScreen2())),
                    ),
                        
                      ],
                    ),
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}