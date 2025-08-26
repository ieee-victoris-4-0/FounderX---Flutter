import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen1 extends StatefulWidget{
    const SplashScreen1({Key? key}) : super(key: key);

    @override
    State<SplashScreen1> createState() => _SplashScreen1State();
}
class _SplashScreen1State extends State<SplashScreen1> {
    bool _change_size=false;
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1),(){
      setState(() {
        _change_size=true;
      });
    });
  }
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Container(
                child:Stack(
                  children: [
                    Center(
                      child: AnimatedContainer(
                          width: !_change_size?0:250,
                          height:! _change_size?0:250,
                          duration: const Duration(seconds: 3),
                          curve: Curves.easeInOut,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(120),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                  colors: [
                                      Color.fromRGBO(47, 229, 147, 1),
                                      Color.fromRGBO(114, 9, 183, 1)
                                  ],
                              ),
                          ),
                      
                      ),
                    ),
                    Center(
                        child: SvgPicture.asset('assets/splash_feature/splash2.svg'),
                    )
                  ],
                )
            ),
            
        );
    }
}