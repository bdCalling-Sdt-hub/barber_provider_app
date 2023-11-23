import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_icons.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/image/custom_image.dart';
import 'package:barbar_provider/view/widgets/row_text/row_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingHistory extends StatelessWidget {
  const BookingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.bgColor,
        appBar: CustomAppBar(appBarContent: CustomBack(text: "Booking History".tr)),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 24),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(16),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: AppColors.cardBgColor,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomImage(imageSrc: AppIcons.bookings,size: 20),
                        CustomText(text: "06 Nov 2023, 07:30",fontWeight: FontWeight.w500,color: AppColors.primaryOrange,left: 16),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: RowText(field: "Client name :".tr, value: "Jane Cooper"),
                    ),

                    RowText(field: "Services :".tr, value: "Regular Hair Cut, Hair Spa"),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: RowText(field: "Service Type :".tr, value: "Home Service"),
                    ),

                    RowText(field: "Total Amount :".tr, value: "\$ 100"),

                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: RowText(field: "Booking Status :".tr, value: "Completed",color: AppColors.green),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(16),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: AppColors.cardBgColor,
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomImage(imageSrc: AppIcons.bookings,size: 20),
                        CustomText(text: "06 Nov 2023, 07:30",fontWeight: FontWeight.w500,color: AppColors.primaryOrange,left: 16),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: RowText(field: "Client name :".tr, value: "Jane Cooper"),
                    ),

                    RowText(field: "Services :".tr, value: "Regular Hair Cut, Hair Spa"),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: RowText(field: "Service Type :".tr, value: "Home Service"),
                    ),

                    RowText(field: "Total Amount :".tr, value: "\$ 100"),

                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: RowText(field: "Booking Status :".tr, value: "Marked as late",color: AppColors.yellow),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(16),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: AppColors.cardBgColor,
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomImage(imageSrc: AppIcons.bookings,size: 20),
                        CustomText(text: "06 Nov 2023, 07:30",fontWeight: FontWeight.w500,color: AppColors.primaryOrange,left: 16),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: RowText(field: "Client name :".tr, value: "Jane Cooper"),
                    ),

                    RowText(field: "Services :".tr, value: "Regular Hair Cut, Hair Spa"),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: RowText(field: "Service Type :".tr, value: "Home Service"),
                    ),

                    RowText(field: "Total Amount :".tr, value: "\$ 100"),

                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: RowText(field: "Booking Status :".tr, value: "Cancelled",color: AppColors.red),
                    ),
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
