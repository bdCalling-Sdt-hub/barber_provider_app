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

class AddProviderDetails extends StatelessWidget {
  const AddProviderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(appBarContent: CustomBack(text: "Add Provider Details".tr)),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: "Business Name".tr, bottom: 12),
              CustomTextField(hintText: "Enter salon name".tr,),
              CustomText(text: "Address".tr, top: 16, bottom: 12),
              CustomTextField(hintText: "Enter salon address".tr),
              CustomText(text: "Description".tr, top: 16, bottom: 12),
              CustomTextField(hintText:"Enter salon description".tr, maxLines: 6),

              CustomText(text: "Available Service Hours".tr,top: 16,bottom: 12),

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

              CustomButton(titleText: "Continue".tr,onPressed: () => Get.offAllNamed(AppRoute.addPhotos)),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
