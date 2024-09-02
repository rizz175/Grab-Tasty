import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color_constants.dart';

class PrimaryButton extends StatelessWidget {
   String? title;
   VoidCallback? callback;

  PrimaryButton({Key? key, required this.title, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.06.sh,
      width: 0.9.sw,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(ColorConstants.secondaryColor),
        ),
        onPressed: callback,
        child: Text(
          title??"",
          style: const TextStyle(
            color: Colors.white,
            fontFamily:"Roboto",
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
