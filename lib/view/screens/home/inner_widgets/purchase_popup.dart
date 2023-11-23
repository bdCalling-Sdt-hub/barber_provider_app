import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/view/widgets/button/custom_button.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PurchasePopUp extends StatelessWidget {
  const PurchasePopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.primaryOrange,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 16),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      content: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            CustomText(text: "You have to subscribe for add services as a provider ".tr,maxLines: 4,fontWeight: FontWeight.w500),
            CustomText(text: "Please purchase a subscription for adding services for your business.".tr,maxLines: 5,top: 12,color: AppColors.paragraph,bottom: 24),
            CustomButton(titleText: "Purchase Subscription".tr,buttonHeight: 44,buttonColor: AppColors.white,titleColor: AppColors.primaryOrange,onPressed: () => Get.toNamed(AppRoute.subscriptionPlans))
          ],
        ),
      ),
    );
  }
}
