import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_icons.dart';
import 'package:barbar_provider/view/screens/notification/inner_widget/notification_card.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(appBarContent: CustomBack(text: "Notification".tr)),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: "Today".tr,fontWeight: FontWeight.w500,bottom: 16),

              const NotificationCard(imageSrc: AppIcons.bookingRequest, title: "You got a new booking request", subText: "You have a new booking request with Jane Cooper at 6 Sep 2023."),

              CustomText(text: "Yesterday".tr,fontWeight: FontWeight.w500,bottom: 16,top: 24),
              const NotificationCard(imageSrc: AppIcons.appointment, title: "Appointment Re-scheduled", subText: "Your appointment has been re-scheduled to 23 Dec 2.00 pm"),

              const SizedBox(height: 16),
              const NotificationCard(imageSrc: AppIcons.specialOffers, title: "Today’s Special Offers", subText: "Customer’s  will get a special promo today."),

              CustomText(text: "16 April 2023".tr,fontWeight: FontWeight.w500,bottom: 16,top: 24),
              const NotificationCard(imageSrc: AppIcons.setup, title: "Account Setup Successful", subText: "You have successfully created your account."),
            ],
          ),
        ),
      ),
    );
  }
}
