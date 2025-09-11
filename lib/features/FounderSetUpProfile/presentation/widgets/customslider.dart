import 'package:flutter/material.dart';

class CustomizedSlider extends StatelessWidget {
  final double value;
  final Function(double) onChanged;
  const CustomizedSlider({super.key, required this.value, required this.onChanged});
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return SizedBox(
      height: size.height*0.015,
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(     
          trackHeight: size.height*0.015,
          activeTrackColor: const Color.fromRGBO(153, 54, 219, 1),
          inactiveTrackColor: const Color.fromRGBO(227, 189, 253, 1),
        ),
        child: Slider(

          padding: EdgeInsets.zero,
          value: value,
          min: 0,
          max: 100,
          divisions: 100,
          label:null,
          onChanged: onChanged,
        ),
      ),
    );
  }
}