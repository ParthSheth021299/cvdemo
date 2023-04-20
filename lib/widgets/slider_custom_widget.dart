import 'package:flutter/material.dart';

/**
 * Created by Parth Sheth.
 * Created on 18/04/23 at 3:01 pm
 */

class CustomSlider extends StatefulWidget {
  const CustomSlider({Key? key}) : super(key: key);

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {

  double skillValue = 2;

  @override
  Widget build(BuildContext context) {
    return Slider(
        value: skillValue,
        min: 1.0,
        max: 5.0,
        onChanged: (value) {
          setState(() {
            skillValue = value.roundToDouble();
          });
          print('Value: ${skillValue}');
        });
  }
}
