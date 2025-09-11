import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserScaffoldAnimation extends StatefulWidget {
  final String svg;
  const UserScaffoldAnimation({super.key, required this.svg});

  @override
  State<UserScaffoldAnimation> createState() => _UserScaffoldAnimationState();
}

class _UserScaffoldAnimationState extends State<UserScaffoldAnimation>  {


  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return SizedBox(
    width: size.width*0.2,
    height: size.height*0.12,
    child: Stack(
      children: [
        Center(
          child: SvgPicture.asset("assets/core/movable_widget.svg",
          height:size.height*0.1,
          ),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.all((size.width>=800)?size.width*0.02:size.width*0.03),
            decoration: BoxDecoration(
              color: Color.fromRGBO(153, 54, 219, 1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(widget.svg,
            height:(size.width>=800)? size.height*0.04: size.height*0.035,
            ),
          ),
        ),
      ],
    ),
          );
  }
}