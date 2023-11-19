import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_icons.dart';
import 'package:barbar_provider/view/widgets/button/custom_button.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscriptionPlanCard extends StatelessWidget {
  const SubscriptionPlanCard(
      {super.key,
      required this.months,
      required this.price,
      required this.buttonText,
      required this.title});

  final String months;
  final String price;
  final String buttonText;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(vertical: 32),
            decoration: const BoxDecoration(
              color: AppColors.primaryOrange,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                topLeft: Radius.circular(8),
              ),
            ),
            child: CustomText(
                text: title, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        text: "Purchase for".tr, color: AppColors.paragraph),
                    CustomText(text: "\$$price".tr, left: 12),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        text: "Package Validity".tr,
                        color: AppColors.paragraph),
                    CustomText(text: "$months Months".tr, left: 12),
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.stroke, thickness: 1),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomImage(imageSrc: AppIcons.check, size: 24),
                    Flexible(
                        child: CustomText(
                            text:
                                "Add unlimited services for your business.".tr,
                            left: 8,
                            fontSize: 14,
                            maxLines: 2,
                            textAlign: TextAlign.start)),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomImage(imageSrc: AppIcons.check, size: 24),
                    Flexible(
                        child: CustomText(
                            text: "Edit service details.".tr,
                            left: 8,
                            fontSize: 14,
                            maxLines: 2,
                            textAlign: TextAlign.start)),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomImage(imageSrc: AppIcons.check, size: 24),
                    Flexible(
                        child: CustomText(
                            text: "Manage bookings.".tr,
                            left: 8,
                            fontSize: 14,
                            maxLines: 2,
                            textAlign: TextAlign.start)),
                  ],
                ),
                const SizedBox(height: 16),
                CustomButton(
                    titleText: buttonText.tr, titleSize: 16, buttonHeight: 52)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
