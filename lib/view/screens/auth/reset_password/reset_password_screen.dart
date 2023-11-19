import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/button/custom_button.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/custom_textfield/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: CustomAppBar(appBarContent: CustomBack(text: "Set A New Password".tr)),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 24),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: "Your password must be 8-10 characters.".tr,maxLines: 2,textAlign: TextAlign.start,overflow: TextOverflow.ellipsis,bottom: 24),

                  CustomText(text: "Password".tr,bottom: 12),

                  CustomTextField(
                    hintText: "Enter password".tr,
                    fillColor: AppColors.stroke,
                    isPassword: true,
                  ),

                  CustomText(text: "Confirm Password".tr,top: 16,bottom: 12),

                  CustomTextField(
                    hintText: "Confirm Password".tr,
                    fillColor: AppColors.stroke,
                    isPassword: true,
                  ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 24),
          physics: const ClampingScrollPhysics(),
          child: CustomButton(
              onPressed: ()
              {
                Get.offAllNamed(AppRoute.signInScreen);
              }, titleText: "Reset Password".tr),
        ),
      ),
    );
  }
}
