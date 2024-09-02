import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/color_constants.dart';



class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String? label;
  final Widget? icon;
  final double? iconGap;
  final Function? onTap;
  final Color? color;
  final Color? textColor;
  final double? padding;
  final double? radius;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    this.label,
    this.icon,
    this.iconGap,
    this.onTap,
    this.color,
    this.textColor,
    this.padding,
    this.radius,
    this.height,
    this.width,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 10),
          color: onTap==null?Colors.grey:color ?? ColorConstants.primaryColor,
        ),
        padding: EdgeInsets.all(padding ?? (icon != null ? 15.0 : 15.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox.shrink(),
            icon != null
                ? SizedBox(width: iconGap ?? 20)
                : const SizedBox.shrink(),
            Flexible(
              child: Text(
                label ?? "Continue".tr,
                textAlign: TextAlign.center,
                style: textStyle ??
                    theme.textTheme.titleMedium!.copyWith(
                        color: textColor ?? theme.scaffoldBackgroundColor,fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class CustomBorderButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String? label;
  final Widget? icon;
  final double? iconGap;
  final Function? onTap;
  final Color? color;
  final Color? textColor;
  final double? padding;
  final double? radius;
  final TextStyle? textStyle;

  const CustomBorderButton({
    super.key,
    this.label,
    this.icon,
    this.iconGap,
    this.onTap,
    this.color,
    this.textColor,
    this.padding,
    this.radius,
    this.height,
    this.width,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 10),
          color: color ?? Colors.white,border: Border.all(color: color??Colors.black26,width: 1)
        ),
        padding: EdgeInsets.all(padding ?? (icon != null ? 15.0 : 15.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox.shrink(),
            icon != null
                ? SizedBox(width: iconGap ?? 10)
                : const SizedBox.shrink(),
            Flexible(
              child: Text(
                label ?? "Continue".tr,
                textAlign: TextAlign.center,
                style: textStyle ??
                    theme.textTheme.titleMedium!.copyWith(
                        color: textColor ?? Colors.black,fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
