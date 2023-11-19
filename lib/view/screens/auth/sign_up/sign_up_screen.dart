import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_icons.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/button/custom_button.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/custom_textfield/custom_textfield.dart';
import 'package:barbar_provider/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(appBarContent: CustomBack(text: "Sign Up".tr,isIcon: false)),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 24),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: "Name".tr,bottom: 12,top: 24),

                  CustomTextField(
                    hintText: "Enter full name".tr,
                    fillColor: AppColors.stroke,
                  ),

                  CustomText(text: "Email".tr,top: 16,bottom: 12),

                  CustomTextField(
                    hintText: "Enter email".tr,
                    fillColor: AppColors.stroke,
                  ),

                  CustomText(text: "Password".tr,top: 16,bottom: 12),

                  CustomTextField(
                    hintText: "Enter password".tr,
                    isPassword: true,
                    fillColor: AppColors.stroke,
                  ),

                  //Confirm password
                  CustomText(text: "Confirm Password".tr,top: 16,bottom: 12),

                  CustomTextField(
                    hintText: "Confirm Password".tr,
                    isPassword: true,
                    fillColor: AppColors.stroke,
                  ),

                  const SizedBox(height: 44),
                  CustomButton(
                      onPressed: () {
                        Get.toNamed(AppRoute.signUpContinue);
                      }, titleText: "Continue".tr),

                  Align(alignment: Alignment.center,child: CustomText(text: "Or Sign in with".tr,top: 24,bottom: 16)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 64,
                        width: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.cardBgColor,
                        ),
                        child: const Center(
                          child: CustomImage(imageSrc: AppIcons.google),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        height: 64,
                        width: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.cardBgColor,
                        ),
                        child: const Center(
                          child: CustomImage(imageSrc: AppIcons.facebook),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0, top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(text: "Already have an account?  ".tr),
                        GestureDetector(
                          onTap: ()=> Get.back(),
                          child: CustomText(
                              text: "Sign In".tr,
                              color: AppColors.primaryOrange),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}