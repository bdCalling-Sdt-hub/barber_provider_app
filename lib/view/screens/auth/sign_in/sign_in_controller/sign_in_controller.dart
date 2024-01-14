import 'dart:convert';

import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/helper/prefs_helper.dart';
import 'package:barbar_provider/service/api_ckeck.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/service/app_service.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInController extends GetxController {
  bool signInLoading = false;
  TextEditingController emailController =
      TextEditingController(text: kDebugMode ? "mdh95831@gmail.com" : "");
  TextEditingController passWordController =
      TextEditingController(text: kDebugMode ? "1234567rr" : "");

  var headers = {'Content-Type': 'application/json'};

  signInUser() async {
    signInLoading = true;
    update();
    Map<String, String> body = {
      'email': emailController.text,
      'password': passWordController.text,
    };

    var response = await ApiClient.postData(ApiConstant.login, jsonEncode(body),
        headers: headers);

    if (response.statusCode == 200) {
      PrefsHelper.setString(
          AppConstants.bearerToken, response.body["access_token"]);
      Get.offNamed(
        AppRoute.navBar,
      );
    } else {
      ApiChecker.checkApi(response);
    }
    signInLoading = false;
    update();
  }

  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    debugPrint(
        "credential========================$credential============================");

    // Once signed in, return the UserCredential
  }
}
