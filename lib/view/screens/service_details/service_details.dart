import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_images.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/image/custom_image.dart';
import 'package:barbar_provider/view/widgets/row_text/row_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceDetails extends StatelessWidget {
  const ServiceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(appBarContent: CustomBack(text: "Service Details".tr, isEdit: true,onPressed: () => Get.toNamed(AppRoute.editServiceDetails))),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 180,
                margin: const EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                        image: AssetImage(AppImages.salon), fit: BoxFit.fill)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomText(
                      text: "Haircuts", fontWeight: FontWeight.w600),
                  Container(
                    height: 24,
                    width: 24,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.primaryOrange),
                    child: const Icon(Icons.share_outlined,
                        color: AppColors.white, size: 14),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Row(
                children: [
                  Icon(Icons.star, size: 16, color: AppColors.primaryOrange),
                  CustomText(
                      text: "4.5(2025 Reviews)",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      left: 12)
                ],
              ),
              const SizedBox(height: 12),
              const Row(
                children: [
                  Icon(Icons.location_on,
                      size: 16, color: AppColors.primaryOrange),
                  CustomText(
                      text: "6391 Elgin St Celina, Delaware",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      left: 12)
                ],
              ),
              const CustomText(
                  text: "Description",
                  fontWeight: FontWeight.w600,
                  top: 24,
                  bottom: 16),
              const CustomText(
                text: "Lorem ipsum dolor sit amet consectetur. Tortor nec lectus lectus felis odio. Quis accumsan adipiscing massa leo urna tincidunt at. Eleifend in rutrum in scelerisque faucibus sem imperdiet. Nisi pharetra aliquam nunc pellentesque habitasse donec nulla.",
                maxLines: 5,textAlign: TextAlign.start,fontSize: 14,color: AppColors.paragraph,
                overflow: TextOverflow.ellipsis,
              ),

              CustomText(
                text: "Gallery".tr,
                fontWeight: FontWeight.w600,
                top: 24,
                bottom: 16,
              ),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 80,
                      width: 80,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const CustomImage(
                        imageSrc: AppImages.service,
                        imageType: ImageType.png,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                ),
              ),

              CustomText(
                  text: "Service Hours".tr,
                  fontWeight: FontWeight.w600,
                  top: 24,
                  bottom: 16),
              const RowText(field: "Sun :", value: "8.00 AM - 10 PM"),
              const SizedBox(height: 12),
              const RowText(field: "Mon :", value: "8.00 AM - 10 PM"),
              const SizedBox(height: 12),
              const RowText(field: "Tue :", value: "8.00 AM - 10 PM"),
              const SizedBox(height: 12),
              const RowText(field: "Wed :", value: "8.00 AM - 10 PM"),
              const SizedBox(height: 12),
              const RowText(field: "Thu :", value: "8.00 AM - 10 PM"),
              const SizedBox(height: 12),
              const RowText(field: "Fri :", value: "8.00 AM - 10 PM"),
              const SizedBox(height: 12),
              const RowText(field: "Sat :", value: "8.00 AM - 10 PM"),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
