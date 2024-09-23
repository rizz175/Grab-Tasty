import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:grabtasty/core/widgets/entry_field.dart';

import '../../../controller/location_controller.dart';
import '../../../core/constants/api_endpoints.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/widgets.dart';

class AddNewAddressView extends StatefulWidget {
  const AddNewAddressView({super.key});

  @override
  State<AddNewAddressView> createState() => _AddNewAddressViewState();
}

class _AddNewAddressViewState extends State<AddNewAddressView> {
  String? address;
  Timer? _debounce;

  Map selectedPlace = {};
  String? lat;
  String? long;
  LocationController locationController=Get.find();
  @override
  Widget build(BuildContext context) {


    return GetBuilder(init: locationController,
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,     bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(15.0),
          child: CustomButton(

            label: "Save address",
            onTap: () {
locationController.addAddress();Get.back();
            },
          ),
        ),
          appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              title: const Text("Addresses")),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                EntryField(
                  label: "Select Address Title",
                  hint: "e.g Home",
                  prefixIcon: Icons.text_fields_outlined,
                  color: ColorConstants.primaryColor.withOpacity(0.05),
                ),  EntryField(readOnly: true,
                  label: "Address",
                  hint: "e.g road,city",controller: locationController.selectedAddress,
                  prefixIcon: Icons.location_on_outlined,
                  color: ColorConstants.primaryColor.withOpacity(0.05),
                ),
                Widgets.heightSpaceH2,
                CustomBorderButton(
                    icon: Icon(
                      Icons.gps_fixed,
                      size: 18,
                    ),
                    label: "Current Location",
                    onTap: () {locationController.fetchCurrentAddress();}),
                Widgets.heightSpaceH2,
                EntryField(
                  prefixIcon: Icons.search,
                  label: "Search Address",   color: ColorConstants.primaryColor.withOpacity(0.05),
                  hint: "type to search",
                  onChange: (val) {
                    if (_debounce?.isActive ?? false)
                      _debounce?.cancel();
                    _debounce =
                        Timer(const Duration(seconds: 1), () {
                          search(val);
                        });
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: locationController.places
                      .map((e) => InkWell(
                    onTap: () => locationController.searchPlace(e['place_id']),
                    child: Column(
                      children: [
                        Widgets.heightSpaceH1,
                        Row(children: [
                          Icon(Icons.location_on_outlined),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(e['description'],
                                textAlign: TextAlign.left),
                          ),
                        ]),
                        Widgets.heightSpaceH1,
                        Divider()
                      ],
                    ),
                  ))
                      .toList(),
                ),


              ],
            ),
          ),
        );
      }
    );
  }
  void search(String? input) async {
    LocationController locationController=Get.find();

    if (input == "") {
      setState(() {
        locationController.places = [];
      });
      return;
    }
    Dio dioService = Dio();

    final response = await dioService.get(
      "${Endpoints.fetchPlacesFromGoogle}?input=$input&key=${Endpoints.googleKey}",
    );
    if (response.statusCode == 200) {
      setState(() {
        locationController.places = response.data['predictions'];
      });
    }
  }


}
