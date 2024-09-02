import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class CustomCheckbox extends StatelessWidget {
  CustomCheckbox({super.key, required this.value, required this.callBack});
  bool? value;
  var callBack;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.2, // Adjust the scale factor as needed
      child: Checkbox(
          activeColor: ColorConstants.secondaryColor,
          value: value, // Example value
          onChanged: callBack),
    );
  }
}