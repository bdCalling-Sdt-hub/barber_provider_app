import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/view/screens/edit_business_details/inner_widget/select_time.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/button/custom_button.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/custom_textfield/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddServiceDetails extends StatelessWidget {
  const AddServiceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(appBarContent: CustomBack(text: "Add Service Details".tr)),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 24),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: "Service name".tr,bottom: 12),
              CustomTextField(hintText: "Enter service name".tr),
              CustomText(text: "Service description".tr,bottom: 12,top: 16),
              CustomTextField(hintText: "Enter service description".tr,maxLines: 5),
              CustomText(text: "Gallery Photo".tr,bottom: 12,top: 16),

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
              CustomText(text: "Service Duration".tr,bottom: 12,top: 16),
              CustomTextField(hintText: "Enter service duration".tr),

              CustomText(text: "Select service charges".tr,top: 16,fontWeight: FontWeight.w600,fontSize: 18),

              CustomText(text: "Salon Service Charge".tr,bottom: 12,top: 16),
              CustomTextField(hintText: "Enter service amount".tr),

              CustomText(text: "Home Service Charge".tr,bottom: 12,top: 16),
              CustomTextField(hintText: "Set booking money".tr),

              CustomText(text: "Set Booking money".tr,bottom: 12,top: 16),
              CustomTextField(hintText: "Set Booking money".tr),

              CustomText(text: "Available Service Hours".tr,top: 16,bottom: 16),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: "Day"),
                      SizedBox(height: 26),
                      CustomText(text: "Sun"),
                      SizedBox(height: 26),
                      CustomText(text: "Mon"),
                      SizedBox(height: 26),
                      CustomText(text: "Tue"),
                      SizedBox(height: 26),
                      CustomText(text: "Wed"),
                      SizedBox(height: 26),
                      CustomText(text: "Thu"),
                      SizedBox(height: 26),
                      CustomText(text: "Fri"),
                      SizedBox(height: 26),
                      CustomText(text: "Sat"),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(text: "Open Time"),
                      SizedBox(height: 16),
                      SelectTime(),
                      SizedBox(height: 16),
                      SelectTime(),
                      SizedBox(height: 16),
                      SelectTime(),
                      SizedBox(height: 16),
                      SelectTime(),
                      SizedBox(height: 16),
                      SelectTime(),
                      SizedBox(height: 16),
                      SelectTime(),
                      SizedBox(height: 16),
                      SelectTime(),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(text: "Closed Time"),
                      SizedBox(height: 16),
                      SelectTime(),
                      SizedBox(height: 16),
                      SelectTime(),
                      SizedBox(height: 16),
                      SelectTime(),
                      SizedBox(height: 16),
                      SelectTime(),
                      SizedBox(height: 16),
                      SelectTime(),
                      SizedBox(height: 16),
                      SelectTime(),
                      SizedBox(height: 16),
                      SelectTime(),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 44),

              CustomButton(titleText: "Save".tr,onPressed: () => Get.offAllNamed(AppRoute.navBar)),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
