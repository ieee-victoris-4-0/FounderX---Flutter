import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final int numOfSteps;
  const ProgressBar({super.key, required this.numOfSteps});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(

      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: List.generate(
          3,
          (index) => Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: size.width*0.015),
              height: size.height*0.013,
              decoration: BoxDecoration(
                color: (index<numOfSteps)?Color.fromRGBO(81, 246, 171, 1):Color.fromRGBO(205, 204, 204, 1),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}