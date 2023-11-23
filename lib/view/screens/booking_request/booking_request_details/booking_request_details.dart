import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_images.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/button/custom_button.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/row_text/row_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingRequestDetails extends StatelessWidget {
  const BookingRequestDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(appBarContent: CustomBack(text: "Booking Request Details".tr)),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 24),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              //Image, Name and call section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        Container(
                          height: 64,width: 64,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: AssetImage(AppImages.profile),fit: BoxFit.fill),
                          ),
                        ),
                        const Flexible(child: CustomText(text: "Jane Cooper",fontSize: 18,fontWeight: FontWeight.w800,left: 16,maxLines: 2,textAlign: TextAlign.start),),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.primaryOrange,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.call,size: 24,color: AppColors.white,),
                  ),
                ],
              ),

              const SizedBox(height: 24),
              //Booking Request Body Details Section
              RowText(field: "Date:".tr, value: "24 Nov 2023"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: RowText(field: "Client name :".tr, value: "Jane Cooper"),
              ),
              RowText(field: "Address :".tr, value: "6391 Elgin St. Celina, Delaware 10299",maxLine: 2),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: RowText(field: "Phone number :".tr, value: "(406) 555-0120"),
              ),

              RowText(field: "Services :".tr, value: "Regular Hair Cut, Hair Spa"),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: RowText(field: "Service Type :".tr, value: "Home Service"),
              ),

              RowText(field: "Service Duration :".tr, value: "45 Minutes"),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: RowText(field: "Total Amount :".tr, value: "\$ 100"),
              ),

              RowText(field: "Received Booking Money :".tr, value: "\$ 15"),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: RowText(field: "Payment Method :".tr, value: "Debit Card"),
              ),

              const SizedBox(height: 28),

              Row(
                children: [
                  Expanded(child: CustomButton(titleText: "Accept".tr, buttonHeight: 44)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomButton(
                      titleText: "Re-Schedule".tr,
                      buttonHeight: 44,
                      buttonColor: AppColors.bgColor,
                      borderColor: AppColors.primaryOrange,
                      onPressed: () => Get.toNamed(AppRoute.bookingReSchedule),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
