import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// TODO: add flutter_svg to pubspec.yaml
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:grabtasty/core/constants/color_constants.dart';
import 'package:grabtasty/core/widgets/custom_button.dart';
import 'package:grabtasty/view/proile/view/add_new_address_view.dart';
import 'package:grabtasty/view/proile/view/profile_view.dart';

import '../../../controller/location_controller.dart';
import '../../../core/constants/assets_constants.dart';
import '../../../core/widgets/widgets.dart';
import 'edit_account_view.dart';

class AddressesView extends StatelessWidget {
  const AddressesView({super.key});
  @override
  Widget build(BuildContext context) {
    LocationController locationController=Get.find();

    return GetBuilder(init: locationController,
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: const Text("Addresses"),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(15.0),
            child: CustomButton(
              icon: Icon(
                Icons.add_location_alt_outlined,
                color: Colors.white,
                size: 18,
              ),
              label: "Add new address",
              onTap: () {
                Get.to(() => AddNewAddressView());
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key: Key("1"),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {

                      // locationController.addresssList.removeAt(index);

                  },
                  background: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),border: Border.all(color: ColorConstants.primaryColor,width: 2)
                    ),
                    child: Row(
                      children: [
                        const Spacer(),
                        SvgPicture.string(trashIcon),
                      ],
                    ),
                  ),
                  child:  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),border: Border.all(color: ColorConstants.primaryColor,width: 1)
                    ),
                    child: ListTile(
                      title:Text("Home"),
                      subtitle:Text("Gulberg no 2 peshwar"),leading: SvgPicture.string(
                      Assets.homeIcon,
                      colorFilter: ColorFilter.mode(
                        ColorConstants.primaryColor,
                        BlendMode.srcIn,
                      ),

                    ),trailing: Icon(Icons.arrow_forward_ios,color: Colors.black45,size: 18,),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
const trashIcon =
'''<svg width="18" height="20" viewBox="0 0 18 20" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M10.7812 15.6604V7.16981C10.7812 6.8566 11.0334 6.60377 11.3438 6.60377C11.655 6.60377 11.9062 6.8566 11.9062 7.16981V15.6604C11.9062 15.9736 11.655 16.2264 11.3438 16.2264C11.0334 16.2264 10.7812 15.9736 10.7812 15.6604ZM6.09375 15.6604V7.16981C6.09375 6.8566 6.34594 6.60377 6.65625 6.60377C6.9675 6.60377 7.21875 6.8566 7.21875 7.16981V15.6604C7.21875 15.9736 6.9675 16.2264 6.65625 16.2264C6.34594 16.2264 6.09375 15.9736 6.09375 15.6604ZM15 16.6038C15 17.8519 13.9903 18.8679 12.75 18.8679H5.25C4.00969 18.8679 3 17.8519 3 16.6038V3.96226H15V16.6038ZM7.21875 1.50943C7.21875 1.30094 7.38656 1.13208 7.59375 1.13208H10.4062C10.6134 1.13208 10.7812 1.30094 10.7812 1.50943V2.83019H7.21875V1.50943ZM17.4375 2.83019H11.9062V1.50943C11.9062 0.677359 11.2331 0 10.4062 0H7.59375C6.76688 0 6.09375 0.677359 6.09375 1.50943V2.83019H0.5625C0.252187 2.83019 0 3.08302 0 3.39623C0 3.70943 0.252187 3.96226 0.5625 3.96226H1.875V16.6038C1.875 18.4764 3.38906 20 5.25 20H12.75C14.6109 20 16.125 18.4764 16.125 16.6038V3.96226H17.4375C17.7488 3.96226 18 3.70943 18 3.39623C18 3.08302 17.7488 2.83019 17.4375 2.83019Z" fill="#FF4848"/>
</svg>
''';