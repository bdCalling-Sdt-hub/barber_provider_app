import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_icons.dart';
import 'package:barbar_provider/view/screens/auth/sign_up/sign_up_controller/sign_up_controller.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/button/custom_button.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController pinController = TextEditingController();

    return SafeArea(
      top: true,
      child: GetBuilder<SignUpController>(builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.bgColor,
          appBar: CustomAppBar(appBarContent: CustomBack(text: "OTP".tr)),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24),
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                //=================Text================
                CustomText(
                  text:
                      "Please enter the OTP we have sent you in your email.".tr,
                  bottom: 24,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: AppColors.primaryOrange,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const CustomImage(
                    imageSrc: AppIcons.otp,
                    imageType: ImageType.png,
                  ),
                ),
                const SizedBox(height: 24),

                //======================OTP input field==========
                PinCodeTextField(
                  controller: pinController,
                  keyboardType: TextInputType.number,
                  appContext: (context),
                  // validator: (value) {
                  //   if (value!.length <= 4) {
                  //     return null;
                  //   } else {
                  //     return;
                  //   }
                  // },
                  onCompleted: (value) {
                    controller.otp = value;
                  },
                  autoFocus: true,
                  textStyle: const TextStyle(color: AppColors.white),
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: 64,
                    fieldWidth: 50,
                    activeFillColor: AppColors.bgColor,
                    selectedFillColor: AppColors.bgColor,
                    inactiveFillColor: AppColors.bgColor,
                    borderWidth: 10,
                    errorBorderColor: AppColors.stroke,
                    selectedColor: AppColors.stroke,
                    activeColor: AppColors.primaryOrange,
                    inactiveColor: AppColors.stroke,
                  ),
                  length: 6,
                  enableActiveFill: true,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                        child: CustomText(
                            text: "Did not get the OTP?".tr,
                            maxLines: 2,
                            textAlign: TextAlign.start)),
                    const SizedBox(width: 24),

                    //====================> Resend OTP Button <=====================
                    GestureDetector(
                      onTap: () {},
                      child: CustomText(
                          text: "Resend OTP".tr,
                          color: AppColors.primaryOrange,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),

          //////===========================Verify Button=========================
          ///

          bottomNavigationBar: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            physics: const ClampingScrollPhysics(),
            child: CustomButton(
                onPressed: () {
                  // Get.toNamed(AppRoute.resetPassword);
                  controller.varifyOTP();
                },
                titleText: "Verify".tr),
          ),
        );
      }),
    );
  }
}
