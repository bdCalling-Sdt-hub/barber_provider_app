import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_images.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/booking_card/booking_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApprovedBooking extends StatelessWidget {
  const ApprovedBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(
            appBarContent: CustomBack(text: "Approved Bookings".tr)),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // BookingCard(
              //     profileImage: AppImages.profile,
              //     profileName: "Jane Cooper",
              //     date: "24 Nov 2023",
              //     catelouges: "Regular Hair Cut, Hair Spa",
              //     totalPrice: "100",
              //     buttonLeft: "Complete".tr,
              //     buttonRight: "Mark as late".tr)
            ],
          ),
        ),
      ),
    );
  }
}
