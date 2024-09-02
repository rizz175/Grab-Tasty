import 'package:grabtasty/core/widgets/text_widgets.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../constants/assets_constants.dart';
import '../constants/color_constants.dart';

class Widgets {
  static var heightSpaceH05 = SizedBox(
    height: 0.005.sh,
  );
  static var heightSpaceH1 = SizedBox(
    height: 0.01.sh,
  );
  static var heightSpaceH2 = SizedBox(
    height: 0.02.sh,
  );
  static var heightSpaceH3 = SizedBox(
    height: 0.03.sh,
  );
  static var heightSpaceH4 = SizedBox(
    height: 0.04.sh,
  );
  static var heightSpaceH5 = SizedBox(
    height: 0.05.sh,
  );
  static var widthSpaceW1 = SizedBox(
    width: 0.01.sw,
  );
  static var widthSpaceW2 = SizedBox(
    width: 0.02.sw,
  );
  static var widthSpaceW3 = SizedBox(
    width: 0.03.sw,
  );

  static noRecordsFound({required String? title}) {
    return Center(
        child: Padding(
      padding: EdgeInsets.only(top: 240),
      child: Text(
        title ?? "",
        style: TextStyle(color: Colors.black54, fontSize: 16),
      ),
    ));
  }

  static noFound() {
    return const Center(
        child: Padding(
      padding: EdgeInsets.only(top: 0),
      child: Text(
        "No Data Found",
        style: TextStyle(color: Colors.black54, fontSize: 16),
      ),
    ));
  }

  static var blockDecoration = BoxDecoration(
      color: Colors.white, borderRadius: BorderRadius.circular(10));
  static customDivider(
      {bool isVertical = false,
      Color? color,
      double? padding,
      double? thickness}) {
    return Padding(
      padding: padding != null
          ? EdgeInsets.symmetric(vertical: padding)
          : const EdgeInsets.only(top: 5.0),
      child: isVertical
          ? VerticalDivider(
              thickness: 1.0,
              color: color ?? Colors.black12,
            )
          : Divider(
              height: 1.0,
              thickness: thickness ?? 1.0,
              color: color ?? Colors.black12,
            ),
    );
  }

  static buildRatingStar(num starValue, {bool? isCenter, double? size}) {
    Color color = starValue < 2 ? Colors.orangeAccent : Colors.orangeAccent;
    var starIconsMap = [1, 2, 3, 4, 5].map((e) {
      if (starValue >= e) {
        return Icon(
          Icons.star_rate,
          color: color,
          size: size ?? 14,
        );
      } else if (starValue < e && starValue > e - 1) {
        return Icon(
          Icons.star_half,
          size: size ?? 14,
          color: color,
        );
      } else {
        return Icon(
          Icons.star_border,
          color: color,
          size: size ?? 14,
        );
      }
    }).toList();

    return Row(
        mainAxisAlignment: isCenter ?? false
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: starIconsMap);
  }


  static Widget assetImage(String url, double width, double height) {
    return Image.asset(url, fit: BoxFit.cover, width: width, height: height);
  }

  static void hideLoader() {
    EasyLoading.dismiss();
  }

  static void showSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: title == "Success" ? Colors.green : Colors.red,
      colorText: Colors.white,
    );
  }

  static Widget widgetLoader() {
    return Center(
      child: CircularProgressIndicator(
        color: ColorConstants.whiteColor,
      ),
    );
  }

  static Widget divider({bool isVertical = false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: isVertical
          ? const VerticalDivider(thickness: 1.0, color: Colors.black12)
          : const Divider(height: 1.0, thickness: 1.0, color: Colors.black12),
    );
  }

  static void showLoader(String message) {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = ColorConstants.secondaryColor
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..maskColor = ColorConstants.secondaryColor
      ..dismissOnTap = false;

    EasyLoading.show(
      maskType: EasyLoadingMaskType.none,
      indicator: const CircularProgressIndicator(color: Colors.white),
      status: message,
    );
  }

  static Future<bool> confirmationDialogue(
      BuildContext context, String title, String content) async {
    return await showDialog<bool>(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Text(content),
              actions: [
                TextButton(
                  onPressed: () => Get.back(result: false),
                  child: Text('No',
                      style: TextStyle(color: ColorConstants.primaryColor)),
                ),
                TextButton(
                  onPressed: () => Get.back(result: true),
                  child: Text('Yes',
                      style: TextStyle(color: ColorConstants.primaryColor)),
                ),
              ],
            );
          },
        ) ??
        false;
  }

  static textTapped(
      {required String? title, required String? subTitle, required var onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: title ?? "",
                style: const TextStyle(
                  fontFamily: "RobotoRegular",
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: Colors.black, // Change the color as needed
                ),
              ),
              TextSpan(
                text: " - ${subTitle ?? ""}",
                style: const TextStyle(
                  fontFamily: "RobotoRegular",
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: Colors.black87, // Change the color as needed
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
