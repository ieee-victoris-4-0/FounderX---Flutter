import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:founderx/features/onBoarding/presentation/pages/onboarding1.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/transitions/fade_page.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../widget/splash_widget.dart';

enum SplashScene {
  scene1,
  scene2,
  scene3,
}

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1>
    with TickerProviderStateMixin {
      var _scene=SplashScene.scene1;
      double _width=0;
      double _height=0;
      late AnimationController _controller;
      late Animation<Offset> _offsetAnimation;
      late AnimationController _svgcontroller;
      late AnimationController _txtController;
      late Animation<double> _scale;
      late Animation<double> _fade;
      late Animation<double> _textFade;
      scene1() async{
        await Future.delayed(const Duration(seconds: 1));
        setState(() {
          _width=250;
          _height=250;
        });
        await Future.delayed(const Duration(seconds: 2));
        setState(() {
          _scene=SplashScene.scene2;
          _width=300;
          _height=300;
          
        });
        await Future.delayed(const Duration(seconds: 2));
        setState(() {
          _scene=SplashScene.scene3;
          _width=MediaQuery.of(context).size.width;
          _height=MediaQuery.of(context).size.height;
          _controller.forward();
        });
        await Future.delayed(const Duration(seconds: 2));
        setState(() {
          _svgcontroller.forward();
          _txtController.forward();
        });
        await Future.delayed(const Duration(seconds: 1));
        Navigator.push(context, FadePageRoute(pageBuilder: (context, animation, secondaryAnimation) {
          return OnBoardingScreen1();
        }));
      }
      @override
  void initState() {
      _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    // هنا هنعمل tween من اليمين للشمال
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.31, 1.5), // خارج الشاشة من اليمين
      end: Offset(0.31,0.62),              // مكانه الطبيعي
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );
    _svgcontroller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _txtController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
        _scale = Tween<double>(begin: 1.0, end: 2.5).animate(
      CurvedAnimation(parent: _svgcontroller, curve: Curves.easeOut),
    );

    _fade = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _svgcontroller, curve: Curves.easeIn),
    );
    _textFade = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _txtController,
        curve: const Interval(0.33, 1.0, curve: Curves.easeIn),
      ),
    );
    // TODO: implement initState
    super.initState();
    scene1();
  }
      @override
      
      Widget build(BuildContext context) {
        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              AnimatedAlign(alignment:(_width==0)? Alignment.topCenter: Alignment.center, duration: const Duration(milliseconds:1000),
              child: CustomPaint(
                painter:(_scene==SplashScene.scene2)? CircleWithShadowsPainter():null,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds:300 ),
                  width: _width,
                  height: _height,
                  decoration: BoxDecoration(
                    shape:(_scene==SplashScene.scene1 || _scene==SplashScene.scene2)? BoxShape.circle:BoxShape.rectangle,
                    gradient: (_scene==SplashScene.scene1)?LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(47, 229, 147, 1),
                        Color.fromRGBO(114, 9, 183, 1)
                      ]
                    ):(_scene==SplashScene.scene3)?LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(47, 229, 147, 1),
                        Color.fromRGBO(114, 9, 183, 1)
                      ]
                    ):null,
                  ),
                  child: Center(
                    child: FadeTransition(
                      opacity: _fade,
                      child: ScaleTransition(
                        scale: _scale,
                        child: SvgPicture.asset(
                        _scene==SplashScene.scene1 ? 'assets/splash_feature/splash2.svg' :(_scene==SplashScene.scene2)? 'assets/splash_feature/Logo.svg': 'assets/splash_feature/splash2.svg',
                                        ),
                      ),
                    ),
                  ),
          ),
                  
                  ),
              ),
              (_scene==SplashScene.scene3)?FadeTransition(
                opacity: _textFade,
                child: SlideTransition(position: _offsetAnimation,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Founder',
                        style: GoogleFonts.jura(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: ' X',
                        style: GoogleFonts.jura(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(81, 246, 171, 1),
                        ),
                      ),
                    ],
                  ),
                )
                ),
              ):SizedBox.shrink(),

              
            ],
          )
        );
      }
  
}

class CircleWithShadowsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width/1.5;

    // Draw drop shadow
    final shadowPaint = Paint()
      ..color = const Color.fromRGBO(170, 77, 232, 0.41)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 16);

    canvas.drawCircle(center, radius + 16, shadowPaint);

    // Draw main circle
    final circlePaint = Paint()..color = const Color(0xFFF7F7F7);

    canvas.drawCircle(center, radius, circlePaint);

    // Inner shadow effect using gradient
    final innerShadowPaint = Paint()
      ..shader = const RadialGradient(
        colors: [
          Colors.white,
          Color.fromRGBO(170, 77, 232, 0.5),
        ],
        stops: [0.85, 1],
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    canvas.drawCircle(center, radius, innerShadowPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
