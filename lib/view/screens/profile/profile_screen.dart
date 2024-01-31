import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/utils/app_icons.dart';
import 'package:barbar_provider/view/screens/profile/controller/profile_controller.dart';
import 'package:barbar_provider/view/screens/profile/inner_widgets/log_out_popup.dart';
import 'package:barbar_provider/view/screens/profile/inner_widgets/profile_cards.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/custom_loader/custom_loader.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/error/general_error.dart';
import 'package:barbar_provider/view/widgets/image/custom_image.dart';
import 'package:barbar_provider/view/widgets/subsription_plan/subsription_plan_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileController profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(
            appBarContent: CustomBack(text: "Profile".tr, isIcon: false)),
        body: Obx(() {
          var value = profileController.packageInfo[0].package;
          switch (profileController.rxRequestStatus.value) {
            case Status.loading:
              return const CustomLoader();
            case Status.internetError:
              return const CustomLoader();
            case Status.error:
              return GeneralErrorScreen(
                onTap: () {
                  profileController.getProfileInfo();
                },
              );

            case Status.completed:
              return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: Column(
                    children: [
                      //============================Profile Image and Name Section=================

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
                            //============================Profile Image=======================

                            Container(
                              height: 64.w,
                              width: 64.w,
                              margin: EdgeInsets.only(right: 10.w),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(profileController
                                                  .profileModel.value.image ==
                                              null
                                          ? AppConstants.onlineImage
                                          : "${ApiConstant.baseUrl}${profileController.profileModel.value.image}"))),
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //============================Profile Name====================

                                  CustomText(
                                      fontSize: 14.w,
                                      text: profileController
                                          .profileModel.value.name
                                          .toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),

                                  //============================Profile gmail=================

                                  CustomText(
                                      fontSize: 12.w,
                                      text: profileController
                                          .profileModel.value.email
                                          .toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      top: 8),
                                ],
                              ),
                            ),
                            const SizedBox(width: 24),

                            //============================Edit Button=====================

                            GestureDetector(
                              onTap: () {
                                // Get.toNamed(AppRoute.editProfile,
                                //     arguments:
                                //         profileController.profileModel.value);

                                profileController.updateProfileControllerValue(
                                    profileController.profileModel.value);
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
                                    CustomText(
                                        text: "Edit".tr, left: 4, fontSize: 14)
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
                      //=====================================My Plan=================================

                      if (profileController.packageInfo.isNotEmpty)
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
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  content: SizedBox(
                                    height: 400,
                                    child: SubscriptionPlanCard(
                                        packageFeatures:
                                            value!.packageFeatures!.isEmpty
                                                ? [
                                                    "Add unlimited services for your business",
                                                    "Edit service details",
                                                    "Manage bookings"
                                                  ]
                                                : value.packageFeatures!,
                                        ontap: () {
                                          navigator!.pop();
                                          Get.toNamed(
                                              AppRoute.subscriptionPlans);
                                        },
                                        months: value.packageDuration ?? "",
                                        price: "${value.price ?? 0}",
                                        buttonText: "Renew",
                                        title: value.packageName ?? ""),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      const SizedBox(height: 16),

                      //=====================================Settings=================================

                      ProfileCards(
                          imageSrc: AppIcons.settings,
                          text: "Settings".tr,
                          onTap: () {
                            Get.toNamed(AppRoute.settings);
                          }),
                      const SizedBox(height: 16),

                      //=====================================Log out=================================

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
                  ));
          }
        }),
      ),
    );
  }
}
