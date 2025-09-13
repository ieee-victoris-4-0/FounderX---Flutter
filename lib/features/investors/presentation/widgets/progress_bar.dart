import 'package:flutter/material.dart';

class CompatibilityProgressBar extends StatelessWidget {
  final double compatibility;
  const CompatibilityProgressBar({super.key, required this.compatibility});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,

            height: size.height * 0.012,
            decoration: BoxDecoration(
              color: Color.fromRGBO(227, 189, 253, 1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: FractionallySizedBox(
              widthFactor: compatibility,
              heightFactor: 1,
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(153, 54, 219, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
