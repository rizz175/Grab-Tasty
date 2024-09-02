import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:grabtasty/view/starting/boarding_view.dart';

import '../../controller/user_controller.dart';
import '../../core/constants/assets_constants.dart';
import '../../core/constants/color_constants.dart';



class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late UserController userController;

  @override
  void initState() {
    super.initState();
    userController = Get.put(UserController());
    userController.fetchUser();

  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
            builder: EasyLoading.init(),
            debugShowCheckedModeBanner: false,
            title: 'Grab Tasty',
            // You can use the library anywhere in the app even in theme
            theme: ThemeData(scaffoldBackgroundColor: Colors.white,
              fontFamily: 'Roboto',
              primaryColor: ColorConstants.primaryColor,
            ),
            home: GetBuilder(init: userController,
                builder: (_) {
                  return Scaffold(
                      backgroundColor: ColorConstants.primaryColor,
                      body: AnimatedSplashScreen(
                          duration: 4000,
                          centered: true,
                          splashIconSize: 500,
                          splash: Icon(Icons.food_bank_outlined,size: 100,color: Colors.white,),
                          nextScreen: userController.token != null
                              ?  Container()
                              : const OnboardingScreen(),
                          splashTransition: SplashTransition.scaleTransition,
                          backgroundColor: ColorConstants.primaryColor));
                }
            ));
      },
    );
  }
}
