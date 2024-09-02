import 'package:flutter/material.dart';

class Texts {
  static textBold(String label,
      {double? size, Color? color, FontWeight? fontWeight}) {
    return Text(
      label,
      style: TextStyle(
          fontSize: size ?? 18.0,
          fontFamily: "Roboto",
          fontWeight: fontWeight ?? FontWeight.bold,
          color: color ?? Colors.black,
          letterSpacing: .3),
    );
  }

  static textNormal(String label,
      {double? size, Color? color, String? fontFamily}) {
    return Text(
      label,
      style: TextStyle(
        fontSize: size ?? 18.0,
        fontFamily: "RobotoRegular",
        color: color ?? Colors.black,
      ),textAlign:TextAlign.center,
    );
  }

  static textMedium(String label,
      {double? size, Color? color, String? fontFamily}) {
    return Text(
      label,
      style: TextStyle(
        fontSize: size ?? 18.0,
        fontFamily: "RobotoRegular",
        color: color ?? Colors.black,
      ),
    );
  }

  static TextUrbanistCenter(String label,
      {double? size,
      Color? color,
      FontWeight? fontWeight,
      String? fontFamily}) {
    return Text(
      label,
      style: TextStyle(
        fontSize: size ?? 18.0,
        fontFamily: fontFamily ?? "Roboto",
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color ?? Colors.black,
      ),
      textAlign: TextAlign.center,
    );
  }

  static textBlock(String label,
      {double? size,
      Color? color,
      FontWeight? fontWeight,
      String? fontFamily,
      var overflow,
      int? maxline,
      var align}) {
    return Text(
      label,
      style: TextStyle(
          fontSize: size ?? 18.0,
          fontFamily: fontFamily ?? "Roboto",
          fontWeight: fontWeight ?? FontWeight.bold,
          color: color ?? Colors.black),
      overflow: overflow ?? TextOverflow.ellipsis,
      textAlign: align ?? TextAlign.start,
      maxLines: maxline ?? 1,
    );
  }

  static textUnderlineBlock(String label,
      {double? size,
      Color? color,
      FontWeight? fontWeight,
      String? fontFamily,
      var overflow,
      int? maxline,
      bool? underline}) {
    return Text(
      label,
      style: TextStyle(
          decoration: TextDecoration.underline,
          fontSize: size ?? 18.0,
          fontFamily: fontFamily ?? "Roboto",
          fontWeight: fontWeight ?? FontWeight.bold,
          color: color ?? Colors.black),
      overflow: overflow ?? TextOverflow.ellipsis,
      maxLines: maxline ?? 1,
    );
  }
}
