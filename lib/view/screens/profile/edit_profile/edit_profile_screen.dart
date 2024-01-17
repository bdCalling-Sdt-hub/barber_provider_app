import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/view/screens/profile/controller/profile_controller.dart';
import 'package:barbar_provider/view/screens/profile/model/profile_model.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/button/custom_button.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/custom_textfield/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileModel profileModel = Get.arguments;
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
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(profileModel.image != null
                                    ? "${ApiConstant.baseUrl}${profileModel.image}"
                                    : AppConstants.onlineImage))),
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
                    textEditingController: controller.nameController =
                        TextEditingController(text: profileModel.name),
                    hintText: profileModel.name.toString(),
                    hintColor: AppColors.white),

                //==========================Email=====================

                CustomText(text: "Email".tr, top: 16, bottom: 12),
                CustomTextField(
                    textEditingController: controller.emailController =
                        TextEditingController(text: profileModel.email),
                    hintText: "jane.07@gmail.com",
                    hintColor: AppColors.white),

                //==========================Phone Number=====================

                CustomText(text: "Phone Number".tr, top: 16, bottom: 12),
                CustomTextField(
                    textEditingController: controller.phoneController =
                        TextEditingController(text: profileModel.phoneNumber),
                    hintText: "Enter phone number",
                    hintColor: AppColors.white),

                //==========================Address=====================

                CustomText(text: "Address".tr, top: 16, bottom: 12),
                CustomTextField(
                    textEditingController: controller.addressController =
                        TextEditingController(text: profileModel.address),
                    hintText: "Enter Address",
                    maxLines: 4,
                    hintColor: AppColors.white),

                const SizedBox(height: 56),
                CustomButton(
                    titleText: "Update Profile".tr,
                    onPressed: () => Get.back()),
              ],
            );
          }),
        ),
      ),
    );
  }
}
