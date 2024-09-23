import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:grabtasty/core/widgets/widgets.dart';

import '../core/constants/api_endpoints.dart';

class LocationController extends GetxController {
  var currentAddress = ''.obs;
  var isLoading = false.obs;
  String? address;
  Timer? _debounce;
  List places = [];
  List addresssList = [];
  Map selectedPlace = {};
  String? lat;
  String? long;
  TextEditingController selectedAddress = TextEditingController();


  Future<void> fetchCurrentAddress() async {
    try {
      Widgets.showLoader("loading");

      // Check location services
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        currentAddress.value = 'Location services are disabled.';
        return;
      }

      // Check and request location permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
          currentAddress.value = 'Location permissions are denied';
          return;
        }
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      // Get address from coordinates
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        currentAddress.value = '${place.street ?? ''}, ${place.locality ?? ''}, ${place.postalCode ?? ''}, ${place.country ?? ''}';
    selectedAddress.text=currentAddress.value;

     update();
      } else {
        currentAddress.value = 'No address available';
      }
    } catch (e) {
      currentAddress.value = 'Error: $e';
    } finally {
      Widgets.hideLoader();
    }
  }
  void searchPlace(String? placeId) async {
    Dio dioService = Dio();

    final response = await dioService.get(
      "${Endpoints.fetchPlaceFromGoogle}?place_id=$placeId&key=${Endpoints.googleKey}",
    );
    if (response.statusCode == 200) {

        selectedPlace = response.data['result'];
        lat = selectedPlace['geometry']['location']['lat'].toString();
        long = selectedPlace['geometry']['location']['lng'].toString();
        places = [];
        selectedAddress.text = selectedPlace['formatted_address'];
     update();
    }
  }
  void addAddress(){

    addresssList.add(selectedAddress.text);
update();
  }
  void removeAddress(int index){

    addresssList.removeAt(index);
    update();
  }
}
