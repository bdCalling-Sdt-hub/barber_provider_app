import 'package:barbar_provider/helper/date_converter.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/utils/app_icons.dart';
import 'package:barbar_provider/view/screens/notification/controller/notification_controller.dart';
import 'package:barbar_provider/view/screens/notification/inner_widget/notification_card.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/custom_loader/custom_loader.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/error/general_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final NotificationController notificationController =
      Get.find<NotificationController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          backgroundColor: AppColors.bgColor,
          extendBody: true,
          appBar:
              CustomAppBar(appBarContent: CustomBack(text: "Notification".tr)),
          body: Obx(() {
            var data =
                notificationController.notificationModel.value.notifications;
            switch (notificationController.rxRequestStatus.value) {
              case Status.loading:
                return const CustomLoader();
              case Status.internetError:
                return const CustomLoader();
              case Status.error:
                return GeneralErrorScreen(
                  onTap: () {
                    notificationController.getNotifications();
                  },
                );

              case Status.completed:
                return data!.isEmpty
                    ? const Center(
                        child: CustomText(
                          text: "No Notifications",
                        ),
                      )
                    : ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          // Check if it's the first item or if the date has changed
                          bool isFirstItem = index == 0;
                          bool isNewDate = !isFirstItem &&
                              DateConverter.formatValidityDate(
                                      data[index].data!.user!.createdAt!) !=
                                  DateConverter.formatValidityDate(
                                      data[index - 1].data!.user!.createdAt!);

                          // Display the date only if it's the first item or the date has changed
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (isFirstItem || isNewDate)
                                CustomText(
                                  text: DateConverter.formatValidityDate(
                                      data[index].data!.user!.createdAt!),
                                  fontWeight: FontWeight.w500,
                                  bottom: 16.h,
                                ),
                              NotificationCard(
                                imageSrc: AppIcons.bookingRequest,
                                title: data[index].data!.message!,
                                subText:
                                    "You have a new booking request with Jane Cooper at 6 Sep 2023.",
                              ),
                            ],
                          );
                        },
                      );
            }
          })),
    );
  }
}
