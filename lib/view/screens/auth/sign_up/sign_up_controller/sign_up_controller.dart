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

  var signUpLoading = false.obs;

  signUpUser() async {
    signUpLoading(true);
    Map<String, String> body = {
      'name': nameController.text,
      'email': emailController.text,
      'password': passWordController.text,
      'password_confirmation': confirmPasController.text,
      "latitude": "3214",
      "longitude": "1234",
      "user_type": "provider",
    };
   var headers = {
          'Accept': 'application/json'
        };
    var response = await ApiClient.postData(
      ApiConstant.register,
      body,headers: headers
    );
    if (response.statusCode == 200) {
      Get.toNamed(
        AppRoute.otpScreen,
      );
    } else {
      ApiChecker.checkApi(response);
    }
    signUpLoading(false);
  }
}
