import 'package:flutter/material.dart';
import 'package:founderx/core/transitions/slide_page.dart';
import 'package:founderx/features/onBoarding/presentation/pages/onbording3.dart';
import 'package:founderx/features/onBoarding/presentation/widgets/arrows.dart';
import '../widgets/messegecontainer.dart';
import '../../../../core/presentation/widgets/progress_bar.dart';
import '../widgets/skip_btn.dart';
import '../widgets/txt_container1.dart';

class OnBoardingScreen2 extends StatefulWidget {
  const OnBoardingScreen2({super.key});

  @override
  State<OnBoardingScreen2> createState() => _OnBoardingScreen2State();
}

class _OnBoardingScreen2State extends State<OnBoardingScreen2> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Expanded(
            flex: 6,
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
                        width:size.width,
                        height: (size.width>=800

                        )?size.height*1.3:size.height,
                        "assets/boarding_feature/board2.gif",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(SlidePageRoute(page: OnBoardingScreen3()));
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
                    child: ProgressBar(numOfSteps: 2,),
                  ),
                  Container(alignment: Alignment(-1, -.7),child: TxtContainer2()),
                  Container(alignment: Alignment(-1, 0.2),child: MessegeContainer(messege: "onboarding2.messege")),
                  Container(
                    alignment: Alignment(1, 1),
                    margin: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                    Container(
                      child: RightArrow()),
                      SizedBox(width: 20,),
                    Container(
                      child: LeftArrow(widget: OnBoardingScreen3())),
                        
                      ],
                    ),)
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}
