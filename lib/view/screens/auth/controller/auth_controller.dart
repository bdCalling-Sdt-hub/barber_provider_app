import 'dart:convert';

import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/core/global/location_controller.dart';
import 'package:barbar_provider/helper/prefs_helper.dart';
import 'package:barbar_provider/service/api_ckeck.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/service/app_service.dart';
import 'package:barbar_provider/utils/app_constent.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authcontroller extends GetxController {
  bool loading = false;

  LocationController locationController = Get.find<LocationController>();

  String otp = "";
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController =
      TextEditingController(text: kDebugMode ? "mdh95831@gmail.com" : "");
  TextEditingController passWordController =
      TextEditingController(text: kDebugMode ? "1234567rr" : "");
  TextEditingController confirmPasController = TextEditingController();

  var headers = {'Content-Type': 'application/json'};

//================================Sign In User==============================
  signInUser() async {
    loading = true;
    update();
    Map<String, String> body = {
      'email': emailController.text,
      'password': passWordController.text,
    };

    var response = await ApiClient.postData(ApiConstant.login, jsonEncode(body),
        headers: headers);

    if (response.statusCode == 200) {
      SharePrefsHelper.setString(
          AppConstants.bearerToken, response.body["access_token"]);
      Get.offNamed(
        AppRoute.navBar,
      );
    } else {
      ApiChecker.checkApi(response);
    }
    loading = false;
    update();
  }

//================================Sign Up User==============================

  signUpUser() async {
    loading = true;
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
      Get.toNamed(AppRoute.otpScreen, arguments: false);
    } else {
      ApiChecker.checkApi(response);
    }
    loading = false;
    update();
  }

//================================Sign In With Google==============================

  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    // final GoogleSignInAuthentication? googleAuth =
    //     await googleUser?.authentication;

    // // Create a new credential
    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth?.accessToken,
    //   idToken: googleAuth?.idToken,
    // );

    debugPrint(
        "credential====================================================$googleUser");
    debugPrint(
        "googleAuth?.idToken====================================================${googleUser!.id}");

    // Once signed in, return the UserCredential
  }

//================================Resend OTP==============================

  Future<bool> resendOTP() async {
    loading = true;
    update();
    var body = {
      "email": emailController.text,
    };
    var response = await ApiClient.postData(
      ApiConstant.resendOtp,
      body,
      headers: {
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      loading = false;
      update();
      return true;
    } else {
      ApiChecker.checkApi(response);
      loading = false;
      update();
      return false;
    }
  }

//================================Varify OTP==============================

  varifyOTP({required bool forgetPass}) async {
    loading = true;
    update();
    var body = {"email": emailController.text, "otp": otp};
    var response = await ApiClient.postData(
      ApiConstant.verified,
      body,
      headers: {
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      //================================Save Token================================

      debugPrint(
          "Token============================${response.body["token"]["original"]["access_token"]}");

      SharePrefsHelper.setString(AppConstants.bearerToken,
          response.body["token"]["original"]["access_token"]);

      //=========================Set the payment false so that user cant add Provider=====================

      if (forgetPass == false) {
        SharePrefsHelper.setBool(AppConstants.paymentDone, false);
      }

      forgetPass == true
          ? Get.offAllNamed(AppRoute.resetPassword)
          : Get.offNamed(
              AppRoute.navBar,
            );
    } else {
      ApiChecker.checkApi(response);
    }
    loading = false;
    update();
  }

//================================Reset Password==============================

  resetPassword() async {
    loading = true;

    var bearerToken =
        await SharePrefsHelper.getString(AppConstants.bearerToken);
    update();

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $bearerToken'
    };

    var body = {
      "password": passWordController.text,
      "password_confirmation": confirmPasController.text
    };

    var response = await ApiClient.postData(ApiConstant.resetPassword, body,
        headers: headers);

    if (response.statusCode == 200) {
      Get.snackbar("Done", "Successfully updated");
      Get.offNamed(AppRoute.signInScreen);
    } else {
      ApiChecker.checkApi(response);
    }

    loading = false;
    update();
  }
}
