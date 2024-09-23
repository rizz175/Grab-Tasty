import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grabtasty/controller/location_controller.dart';
import 'package:grabtasty/core/constants/assets_constants.dart';
import 'package:grabtasty/core/constants/color_constants.dart';
import 'package:grabtasty/view/cart/view/cart_view.dart';
import 'package:grabtasty/view/home/view/home_view.dart';
import 'package:grabtasty/view/proile/view/profile_view.dart';

const Color inActiveIconColor = Color(0xFFB6B6B6);

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentSelectedIndex = 0;

  void updateCurrentIndex(int index) {
    setState(() {
      currentSelectedIndex = index;
    });
  }

  final pages = [
    const HomeScreen(),
    const Center(
      child: Text("Fav"),
    ),
    const Center(
      child: CartScreen(),
    ),
   ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    LocationController locationController=Get.put(LocationController());
    return Scaffold(
      body: pages[currentSelectedIndex],
      bottomNavigationBar: BottomNavigationBar(backgroundColor: Colors.white,
        onTap: updateCurrentIndex,
        currentIndex: currentSelectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.string(
              Assets.homeIcon,
              colorFilter: const ColorFilter.mode(
                inActiveIconColor,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.string(
              Assets.homeIcon,
              colorFilter: ColorFilter.mode(
                ColorConstants.primaryColor,
                BlendMode.srcIn,
              ),

            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.string(
              Assets.heartIcon,
              colorFilter: const ColorFilter.mode(
                inActiveIconColor,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.string(
              Assets.heartIcon,
              colorFilter: ColorFilter.mode(
                ColorConstants.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Fav",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.string(
              Assets.chatIcon,
              colorFilter: const ColorFilter.mode(
                inActiveIconColor,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.string(
              Assets.chatIcon,
              colorFilter: ColorFilter.mode(
                ColorConstants.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.string(
              Assets.userIcon,
              colorFilter: const ColorFilter.mode(
                inActiveIconColor,
                BlendMode.srcIn,
              ),           ),
            activeIcon: SvgPicture.string(
              Assets.userIcon,
              colorFilter: ColorFilter.mode(
                ColorConstants.primaryColor,
                BlendMode.srcIn,
              ),            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}


