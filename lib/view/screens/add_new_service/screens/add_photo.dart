import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/button/custom_button.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPhoto extends StatelessWidget {
  const AddPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(appBarContent: CustomBack(text: "Add Photos".tr)),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 24),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: "Upload Cover Photo".tr,bottom: 16,fontWeight: FontWeight.w500),
              Container(
                height: 190,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.cardBgColor
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.camera_alt_outlined,color: AppColors.primaryOrange,size: 64),
                    CustomText(text: "Upload Picture".tr,color: AppColors.primaryOrange,fontWeight: FontWeight.w500)
                  ],
                ),
              ),
              CustomText(text: "Gallery Photo".tr,top: 24,bottom: 16,fontWeight: FontWeight.w500),
              Container(
                height: 190,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.cardBgColor
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.camera_alt_outlined,color: AppColors.primaryOrange,size: 64),
                    CustomText(text: "Upload Picture".tr,color: AppColors.primaryOrange,fontWeight: FontWeight.w500)
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 24),
          child: CustomButton(titleText: "Continue".tr,onPressed: () => Get.toNamed(AppRoute.addServiceDetails)),
        ),
      ),
    );
  }
}
