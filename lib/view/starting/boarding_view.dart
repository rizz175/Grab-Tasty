import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:grabtasty/core/constants/assets_constants.dart';
import 'package:grabtasty/core/widgets/custom_button.dart';
import 'package:grabtasty/core/widgets/widgets.dart';
import 'package:grabtasty/view/authentication/view/login_view.dart';

import '../../core/constants/color_constants.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> with TickerProviderStateMixin {
  int currentPage = 0;

  // Animation Controllers
  late AnimationController _contentController;
  late AnimationController _googleButtonController;
  late AnimationController _mobileButtonController;
  late AnimationController _footerTextController;

  @override
  void initState() {
    super.initState();

    // Initialize Animation Controllers
    _contentController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _googleButtonController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _mobileButtonController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _footerTextController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    // Start the animations in sequence
    _startAnimations();
  }

  void _startAnimations() async {
    _contentController.forward();
    await Future.delayed(Duration(milliseconds: 300));
    _googleButtonController.forward();
    await Future.delayed(Duration(milliseconds: 600));
    _mobileButtonController.forward();
    await Future.delayed(Duration(milliseconds: 700));
    _footerTextController.forward();
  }

  @override
  void dispose() {
    // Dispose Animation Controllers
    _contentController.dispose();
    _googleButtonController.dispose();
    _mobileButtonController.dispose();
    _footerTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Expanded(
                flex: 14,
                child: PageView.builder(
                  itemCount: demoData.length,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemBuilder: (context, index) => OnboardContent(
                    illustration: demoData[index]["illustration"],
                    title: demoData[index]["title"],
                    text: demoData[index]["text"],
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  demoData.length,
                      (index) => DotIndicator(isActive: index == currentPage),
                ),
              ),
              const Spacer(flex: 2),
              FadeTransition(
                opacity: _googleButtonController,
                child: CustomBorderButton(
                  label: "Continue with Google",
                  icon: Image.asset(Assets.googleIcon, width: 20, height: 20),
                ),
              ),
              Widgets.heightSpaceH2,
              FadeTransition(
                opacity: _mobileButtonController,
                child: CustomButton(
                  label: "Continue with Mobile Number",
                  onTap: () {
                    Get.to(() => LoginView());
                  },
                ),
              ),
              Widgets.heightSpaceH2,
              FadeTransition(
                opacity: _footerTextController,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Text(
                      'By creating an account, you agree to abide by Grab Tasty?',
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 12,
                        color: Colors.black45,
                      ),
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        // Navigate to T&C
                      },
                      child: Text(
                        'T&C',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 13,
                          color: ColorConstants.primaryColor,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    Text(
                      ' and ',
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 12,
                        color: Colors.black45,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Navigate to Privacy Policy
                      },
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 13,
                          color: ColorConstants.primaryColor,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.illustration,
    required this.title,
    required this.text,
  });

  final String? illustration, title, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              illustration!,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title!,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          text!,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
    this.activeColor = const Color(0xFF22A45D),
    this.inActiveColor = const Color(0xFF868686),
  });

  final bool isActive;
  final Color activeColor, inActiveColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.symmetric(horizontal: 16 / 2),
      height: 5,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? activeColor : inActiveColor.withOpacity(0.25),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}

// Demo data for our Onboarding screen
List<Map<String, dynamic>> demoData = [
  {
    "illustration": "https://i.postimg.cc/L43CKddq/Illustrations.png",
    "title": "All your favorites",
    "text":
    "Order from the best local restaurants \nwith easy, on-demand delivery.",
  },
  {
    "illustration": "https://i.postimg.cc/L43CKddq/Illustrations.png",
    "title": "All your favorites",
    "text":
    "Order from the best local restaurants \nwith easy, on-demand delivery.",
  },
  {
    "illustration": "https://i.postimg.cc/L43CKddq/Illustrations.png",
    "title": "All your favorites",
    "text":
    "Order from the best local restaurants \nwith easy, on-demand delivery.",
  },
];
