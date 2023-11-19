import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_icons.dart';
import 'package:barbar_provider/utils/app_images.dart';
import 'package:barbar_provider/view/screens/profile/inner_widgets/log_out_popup.dart';
import 'package:barbar_provider/view/screens/profile/inner_widgets/profile_cards.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/image/custom_image.dart';
import 'package:barbar_provider/view/widgets/subsription_plan/subsription_plan_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(
            appBarContent: CustomBack(text: "Profile".tr, isIcon: false)),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            children: [
              //Profile Image and Name Section
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.cardBgColor),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 64,
                      width: 64,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: const CustomImage(
                          imageSrc: AppImages.profile,
                          imageType: ImageType.png),
                    ),
                    const Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                              text: "Jane Cooper",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                          CustomText(
                              text: "jane.07@gmail.com",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              top: 8),
                        ],
                      ),
                    ),
                    const SizedBox(width: 24),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoute.editProfile);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                            color: AppColors.primaryOrange,
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            const CustomImage(
                                imageSrc: AppIcons.edit, size: 18),
                            CustomText(text: "Edit".tr, left: 4, fontSize: 14)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              ProfileCards(
                  imageSrc: AppIcons.subscriptionPlan,
                  text: "Subscription Plan".tr,
                  onTap: () {
                    Get.toNamed(AppRoute.subscriptionPlans);
                  }),
              const SizedBox(height: 16),
              ProfileCards(
                imageSrc: AppIcons.subscriptionPlan,
                text: "My Plan".tr,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        contentPadding: const EdgeInsets.all(0),
                        backgroundColor: AppColors.cardBgColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        content: const SubscriptionPlanCard(
                            months: "3",
                            price: "200",
                            buttonText: "Renew",
                            title: "Gold"),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              ProfileCards(
                  imageSrc: AppIcons.settings,
                  text: "Settings".tr,
                  onTap: () {
                    Get.toNamed(AppRoute.settings);
                  }),
              const SizedBox(height: 16),
              ProfileCards(
                imageSrc: AppIcons.logOut,
                text: "Log out".tr,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const LogOutPopUp();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
