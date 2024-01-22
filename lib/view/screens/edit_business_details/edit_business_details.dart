import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/view/screens/add_new_service/controllers/add_provider_controller.dart';
import 'package:barbar_provider/view/screens/edit_business_details/inner_widget/select_time.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/button/custom_button.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/custom_textfield/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditBusinessDetails extends StatelessWidget {
  const EditBusinessDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(
          appBarContent: CustomBack(
            text: "Edit Business Details".tr,
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          physics: const BouncingScrollPhysics(),
          child: GetBuilder<AddProviderController>(builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //==============================Business Name==========================

                CustomText(text: "Business Name".tr, bottom: 12),
                const CustomTextField(
                    hintText: "Green Apple Salon", hintColor: AppColors.white),

                //==============================Address==========================

                CustomText(text: "Address".tr, top: 16, bottom: 12),
                const CustomTextField(
                    hintText: "6391 Elgin St Celina, Delaware",
                    hintColor: AppColors.white),

                //==============================Description==========================

                CustomText(text: "Description".tr, top: 16, bottom: 12),
                const CustomTextField(
                  hintText:
                      "Lorem ipsum dolor sit amet consectetur. Tortor nec lectus lectus felis odio. Quis accumsan adipiscing massa leo urna tincidunt at. Eleifend in rutrum in scelerisque faucibus sem imperdiet. Nisi pharetra aliquam nunc pellentesque habitasse donec nulla.",
                  maxLines: 8,
                  hintColor: AppColors.white,
                ),

                //==============================Cover Photo==========================

                CustomText(text: "Change Cover Photo".tr, top: 16, bottom: 12),
                Container(
                  height: 190,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.cardBgColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.camera_alt_outlined,
                          color: AppColors.primaryOrange, size: 64),
                      CustomText(
                          text: "Change Picture".tr,
                          color: AppColors.primaryOrange,
                          fontWeight: FontWeight.w500)
                    ],
                  ),
                ),

                //==============================Gallery Photo==========================

                CustomText(text: "Gallery Photo".tr, top: 16, bottom: 12),
                Container(
                  height: 190,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.cardBgColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.camera_alt_outlined,
                          color: AppColors.primaryOrange, size: 64),
                      CustomText(
                          text: "Change Picture".tr,
                          color: AppColors.primaryOrange,
                          fontWeight: FontWeight.w500)
                    ],
                  ),
                ),

                //==============================Change Service Hours==========================

                CustomText(
                    text: "Change Service Hours".tr, top: 16, bottom: 12),
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
                CustomButton(
                    titleText: "Save".tr,
                    onPressed: () => Get.offAllNamed(AppRoute.navBar)),
                const SizedBox(height: 24),
              ],
            );
          }),
        ),
      ),
    );
  }
}
