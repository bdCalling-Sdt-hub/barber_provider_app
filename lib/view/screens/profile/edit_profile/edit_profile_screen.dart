import 'dart:io';

import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/view/screens/profile/controller/profile_controller.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/button/custom_button.dart';
import 'package:barbar_provider/view/widgets/custom_loader/custom_loader.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/custom_textfield/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar:
            CustomAppBar(appBarContent: CustomBack(text: "Edit Profile".tr)),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 48),
          physics: const BouncingScrollPhysics(),
          child: GetBuilder<ProfileController>(builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Profile Image change
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      //==========================Profile Image=====================
                      GestureDetector(
                        onTap: () {
                          controller.openGallery();
                        },
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: controller.proImage == null
                                  ?
                                  //=====================Image from server======================
                                  DecorationImage(
                                      image: NetworkImage(controller
                                                  .proImgURL !=
                                              null
                                          ? "${ApiConstant.baseUrl}${controller.proImgURL}"
                                          : AppConstants.onlineImage))
                                  :
                                  //=====================Image from File======================

                                  DecorationImage(
                                      fit: BoxFit.cover,
                                      image: FileImage(
                                          File(controller.proImage!.path)))),
                        ),
                      ),
                      CustomText(
                          text: "Update Picture".tr,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryOrange,
                          top: 16)
                    ],
                  ),
                ),

                //==========================Name=====================

                CustomText(text: "Name".tr, top: 24, bottom: 12),
                CustomTextField(
                    textEditingController: controller.nameController,
                    hintText: "Enter name",
                    hintColor: AppColors.white),

                //==========================Email=====================

                CustomText(text: "Email".tr, top: 16, bottom: 12),
                CustomTextField(
                    readOnly: true,
                    textEditingController: controller.emailController,
                    hintText: "Enter email",
                    hintColor: AppColors.white),

                //==========================Phone Number=====================

                CustomText(text: "Phone Number".tr, top: 16, bottom: 12),
                CustomTextField(
                    textEditingController: controller.phoneController,
                    hintText: "Enter phone number",
                    hintColor: AppColors.white),

                //==========================Address=====================

                CustomText(text: "Address".tr, top: 16, bottom: 12),
                CustomTextField(
                    textEditingController: controller.addressController,
                    hintText: "Enter Address",
                    maxLines: 4,
                    hintColor: AppColors.white),

                const SizedBox(height: 56),
                controller.profileUpdateLoading
                    ? const CustomLoader()
                    : CustomButton(
                        titleText: "Update Profile".tr,
                        onPressed: () {
                          controller.updateProfile();
                        }),
              ],
            );
          }),
        ),
      ),
    );
  }
}
