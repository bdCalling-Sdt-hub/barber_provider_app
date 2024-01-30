import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_icons.dart';
import 'package:barbar_provider/view/widgets/button/custom_button.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SubscriptionPlanCard extends StatelessWidget {
  const SubscriptionPlanCard(
      {super.key,
      this.color,
      required this.months,
      required this.price,
      required this.buttonText,
      required this.title,
      this.showButton = true,
      this.packageFeatures = const [],
      this.ontap});

  final String months;
  final String price;
  final String buttonText;
  final String title;
  final Color? color;
  final bool showButton;
  final VoidCallback? ontap;
  final List<String> packageFeatures;

  @override
  Widget build(BuildContext context) {
    Widget features({required String title}) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomImage(imageSrc: AppIcons.check, size: 24),
          Flexible(
              child: CustomText(
                  text: title,
                  left: 8,
                  fontSize: 14,
                  maxLines: 2,
                  textAlign: TextAlign.start)),
        ],
      );
    }

    return Container(
      margin: EdgeInsets.only(right: 20.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 32.h),
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

          //===================================Purchase Price==============================

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        text: "Purchase for".tr, color: AppColors.paragraph),
                    CustomText(text: "\$$price".tr, left: 12.w),
                  ],
                ),
                const SizedBox(height: 16),

                //===================================Package Validity==============================

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: "Validity".tr, color: AppColors.paragraph),
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
                // features(title: "Add unlimited services for your business."),
                // const SizedBox(height: 12),

                // features(title: "Edit service details"),
                // const SizedBox(height: 12),

                // features(title: "Manage bookings"),

                Column(
                  children: List.generate(packageFeatures.length,
                      (index) => features(title: packageFeatures[index])),
                ),

                const SizedBox(height: 16),

                //===================================Purches Button======================

                if (showButton)
                  CustomButton(
                      onPressed: () {
                        ontap!();
                      },
                      titleText: buttonText.tr,
                      titleSize: 16,
                      buttonHeight: 52)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
