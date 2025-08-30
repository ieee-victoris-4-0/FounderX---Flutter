import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashWidget extends StatefulWidget {

   const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  bool _isXVisible = false;
  bool startWriting=false;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        startWriting = true;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print("media height${MediaQuery.of(context).size.height}");
    return AnimatedContainer(duration:
    const Duration(seconds: 2),
    curve: Curves.easeOut,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        MediaQuery.of(context).size.height/2    
        
        ),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(47, 229, 147, 1),
          Color.fromRGBO(114, 9, 183, 1)
        ],
                      ), 
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/splash_feature/splash2.svg'),
        SizedBox(height: 20,),
      Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    (startWriting)?AnimatedTextKit(
      onFinished: () {
        setState(() {
          _isXVisible = true;
        });
      },
      repeatForever: false,
      totalRepeatCount: 1,
      animatedTexts: [
        TypewriterAnimatedText(
          'Founder',
          cursor: '',
          speed: const Duration(milliseconds: 100),
          textStyle: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ):SizedBox.shrink(),
    const SizedBox(width: 2),
    AnimatedOpacity(
      opacity: _isXVisible ? 1 : 0,
      duration: const Duration(milliseconds: 150),
      child: Text(
        'X',
        style: GoogleFonts.poppins(
          color: const Color.fromRGBO(81, 246, 171, 1),
          fontSize: 25,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  ],
)

      ],
    ),
    );
  }
}