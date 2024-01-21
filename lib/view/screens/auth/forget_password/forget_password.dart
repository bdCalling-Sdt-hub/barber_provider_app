import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/utils/api_static_string.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_icons.dart';
import 'package:barbar_provider/view/screens/auth/controller/auth_controller.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/button/custom_button.dart';
import 'package:barbar_provider/view/widgets/custom_loader/custom_loader.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/custom_textfield/custom_textfield.dart';
import 'package:barbar_provider/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();

    // final Authcontroller signInController = Get.find<SignInController>();

    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar:
            CustomAppBar(appBarContent: CustomBack(text: "Forgot Password".tr)),
        body: GetBuilder<Authcontroller>(
          builder: (controller) {
            return SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text:
                        "Please enter your email address for recover your password."
                            .tr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    bottom: 24,
                    textAlign: TextAlign.start,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: AppColors.primaryOrange,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const CustomImage(
                        imageSrc: AppIcons.forgetPass,
                        imageType: ImageType.png,
                      ),
                    ),
                  ),

                  //-----------------------------------Email-------------------------------------

                  CustomText(top: 24, bottom: 12, text: "Email".tr),
                  Form(
                    key: formkey,
                    child: CustomTextField(
                      textEditingController: controller.emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStaticStrings.enteremail;
                        } else if (!AppStaticStrings.emailRegexp
                            .hasMatch(controller.emailController.text)) {
                          return AppStaticStrings.enterValidEmail;
                        } else {
                          return null;
                        }
                      },
                      hintText: "Enter email".tr,
                      fillColor: AppColors.stroke,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: GetBuilder<Authcontroller>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: controller.loading
                ? const CustomLoader()
                : CustomButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        controller.resendOTP().then((value) {
                          if (value == true) {
                            Get.toNamed(AppRoute.otpScreen, arguments: true);
                          }
                        });
                      }
                    },
                    titleText: "Continue".tr),
          );
        }),
      ),
    );
  }
}
