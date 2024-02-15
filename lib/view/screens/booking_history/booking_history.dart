import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/utils/app_icons.dart';
import 'package:barbar_provider/view/screens/booking_history/controller/booking_history_controller.dart';
import 'package:barbar_provider/view/screens/no_internet/no_internet.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/custom_loader/custom_loader.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/error/general_error.dart';
import 'package:barbar_provider/view/widgets/image/custom_image.dart';
import 'package:barbar_provider/view/widgets/row_text/row_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookingHistory extends StatelessWidget with GetxServiceMixin {
  BookingHistory({super.key});

  final BookingHistoryController bookingHistoryController =
      Get.find<BookingHistoryController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          extendBody: true,
          backgroundColor: AppColors.bgColor,
          appBar: CustomAppBar(
              appBarContent: CustomBack(text: "Booking History".tr)),
          body: Obx(() {
            switch (bookingHistoryController.rxRequestStatus.value) {
              case Status.loading:
                return const CustomLoader();
              case Status.internetError:
                return NoInternetScreen(
                  onTap: () {
                    bookingHistoryController.bookingHistory();
                  },
                );
              case Status.error:
                return GeneralErrorScreen(
                  onTap: () {
                    bookingHistoryController.bookingHistory();
                  },
                );

              case Status.completed:
                return bookingHistoryController.bookingHistoryModel.isEmpty
                    ? Center(
                        child: CustomText(
                          text: "No booking history found",
                          fontSize: 18.sp,
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: () async {
                          bookingHistoryController.refreshBookingHistory();
                        },
                        child: ListView.builder(
                          controller: bookingHistoryController.scrollController,
                          padding:
                              EdgeInsets.only(top: 24.h, left: 20, right: 20),
                          itemCount: bookingHistoryController
                              .bookingHistoryModel.length,
                          itemBuilder: (context, index) {
                            var bookInfo = bookingHistoryController
                                .bookingHistoryModel[index].booking;

                            var catalogDetails = bookingHistoryController
                                .bookingHistoryModel[index].catalogDetails!;

                            if (bookingHistoryController
                                    .isLoadMoreRunning.value ==
                                false) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                padding: const EdgeInsets.all(16),
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    color: AppColors.cardBgColor,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //=================================Calender Icon and Date==================================
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        //===========Calender Icon========
                                        const CustomImage(
                                            imageSrc: AppIcons.bookings,
                                            size: 20),

                                        //==============Date===========

                                        CustomText(
                                            text:
                                                "${bookInfo!.date}, ${bookInfo.time}",
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.primaryOrange,
                                            left: 16),
                                      ],
                                    ),

                                    //======================================Client name=========================================

                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      child: RowText(
                                          field: "Client name :".tr,
                                          value:
                                              bookInfo.user!.name.toString()),
                                    ),

                                    // //======================================Catelouges=========================================

                                    Row(
                                      children: [
                                        const CustomText(
                                          fontSize: 14,
                                          text: "Catelouge :",
                                        ),
                                        const Expanded(child: SizedBox()),
                                        Expanded(
                                          child: Wrap(
                                            alignment: WrapAlignment.end,
                                            children: List.generate(
                                                catalogDetails.length, (index) {
                                              return CustomText(
                                                maxLines: 100,
                                                fontSize: 12.w,
                                                fontWeight: FontWeight.w500,
                                                right: 0,
                                                text:
                                                    "${catalogDetails[index].catalogName!} ",
                                              );
                                            }),
                                          ),
                                        )
                                      ],
                                    ),

                                    //======================================Service Type=========================================

                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      child: RowText(
                                          field: "Service Type :".tr,
                                          value:
                                              bookInfo.serviceType.toString()),
                                    ),

                                    //=================================Total Amount==================================

                                    RowText(
                                        field: "Total Amount :".tr,
                                        value: "${bookInfo.price} \$"),

                                    //=================================Booking Status ==================================

                                    Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: RowText(
                                          field: "Booking Status :".tr,
                                          value: bookingHistoryController
                                              .bookingStatus(
                                                  bookingStatus:
                                                      bookInfo.status!),
                                          color: AppColors.green),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return const CustomLoader();
                            }
                          },
                        ),
                      );
            }
          })),
    );
  }
}
