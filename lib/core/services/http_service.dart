import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';


import '../../controller/user_controller.dart';
import '../../model/service_model.dart';
import '../constants/api_endpoints.dart';
import '../widgets/widgets.dart';

class ApiService {
  static Dio dioService = Dio();

  static Future<ServiceResponseModel> getData(String endpoint) async {
    final userController = Get.find<UserController>();

    try {
      final response = await dioService.get(
        '${Endpoints.baseURL}$endpoint',
        options: Options(headers: {
          "Authorization": "Bearer ${userController.token}" ?? "",
        }),
      );

      print("url : ${Endpoints.baseURL}$endpoint");
      log("response: ${response.data.toString()}");

      return ServiceResponseModel(
        status: response.statusCode == 200,
        message:
            response.statusCode == 200 ? "Success" : "Something went wrong",
        data: response.statusCode == 200 ? response.data : "",
      );}
      on DioException catch ( e) {
      if (e.toString().contains("401")) {
        userController.logout();
        Widgets.showSnackBar("Error", "Token is expired");
        return ServiceResponseModel(
          status: false,
          message: "Something went wrong",
          data: "",
        );
      } else {
        return ServiceResponseModel(
          status: false,
          message: e.response?.statusMessage??"",

          data: "",
        );
      }
    }
  }

  static Future<ServiceResponseModel> postData(
      String endpoint, dynamic data) async {
    final userController = Get.find<UserController>();

    try {
      final response = await dioService.post(
        '${Endpoints.baseURL}$endpoint',
        data: jsonEncode(data),
        options: Options(headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Authorization": "Bearer ${userController.token}" ?? "",
        }),
      );
      log("url : ${Endpoints.baseURL}$endpoint");
      log("payload: $data");
      log("response: ${response.data}");

      final responseData = response.data;

      if (responseData['status'] == true) {
        return ServiceResponseModel(
          status: true,
          message: responseData["message"],
          data: responseData,
        );
      } else {
        String errorMessage = responseData["errors"] != null
            ? responseData["errors"].toString()
            : responseData["message"];
        return ServiceResponseModel(
          status: false,
          message: errorMessage,
          data: "",
        );
      }
    } on DioException catch ( e) {
      if (e.toString().contains("401")) {
        userController.logout();
        Widgets.showSnackBar("Error", "Token is expired");
        return ServiceResponseModel(
          status: false,
          message: "Something went wrong",
          data: "",
        );
      } else {
        return ServiceResponseModel(
          status: false,
          message: e.response?.statusMessage??"",
          data: "",
        );
      }
    }
  }
  static Future<ServiceResponseModel> postMainData(
      String endpoint, dynamic data) async {
    final userController = Get.find<UserController>();

    try {
      final response = await dioService.post(
        '${Endpoints.domain}/api/$endpoint',
        data: jsonEncode(data),
        options: Options(headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Authorization": "Bearer ${userController.token}" ?? "",
        }),
      );
      log("url : ${Endpoints.domain}$endpoint");
      log("payload: $data");
      log("response: ${response.data}");

      final responseData = response.data;

      if (responseData['status'] == true) {
        return ServiceResponseModel(
          status: true,
          message: responseData["message"],
          data: responseData,
        );
      } else {
        String errorMessage = responseData["errors"] != null
            ? responseData["errors"].toString()
            : responseData["message"];
        return ServiceResponseModel(
          status: false,
          message: errorMessage,
          data: "",
        );
      }
    } on DioException catch ( e) {
      if (e.toString().contains("401")) {
        userController.logout();
        Widgets.showSnackBar("Error", "Token is expired");
        return ServiceResponseModel(
          status: false,
          message: "Something went wrong",
          data: "",
        );
      } else {
        return ServiceResponseModel(
          status: false,
          message: e.response?.statusMessage??"",
          data: "",
        );
      }
    }
  }
  static void _handleError(int statusCode) {
    switch (statusCode) {
      case 401:
        Widgets.showSnackBar("Error", "Token is expired");
        Get.find<UserController>().logout();
        break;
      case 402:
        Widgets.showSnackBar("Error", "Subscription is expired");
        Get.find<UserController>().logout();
        break;
    }
  }
}
