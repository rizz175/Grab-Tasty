import 'dart:convert';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/constants/api_endpoints.dart';
import '../core/services/http_service.dart';
import '../core/widgets/widgets.dart';
import '../model/user_model.dart';


class UserController extends GetxController {
  UserModel? userModel;
  String? token;
  String? password;
  bool isLoggedIn = false;
  TextEditingController passwordController=TextEditingController();

  Future<void> saveUser(UserModel userModel, String token) async {
    try {
      final SharedPreferences sharedUser =
          await SharedPreferences.getInstance();
      final userString = jsonEncode(userModel);
      sharedUser.setString('user', userString);
      sharedUser.setString('token', token);
      sharedUser.setBool('login', true);
    } catch (e) {
      print('Error saving user: $e');
    }
  }

  Future<void> eraseUser() async {
    try {
      final SharedPreferences sharedUser =
          await SharedPreferences.getInstance();
      sharedUser.remove('user');
      sharedUser.remove('token');

      sharedUser.clear();
      update();
    } catch (e) {
      print('Error erasing user: $e');
    }
  }

  Future<void> fetchUser() async {
    try {
      final SharedPreferences sharedUser =
          await SharedPreferences.getInstance();
      userModel = UserModel.fromJson(jsonDecode(sharedUser.getString('user')!));
      token = sharedUser.getString('token');

      update();
    } catch (e) {
      print('Error fetching user: $e');
    }
  }



  fetchUserDetails() async {
    try {
      var response = await ApiService.getData(Endpoints.fetchProfile);

      if (response.status == true) {
        UserModel userModel = UserModel.fromJson(response.data['user']);

        saveUser(userModel, token ?? "");
        fetchUser();

        update();
      } else {}
    } catch (e) {
    } finally {}
  }

  void logout() {
    eraseUser();
     // Get.offAll(const LoginView());
  }
  void requestDeletionAccount() async {
    try {



      Widgets.showLoader("Loading.. ");



      var response = await ApiService.getData(
          Endpoints.deleteAccount);
      Get.back();
      Widgets.hideLoader();

      if (response.status == true) {
        Widgets.showSnackBar("Success", "Account Deleted");
       logout();
      } else {
      }
    } catch (e) {
      Widgets.hideLoader();
    }
  }


  void updateFcmToken() async {
    try {

      String? token=await getToken();
      var response = await ApiService.postData(Endpoints.updateToken,{"fcm_token":token});

    } catch (e) {

    }
  }

  Future<String?> getToken() async {
    final FirebaseMessaging Fcm = FirebaseMessaging.instance;

    String? token = await Fcm.getToken();
    log("Firebase Messaging Token: $token");
    return token;
  }
}
