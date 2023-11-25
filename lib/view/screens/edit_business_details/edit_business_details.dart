import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: "Business Name".tr, bottom: 12),
              const CustomTextField(hintText: "Green Apple Salon"),
              CustomText(text: "Address".tr, top: 16, bottom: 12),
              const CustomTextField(hintText: "6391 Elgin St Celina, Delaware"),
              CustomText(text: "Description".tr, top: 16, bottom: 12),
              const CustomTextField(
                hintText:
                    "Lorem ipsum dolor sit amet consectetur. Tortor nec lectus lectus felis odio. Quis accumsan adipiscing massa leo urna tincidunt at. Eleifend in rutrum in scelerisque faucibus sem imperdiet. Nisi pharetra aliquam nunc pellentesque habitasse donec nulla.",
                maxLines: 8,
              ),
              CustomText(text: "Change Cover Photo".tr,top: 16,bottom: 12),

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
                    CustomText(text: "Change Picture".tr,color: AppColors.primaryOrange)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
