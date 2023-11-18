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

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 30.0,left: 20,right: 20),
          child: CustomButton(
              //onPressed: ()=>Navigator.pushNamed(context, AppRoute.otpScreen),
              titleText: "Continue".tr),
        ),
        appBar: CustomAppBar(
          appBarContent: CustomBack(text: "Forgot Password".tr)
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 24),
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [

                  CustomText(
                    text: "Please enter your email address for recover your password.".tr,
                    maxLines: 2,overflow: TextOverflow.ellipsis,bottom: 24
                  ),

                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: AppColors.primaryOrange,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(24.0),
                      child: CustomImage(
                        imageSrc: AppIcons.forgetPass,
                      ),
                    ),
                  ),

                  CustomText(top: 24,bottom: 12, text: "Email".tr),

                  CustomTextField(
                    hintText: "Enter email".tr,
                    fillColor: AppColors.stroke,
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
