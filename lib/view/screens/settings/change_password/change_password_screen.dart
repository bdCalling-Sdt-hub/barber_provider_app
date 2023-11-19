import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/button/custom_button.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/custom_textfield/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(
          appBarContent: CustomBack(text: "Change Password".tr),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: "Current Password".tr, bottom: 12),
              CustomTextField(hintText: "Enter password".tr, isPassword: true),
              CustomText(text: "New Password".tr, top: 16, bottom: 12),
              CustomTextField(hintText: "New Password".tr, isPassword: true),
              CustomText(text: "Confirm Password".tr, top: 16, bottom: 12),
              CustomTextField(
                  hintText: "Confirm Password".tr, isPassword: true),
            ],
          ),
        ),
        bottomNavigationBar: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: CustomButton(
            titleText: "Update Password".tr,
            onPressed: () {
              Get.back();
            },
          ),
        ),
      ),
    );
  }
}
