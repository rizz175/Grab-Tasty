import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// TODO: add flutter_svg to pubspec.yaml
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:grabtasty/core/constants/color_constants.dart';
import 'package:grabtasty/view/proile/view/locations_view.dart';

import '../../../core/constants/assets_constants.dart';
import '../../../core/widgets/widgets.dart';
import 'edit_account_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
           Widgets.heightSpaceH2,
            ProfileMenu(
              text: "My Account",
              icon: CupertinoIcons.person,
              press: () => {Get.to(()=> EditProfileScreen())},
            ),
            ProfileMenu(
              text: "Orders",
              icon: CupertinoIcons.doc_text,
              press: () {},
            ),

            ProfileMenu(
              text: "Addresses",
              icon: Icons.location_on_sharp,
              press: () => {Get.to(()=> AddressesView())},
            ),  ProfileMenu(
              text: "Privacy Policy",
              icon: CupertinoIcons.doc_plaintext,
              press: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: Icons.logout,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          const CircleAvatar(
            backgroundImage:
            NetworkImage("https://i.postimg.cc/0jqKB6mS/Profile-Image.png"),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Colors.white),
                  ),
                  backgroundColor: const Color(0xFFF5F6F9),
                ),
                onPressed: () {},
                child: SvgPicture.string(Assets.cameraIcon),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text;
  final IconData  icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor:  ColorConstants.primaryColor,
          padding: const EdgeInsets.all(20),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: const Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  color: Color(0xFF757575),
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF757575),size: 18,
            ),
          ],
        ),
      ),
    );
  }
}


