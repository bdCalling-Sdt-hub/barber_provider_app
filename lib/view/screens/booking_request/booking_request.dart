import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_icons.dart';
import 'package:barbar_provider/utils/app_images.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/booking_card/booking_card.dart';
import 'package:barbar_provider/view/widgets/common_popup/common_popup.dart';
import 'package:barbar_provider/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingsRequest extends StatelessWidget {
  const BookingsRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(appBarContent: CustomBack(text: "Booking Request".tr)),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              BookingCard(
                onTap: () {
                  Get.toNamed(AppRoute.bookingRequestDetails);
                },
                profileImage: AppImages.profile,
                profileName: "Jane Cooper",
                value1: "24 Nov 2023",
                value2: "Regular Hair Cut, Hair Spa",
                value3: "100",
                buttonLeft: "Accept".tr,
                buttonRight: "Decline".tr,
                onPressedLeft: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CommonPopUp(
                        title: "Appointment booked".tr,
                        imageSrc: AppIcons.successfulAppointment,
                        subText: "Your booking has been successfully done.".tr,
                        buttonText: "Back to Home".tr,
                        imageType: ImageType.png,
                        onPressed: () => Get.offAllNamed(AppRoute.navBar),
                      );
                    },
                  );
                },
                onPressedRight: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CommonPopUp(
                          title: "Slot Unavailable !".tr,
                          imageSrc: AppIcons.slotUnavailable,
                          subText: "Sorry, This slot is already booked. Please try another slot",
                          buttonText: "Try Another Slot".tr,
                          imageType: ImageType.png,
                        onPressed: () => Get.back(),
                      );
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
