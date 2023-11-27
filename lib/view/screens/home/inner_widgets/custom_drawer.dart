import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_icons.dart';
import 'package:barbar_provider/utils/app_images.dart';
import 'package:barbar_provider/view/screens/home/inner_widgets/drawer_card.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
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
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
              child: Row(
                children: [
                  Container(
                      height: 48,
                      width: 48,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: const CustomImage(
                          imageSrc: AppImages.profile,
                          imageType: ImageType.png,
                          size: 48)),
                  const SizedBox(width: 16),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          text: "Jane Cooper",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          bottom: 8),
                      CustomText(
                          text: "jane.07@gmail.com",
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ],
                  ),
                ],
              ),
            ),
            DrawerCard(imageSrc: AppIcons.br, text: "Booking Request", imageType: ImageType.png,colorTrue: true,onTap: () => Get.toNamed(AppRoute.bookingRequest)),
            const SizedBox(height: 16),
            DrawerCard(imageSrc: AppIcons.br, text: "Approved Bookings", imageType: ImageType.png, onTap: () => Get.toNamed(AppRoute.approvedBooking)),
            const SizedBox(height: 16),
            DrawerCard(imageSrc: AppIcons.br, text: "Booking History", imageType: ImageType.png,onTap: () => Get.toNamed(AppRoute.bookingHistory)),
            const SizedBox(height: 16),
            DrawerCard(imageSrc: AppIcons.editDetails, text: "Edit Business Details", imageType: ImageType.png, onTap: () => Get.toNamed(AppRoute.editBusinessDetails)),
            const SizedBox(height: 16),
            DrawerCard(imageSrc: AppIcons.categories, text: "Categories", imageType: ImageType.png, onTap: () => Get.toNamed(AppRoute.categoriesScreen)),
            const SizedBox(height: 16),
            DrawerCard(imageSrc: AppIcons.reviews, text: "Clients Reviews", imageType: ImageType.png, onTap: () => Get.toNamed(AppRoute.clientsReviews)),
          ],
        ),
      ),
    );
  }
}
