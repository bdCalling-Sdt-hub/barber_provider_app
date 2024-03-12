import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/helper/network_image.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_icons.dart';
import 'package:barbar_provider/view/screens/home/inner_widgets/drawer_card.dart';
import 'package:barbar_provider/view/screens/profile/controller/profile_controller.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.cardBgColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      width: 244,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //=====================================-Profile Information============================

            GetBuilder<ProfileController>(builder: (controller) {
              var data = controller.profileModel.value;
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 35.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //====================Image================

                    CustomNetworkImage(
                        boxShape: BoxShape.circle,
                        imageUrl:
                            "${ApiConstant.baseUrl}${controller.profileModel.value.image!}",
                        height: 48.w,
                        width: 48.w),

                    SizedBox(
                      width: 10.w,
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //====================Name================

                        CustomText(
                            text: data.name ?? "loading",
                            fontSize: 14.w,
                            fontWeight: FontWeight.w500,
                            bottom: 8),

                        //====================email================

                        CustomText(
                            text: data.email ?? "loading",
                            fontSize: 12.w,
                            fontWeight: FontWeight.w400),
                      ],
                    ),
                  ],
                ),
              );
            }),

            //==============================Booking Req================================

            DrawerCard(
                imageSrc: AppIcons.br,
                text: "Booking Request",
                imageType: ImageType.png,
                onTap: () => Get.toNamed(AppRoute.bookingRequest)),
            const SizedBox(height: 16),

            //==============================Approved Bookings================================

            DrawerCard(
                imageSrc: AppIcons.br,
                text: "Approved Bookings",
                imageType: ImageType.png,
                onTap: () => Get.toNamed(AppRoute.approvedBooking)),
            const SizedBox(height: 16),

            //==============================Bookings History================================

            DrawerCard(
                imageSrc: AppIcons.br,
                text: "Booking History",
                imageType: ImageType.png,
                onTap: () => Get.toNamed(AppRoute.bookingHistory)),
            const SizedBox(height: 16),

            //==============================Edit Business Details================================

            DrawerCard(
                imageSrc: AppIcons.editDetails,
                text: "Edit Business Details",
                imageType: ImageType.png,
                onTap: () => Get.toNamed(AppRoute.editBusinessDetails)),
            const SizedBox(height: 16),

            //===============================Service Catelouge=============================
            DrawerCard(
                imageSrc: AppIcons.categories,
                text: "Service & Catalogue ",
                imageType: ImageType.png,
                onTap: () => Get.toNamed(AppRoute.serviceCatalogue)),
            const SizedBox(height: 16),

            //===============================Clients Reviews=============================

            DrawerCard(
                imageSrc: AppIcons.reviews,
                text: "Clients Reviews",
                imageType: ImageType.png,
                onTap: () => Get.toNamed(AppRoute.clientsReviews)),
          ],
        ),
      ),
    );
  }
}
