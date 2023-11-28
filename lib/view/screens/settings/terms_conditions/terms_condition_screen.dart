import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsCondition extends StatelessWidget {
  const TermsCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(
          appBarContent: CustomBack(text: "Terms & Conditions".tr),
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              CustomText(
                  text: "Lorem ipsum dolor sit amet consectetur",
                  maxLines: 2,textAlign: TextAlign.start,
                  fontWeight: FontWeight.w600),
              CustomText(
                  text:
                  "Lorem ipsum dolor sit amet consectetur. Imperdiet iaculis convallis bibendum massa id elementum consectetur neque mauris. In pellentesque adipiscing nec eget platea euismod massa. Cras urna nulla nulla urna faucibus.",
                  fontSize: 14,
                  textAlign: TextAlign.start,
                  top: 16,color: AppColors.paragraph,
                  maxLines: 5),
            ],
          ),
        ),
      ),
    );
  }
}