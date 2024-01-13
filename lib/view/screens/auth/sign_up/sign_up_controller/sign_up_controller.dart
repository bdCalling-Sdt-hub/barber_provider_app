import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/service/api_ckeck.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/service/app_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  TextEditingController confirmPasController = TextEditingController();

  bool signUpLoading = false;

  String otp = "";
  var headers = {'Accept': 'application/json'};

  signUpUser() async {
    signUpLoading = true;
    update();
    Map<String, String> body = {
      'name': nameController.text,
      'email': emailController.text,
      'password': passWordController.text,
      'password_confirmation': confirmPasController.text,
      "latitude": "3214",
      "longitude": "1234",
      "user_type": "provider",
    };

    var response =
        await ApiClient.postData(ApiConstant.register, body, headers: headers);
    if (response.statusCode == 200) {
      Get.toNamed(
        AppRoute.otpScreen,
      );
    } else {
      ApiChecker.checkApi(response);
    }
    signUpLoading = false;
    update();
  }

  resendOTP() async {
    var body = {
      "email": emailController.text,
    };
    var response = await ApiClient.postData(
      ApiConstant.resendOtp,
      body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      Get.offNamed(
        AppRoute.navBar,
      );
    } else {
      ApiChecker.checkApi(response);
    }
  }

  varifyOTP() async {
    var body = {"email": emailController.text, "otp": otp};
    var response = await ApiClient.postData(
      ApiConstant.verified,
      body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      Get.offNamed(
        AppRoute.navBar,
      );
    } else {
      ApiChecker.checkApi(response);
    }
  }
}
