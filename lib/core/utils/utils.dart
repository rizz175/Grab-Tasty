import 'dart:math';
import 'dart:typed_data';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

import '../constants/color_constants.dart';


class Utils
{



  static getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }
  // Function to calculate zoom level based on radius (adjust as needed)
  static double? calculateZoomLevel(double radiusInMeters) {
    // Adjust this function based on your application's specific requirements
    double? zoomLevel = (14 - log(radiusInMeters / 1000)); // Divide by 1000 for km to meters conversion
    return zoomLevel?.clamp(1.0, 11.0); // Clamp zoom level between 11 and 20
  }

 static  TimeOfDay stringToTimeOfDay(String timeString) {
    // Split the string by ':' to get hours and minutes
    List<String> parts = timeString.split(':');
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);

    // Create a TimeOfDay object
    return TimeOfDay(hour: hours, minute: minutes);
  }
  static bool isTimeFromAfterTo(TimeOfDay fromTime, TimeOfDay toTime) {
    // Compare hours and minutes directly
    if (fromTime.hour > toTime.hour) {
      return true;
    } else if (fromTime.hour == toTime.hour && fromTime.minute > toTime.minute) {
      return true;
    }
    return false;
  }


}