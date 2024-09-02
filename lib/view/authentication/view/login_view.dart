import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:grabtasty/core/constants/color_constants.dart';
import 'package:grabtasty/core/widgets/widgets.dart';
import 'package:grabtasty/view/authentication/view/otp_verification_view.dart';

import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/text_widgets.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with TickerProviderStateMixin {
  String? selectedCountryCode = "+91";
  String? phoneNo;

  List<String> countryCodeList = ['+91', '+23'];

  // Animation Controllers
  late AnimationController _titleController;
  late AnimationController _descriptionController;
  late AnimationController _phoneController;
  late AnimationController _buttonController;

  @override
  void initState() {
    super.initState();

    // Initialize Animation Controllers
    _titleController = AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _descriptionController = AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    _phoneController = AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _buttonController = AnimationController(vsync: this, duration: Duration(milliseconds: 900));

    // Start the animations in sequence
    _startAnimations();
  }

  void _startAnimations() async {
    _titleController.forward();
    await Future.delayed(Duration(milliseconds: 300));
    _descriptionController.forward();
    await Future.delayed(Duration(milliseconds: 300));
    _phoneController.forward();
    await Future.delayed(Duration(milliseconds: 300));
    _buttonController.forward();
  }

  @override
  void dispose() {
    // Dispose Animation Controllers
    _titleController.dispose();
    _descriptionController.dispose();
    _phoneController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var countryDropDown = Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          right: BorderSide(width: 0.5, color: Colors.white),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          bottomLeft: Radius.circular(30.0),
        ),
      ),
      height: 45.0,
      margin: const EdgeInsets.all(5),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton(
            value: selectedCountryCode,
            items: countryCodeList.map((String value) {
              return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 15.0),
                  ));
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedCountryCode = value;
              });
            },
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.clear,
            color: Colors.black54,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            FadeTransition(
              opacity: _titleController,
              child: Texts.textBlock("What's your mobile number?", size: 32, maxline: 2),
            ),
            Widgets.heightSpaceH1,
            FadeTransition(
              opacity: _descriptionController,
              child: Texts.textMedium(
                  "Let's quickly verify your number to secure your account and get started?",
                  size: 16,
                  color: Colors.black54),
            ),
            Widgets.heightSpaceH3,
            FadeTransition(
              opacity: _phoneController,
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      phoneNo = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(12.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                        color: Colors.black26,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: ColorConstants.primaryColor,
                        width: 1,
                      ),
                    ),
                    fillColor: Colors.white,
                    suffixIcon: const Icon(
                      CupertinoIcons.phone,
                      size: 20,
                      color: Colors.black38,
                    ),
                    prefixIcon: countryDropDown,
                    hintText: '  Mobile Number',
                    hintStyle: const TextStyle(
                        color: Colors.black38,
                        fontFamily: "Roboto",
                        fontSize: 15),
                  ),
                ),
              ),
            ),
            const Spacer(),
            FadeTransition(
              opacity: _buttonController,
              child: CustomButton(
                label: "Continue",
                onTap: phoneNo?.length != 10 ? null : () {
                  Get.to(() => const OtpVerificationView());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
