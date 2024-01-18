import 'dart:io';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/view/screens/add_new_service/controllers/add_provider_controller.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/button/custom_button.dart';
import 'package:barbar_provider/view/widgets/custom_loader/custom_loader.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        body: GetBuilder<AddProviderController>(builder: (controller) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //================================Upload Cover Photo==============================

                CustomText(
                    text: "Upload Cover Photo".tr,
                    bottom: 16,
                    fontWeight: FontWeight.w500),
                GestureDetector(
                  onTap: () {
                    controller.openGallery(isCoverPhoto: true);
                  },
                  child: Container(
                    height: 240.h,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.cardBgColor),
                    child: controller.coverPhoto == null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.camera_alt_outlined,
                                  color: AppColors.primaryOrange, size: 64),
                              CustomText(
                                  text: "Upload Picture".tr,
                                  color: AppColors.primaryOrange,
                                  fontWeight: FontWeight.w500)
                            ],
                          )
                        : Image.file(
                            fit: BoxFit.cover,
                            File(controller.coverPhoto!.path)),
                  ),
                ),

                //================================Upload Cover Photo==============================

                CustomText(
                    text: "Gallery Photo".tr,
                    top: 24,
                    bottom: 16,
                    fontWeight: FontWeight.w500),
                GestureDetector(
                  onTap: () {
                    controller.openGallery(isCoverPhoto: false);
                  },
                  child: Container(
                    height: 240.h,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.cardBgColor),
                    child: controller.galleryPhoto == null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.camera_alt_outlined,
                                  color: AppColors.primaryOrange, size: 64),
                              CustomText(
                                  text: "Upload Picture".tr,
                                  color: AppColors.primaryOrange,
                                  fontWeight: FontWeight.w500)
                            ],
                          )
                        : Image.file(
                            fit: BoxFit.cover,
                            File(controller.galleryPhoto!.path)),
                  ),
                ),
              ],
            ),
          );
        }),
        bottomNavigationBar:
            GetBuilder<AddProviderController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: controller.isLoading
                ? const CustomLoader()
                : CustomButton(
                    titleText: "Continue".tr,
                    onPressed: () {
                      controller.addProvider();
                    }),
          );
        }),
      ),
    );
  }
}
