import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grabtasty/core/constants/color_constants.dart';
import 'package:grabtasty/core/widgets/custom_button.dart';
import 'package:grabtasty/core/widgets/entry_field.dart';
import 'package:grabtasty/view/proile/view/profile_view.dart';

import '../../../core/widgets/widgets.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const ProfilePic(),
            Widgets.heightSpaceH4,
            Form(
              child: Column(
                children: [
                  EntryField(
                      label: "Name",
                      color: ColorConstants.primaryColor.withOpacity(0.05),
                      hint: "Sandeep",
                      prefixIcon: CupertinoIcons.person),
                  EntryField(
                      label: "Email",
                      color: ColorConstants.primaryColor.withOpacity(0.05),
                      hint: "Sandeep@gmail.com",
                      prefixIcon: Icons.mail_outline_outlined),
                  EntryField(
                      label: "Mobile Number",
                      color: ColorConstants.primaryColor.withOpacity(0.05),
                      hint: "+9232323",
                      prefixIcon: Icons.phone),
                  EntryBigField(
                    label: "Address",
                    color: ColorConstants.primaryColor.withOpacity(0.05),
                    hint: "+9232323",
                    prefixIcon: Icons.pin_drop_outlined,
                  ),
                ],
              ),
            ),
            Widgets.heightSpaceH5,
            CustomButton(label: "Update", onTap: () {})
          ],
        ),
      ),
    );
  }
}

