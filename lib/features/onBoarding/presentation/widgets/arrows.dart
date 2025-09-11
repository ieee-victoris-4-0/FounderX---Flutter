import 'package:flutter/material.dart';
import 'package:founderx/core/transitions/slide_page.dart';

class LeftArrow extends StatelessWidget {
  final Widget widget;
  const LeftArrow({super.key, required this.widget});
  @override
  Widget build(BuildContext context) {
    return
          InkWell(
            onTap: (){
              Navigator.of(context).push(SlidePageRoute(page: widget));
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
            
                shape: BoxShape.circle,
                color: Color.fromRGBO(153, 54, 219, 1),
              ),
              child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,)),
          );
  }
}
class RightArrow extends StatelessWidget {
  const RightArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return
          InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(153, 54, 219, 1)),
              shape: BoxShape.circle,
              color: Colors.transparent,
            ),
            child: Icon(Icons.arrow_back_ios_rounded,color: Color.fromRGBO(153, 54, 219, 1),)));
  }
}