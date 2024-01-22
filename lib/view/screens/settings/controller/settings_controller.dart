import 'package:barbar_provider/service/api_ckeck.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/service/app_service.dart';
import 'package:barbar_provider/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController with GetxServiceMixin {
  TextEditingController currentPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  bool loading = false;

  //=======================Change Password==========================

  changePass() async {
    loading = true;
    update();

    var body = {
      "current_password": currentPassController.text,
      "password": newPassController.text,
      "password_confirmation": confirmPassController.text,
    };

    var response = await ApiClient.postData(ApiConstant.changePassword, body);

    if (response.statusCode == 200) {
      toastMessage(message: response.body["message"]);
      navigator!.pop();
    } else {
      ApiChecker.checkApi(response);
    }

    loading = false;
    update();
  }
}
