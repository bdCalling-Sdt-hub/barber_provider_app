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
      "user_type": "",
    };

    var response =
        await ApiClient.postMultipartData(ApiConstant.register, body);
  }
}
