import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color_constants.dart';

class SecondaryButton extends StatelessWidget {
   String? title;
   VoidCallback? callback;

   SecondaryButton({Key? key, required this.title, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorConstants.primaryColor), // Set border color to black
        borderRadius: BorderRadius.circular(5.0), // Optional: You can adjust the border radius as per your preference
      ),
      height: 0.06.sh,
      width: 1.sw,
      padding: const EdgeInsets.all(1),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white, // Set button background color to white
          elevation: 0, // Optional: Set elevation to 0 to remove button shadow
        ),
        onPressed: callback,
        child: Text(
          title??"",
          style:  TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 16, color: ColorConstants.primaryColor,fontFamily:"Roboto"),
        ),
      ),
    );
  }
}
