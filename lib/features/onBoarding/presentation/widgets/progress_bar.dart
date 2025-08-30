import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final int numOfSteps;
  const ProgressBar({super.key, required this.numOfSteps});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: List.generate(
          3,
          (index) => Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              height: 10,
              decoration: BoxDecoration(
                color: (index<numOfSteps)?Color.fromRGBO(81, 246, 171, 1):Color.fromRGBO(252, 252, 252, 1),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}