import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_images.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/button/custom_button.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/custom_textfield/custom_textfield.dart';
import 'package:barbar_provider/view/widgets/image/custom_image.dart';
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
        appBar: CustomAppBar(appBarContent: CustomBack(text: "Edit Profile".tr)),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 48),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Profile Image change
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      height: 120,width: 120,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle
                      ),
                      child: const CustomImage(imageSrc: AppImages.profile,imageType: ImageType.png),
                    ),
                    CustomText(text: "Update Picture".tr,fontWeight: FontWeight.w500,color: AppColors.primaryOrange,top: 16)
                  ],
                ),
              ),

              CustomText(text: "Name".tr,top: 24,bottom: 12),
              const CustomTextField(hintText: "Jane Cooper",hintColor: AppColors.white),
              CustomText(text: "Email".tr,top: 16,bottom: 12),
              const CustomTextField(hintText: "jane.07@gmail.com",hintColor: AppColors.white),
              CustomText(text: "Phone Number".tr,top: 16,bottom: 12),
              const CustomTextField(hintText: "(406) 555-1020",hintColor: AppColors.white),
              CustomText(text: "Address".tr,top: 16,bottom: 12),
              const CustomTextField(hintText: "2972 Westheimer Rd. Santa Ana, Illinois 85486 ",maxLines: 4,hintColor: AppColors.white),
              
              const SizedBox(height: 56),
              CustomButton(titleText: "Update Profile".tr,onPressed: ()=> Get.back()),
            ],
          ),
        ),
      ),
    );
  }
}
