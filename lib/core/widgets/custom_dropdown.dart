import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../constants/color_constants.dart';

class CustomDropdown extends StatelessWidget {
  CustomDropdown({
    super.key,
    required this.onTap,
    required this.value,
    required this.hint,
    required this.label
  });


  Callback? onTap;
  String? value;
  String? hint;
  String? label;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label??"",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(
                  color: Colors.black87,
                  fontSize: 13,
                  fontFamily: "RobotoRegular"),
            ),

          ],
        ),
        const SizedBox(
          height: 5,
        ),
        GestureDetector(
            onTap:onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              height: 45,
              width: 1.sw,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                        value ?? hint!,
                        style: TextStyle(
                            fontFamily: "RobotoRegular",
                            fontSize: 14,
                            color: value == null
                                ? Colors.black45
                                : ColorConstants.primaryColor),maxLines: 2,overflow: TextOverflow.ellipsis,),
                  ),
                  const SizedBox(width: 10,),
                  Icon(Icons.keyboard_arrow_down,color: ColorConstants.secondaryColor,)
                ],
              ),
            )),
      ],
    );
  }
}
