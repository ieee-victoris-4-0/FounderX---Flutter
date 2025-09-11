import 'package:flutter/material.dart';
import 'package:founderx/core/transitions/slide_page.dart';
import 'package:founderx/features/auth/presentation/pages/signIn.dart';
import 'package:founderx/features/onBoarding/presentation/widgets/arrows.dart';
import 'package:founderx/features/onBoarding/presentation/widgets/messegecontainer.dart';
import '../../../../core/presentation/widgets/progress_bar.dart';
import '../widgets/skip_btn.dart';
import '../widgets/txt_container1.dart';
class OnBoardingScreen3 extends StatefulWidget {
  const OnBoardingScreen3({super.key});
  @override
  State<OnBoardingScreen3> createState() => _OnBoardingScreen3State();
}
class _OnBoardingScreen3State extends State<OnBoardingScreen3> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
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
width:size.width,
                        height: (size.width>=800

                        )?size.height*1.3:size.height,
                        "assets/boarding_feature/board3.gif",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(SlidePageRoute(page: SignInScreen()));
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
                    child: ProgressBar(numOfSteps: 3,),
                  ),
                  Container(alignment: Alignment(-1, -.7),child: TxtContainer3()),
                  Container(alignment: Alignment(-1, 0.1),child: MessegeContainer(messege: "onboarding3.messege")),
                  Container(
                    alignment: Alignment(1, 0.9),
                    margin: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                    Container(
                      child: RightArrow()),
                      SizedBox(width: 20,),
                    Container(
                      child: LeftArrow(widget: SignInScreen())),
                        
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