import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_icons.dart';
import 'package:barbar_provider/view/widgets/button/custom_button.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/custom_textfield/custom_textfield.dart';
import 'package:barbar_provider/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 50),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding:
                const EdgeInsetsDirectional.only(start: 20, top: 24, end: 20),
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
              color: AppColors.bgColor,
            ),
            child: CustomText(
              text: "Sign In".tr,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      text: "Email".tr,
                      textAlign: TextAlign.start,
                      bottom: 12,
                      top: 24),
                  CustomTextField(
                    hintText: "Enter email".tr,
                    fillColor: AppColors.stroke,
                  ),
                  CustomText(
                      text: "Password".tr,
                      textAlign: TextAlign.start,
                      top: 16,
                      bottom: 12),
                  CustomTextField(
                    hintText: "Enter password".tr,
                    isPassword: true,
                    fillColor: AppColors.stroke,
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, AppRoute.forgetPassScreen),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: CustomText(
                        text: "Forgot Password?".tr,
                        color: AppColors.primaryOrange,
                      ),
                    ),
                  ),
                  const SizedBox(height: 44),
                  CustomButton(
                      onPressed: () {
                        //Get.offNamed(AppRoute.navigationBar);
                      },
                      titleText: "Sign In".tr),
                  Align(
                    alignment: Alignment.center,
                    child: CustomText(top: 24, bottom: 16, text: "Or Sign in with".tr),
                  ),
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
                    child: GestureDetector(
                      //onTap: ()=>Navigator.pushNamed(context, AppRoute.signUpScreen),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(text: "Don’t have an account?  ".tr),
                          CustomText(
                              text: "Sign Up".tr,
                              color: AppColors.primaryOrange),
                        ],
                      ),
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
