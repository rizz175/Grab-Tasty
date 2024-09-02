
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:grabtasty/core/widgets/text_widgets.dart';
import 'package:grabtasty/core/widgets/widgets.dart';

import '../../controller/user_controller.dart';
import '../constants/assets_constants.dart';
import '../constants/color_constants.dart';
import 'custom_dialog.dart';

class DrawerSection extends StatefulWidget {
  @override
  State<DrawerSection> createState() => _DrawerSectionState();
}

class _DrawerSectionState extends State<DrawerSection> {
  // Initially no item is selected
  String? selectedLanguage = "en";



  menuItemBox({required var icon, required String title, required var onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 17,
            ),
            const SizedBox(
              width: 8,
            ),
            Texts.textNormal(title, size: 13, color: Colors.black)
          ],
        ),
      ),
    );
  }
  late UserController userController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userController=Get.find();

  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(50.0)),
      child: Drawer(
        width: .70.sw,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 20,
        child:  Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Widgets.heightSpaceH4,
                        // Stack(clipBehavior: Clip.none,
                        //   alignment: AlignmentDirectional.center,
                        //   children: [
                        //     Image.asset(Assets.primaryLogo,width: 150,height: 150,),
                        //
                        //   ],
                        // ),


                        // const Divider(),
                        Widgets.heightSpaceH3,
                        menuItemBox(
                            icon: CupertinoIcons.doc_text,
                            title: "Terms & Conditions",
                            onTap: () {
                              // Get.to(() => TermsConditonView());
                            }),const Divider(),
                        menuItemBox(
                            icon: CupertinoIcons.news,
                            title: "Privacy Policy",
                            onTap: () {
                              // Get.to(() => PrivacyPolicyView());
                            }),
                        const Divider(),

                        menuItemBox(
                            icon: CupertinoIcons.info_circle,
                            title: "About App",
                            onTap: () {
                              // Get.to(() => AboutUsView());

                            }),
                        const Divider(),

                        menuItemBox(
                            icon: CupertinoIcons.delete_right,
                            title: "Delete Account",
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => CustomAlertDialog(
                                    onDone: () {

                                      userController.requestDeletionAccount();
                                    },

                                    title: "Account Deletion",
                                    subtitle:
                                    "Do you really want to delete this account?", onCancel: (){Get.back();},
                                  ));

                            }),
                        const Divider(),

                        menuItemBox(
                            icon: Icons.logout,
                            title: "Logout",
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => CustomAlertDialog(
                                    onDone: () {
                                      Get.back();
                                      userController.logout();
                                    },
                                    title: "Confirmation",
                                    subtitle: "Do you want to logout?",
                                    onCancel: () {
                                      Get.back();
                                    },
                                  ));

                            }),
                        Widgets.heightSpaceH1,

                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Texts.textBlock("Version 1.0.0",
                            size: 13, color: Colors.black),
                        Widgets.heightSpaceH1,
                        Texts.textMedium(
                            "Copyright © 2024 All rights reserved.",
                            size: 10,
                            color: Colors.black38),
                      ],
                    )
                  ],
                ))));


  }
}
