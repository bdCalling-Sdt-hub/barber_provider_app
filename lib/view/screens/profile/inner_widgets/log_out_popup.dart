import 'dart:async';

import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/helper/prefs_helper.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/view/screens/home/controller/home_controller.dart';
import 'package:barbar_provider/view/widgets/button/custom_button.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogOutPopUp extends StatelessWidget {
  const LogOutPopUp({super.key});

  // logout() async {
  //   var response = await ApiClient.getData(ApiConstant.logOut);

  //   if (response.statusCode == 200) {
  //     Get.offAllNamed(AppRoute.signInScreen);
  //   } else {
  //     ApiChecker.checkApi(response);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.only(top: 28, bottom: 54),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.cardBgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            CustomText(
                text: "Log out".tr, fontSize: 18, fontWeight: FontWeight.w600),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Divider(height: 1, color: AppColors.stroke, thickness: 1),
            ),
            CustomText(
                text: "Are you sure you want to log out?".tr,
                fontWeight: FontWeight.w500,
                maxLines: 2,
                bottom: 36),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  //====================================Log out cancel================================
                  Expanded(
                    child: CustomButton(
                      titleText: "Cancel".tr,
                      buttonColor: AppColors.stroke,
                      onPressed: () => Get.back(),
                    ),
                  ),
                  const SizedBox(width: 16),

                  //====================================Log out Confirm===============================

                  Expanded(
                    child: CustomButton(
                      titleText: "Confirm".tr,
                      onPressed: () {
                        //   logout();
                        SharePrefsHelper.setBool(
                            AppConstants.paymentDone, false);

                        SharePrefsHelper.setBool(
                            AppConstants.isProviderAdded, false);

                        SharePrefsHelper.remove(AppConstants.bearerToken);

                        GoogleSignIn().signOut();

                        if (Get.isRegistered<HomeController>()) {
                          HomeController homeController =
                              Get.find<HomeController>();
                          homeController.dispose();
                        }

                        // if (Get.isRegistered<ProfileController>()) {
                        //   ProfileController profileController =
                        //       Get.find<ProfileController>();
                        //   profileController.dispose();
                        // }

                        Future.delayed(const Duration(seconds: 1), () {
                          Get.offAllNamed(AppRoute.signInScreen);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
