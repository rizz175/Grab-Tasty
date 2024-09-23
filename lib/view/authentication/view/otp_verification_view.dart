import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grabtasty/core/constants/color_constants.dart';
import 'package:grabtasty/core/widgets/widgets.dart';
import 'package:grabtasty/view/dashboard/view/dashboard_view.dart';
import 'package:grabtasty/view/home/view/home_view.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/text_widgets.dart';

class OtpVerificationView extends StatefulWidget {
  const OtpVerificationView({super.key});

  @override
  State<OtpVerificationView> createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<OtpVerificationView> with TickerProviderStateMixin {
  TextEditingController otpController = TextEditingController();
  String? otp;

  // Animation Controllers
  late AnimationController _titleController;
  late AnimationController _descriptionController;
  late AnimationController _pinController;
  late AnimationController _resendController;
  late AnimationController _buttonController;

  @override
  void initState() {
    super.initState();

    // Initialize Animation Controllers
    _titleController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _descriptionController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _pinController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _resendController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _buttonController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    // Start the animations in sequence
    _startAnimations();
  }

  void _startAnimations() async {
    _titleController.forward();
    await Future.delayed(Duration(milliseconds: 300));
    _descriptionController.forward();
    await Future.delayed(Duration(milliseconds: 400));
    _pinController.forward();
    await Future.delayed(Duration(milliseconds: 500));
    _resendController.forward();
    await Future.delayed(Duration(milliseconds: 600));
    _buttonController.forward();
  }

  @override
  void dispose() {
    // Dispose Animation Controllers
    _titleController.dispose();
    _descriptionController.dispose();
    _pinController.dispose();
    _resendController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeTransition(
              opacity: _titleController,
              child: Texts.textBlock("OTP Verification", size: 32, maxline: 2),
            ),
            Widgets.heightSpaceH1,
            FadeTransition(
              opacity: _descriptionController,
              child: Texts.textMedium(
                  "We will send you an One Time Passcode via mobile number +91213334434",
                  size: 16,
                  color: Colors.black54),
            ),
            Widgets.heightSpaceH3,

            FadeTransition(
              opacity: _pinController,
              child: PinCodeTextField(
                controller: otpController,
                appContext: context,
                length: 6,
                autoDisposeControllers: true,
                animationType: AnimationType.fade,
                textStyle: const TextStyle(color: Colors.black),
                pinTheme: PinTheme(
                    fieldWidth: .12.sw,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    borderWidth: 1,
                    activeFillColor: ColorConstants.whiteColor,
                    inactiveFillColor: ColorConstants.backgroundColor,
                    selectedColor: ColorConstants.primaryColor,
                    activeColor: ColorConstants.primaryColor,
                    selectedFillColor: ColorConstants.whiteColor,
                    inactiveColor: ColorConstants.whiteColor),
                cursorColor: ColorConstants.primaryColor,
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: true,
                keyboardType: TextInputType.number,
                onCompleted: (v) {
                  print("Completed");
                },
                onChanged: (value) {
                  otp = value;
                  setState(() {});
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  return true;
                },
              ),
            ),
            Widgets.heightSpaceH2,
            FadeTransition(
              opacity: _resendController,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Didn’t receive the OTP?  ',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 12, color: Colors.black54)),
                  InkWell(
                    onTap: () {},
                    child: Text('Resend OTP?',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(
                            fontSize: 14,
                            color: ColorConstants.secondaryColor,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
            const Spacer(),
            FadeTransition(
              opacity: _buttonController,
              child: CustomButton(
                label: "Continue",
                onTap: otp?.length != 6 ? null : () {Get.to(BottomNavScreen());},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
