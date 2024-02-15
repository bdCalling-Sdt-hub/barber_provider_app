import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/view/screens/booking_request/controller/booking_reqcontroller.dart';
import 'package:barbar_provider/view/screens/no_internet/no_internet.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/booking_card/booking_card.dart';
import 'package:barbar_provider/view/widgets/custom_loader/custom_loader.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/error/general_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookingsRequest extends StatelessWidget {
  BookingsRequest({super.key});

  final BookingRequestController bookingReqController =
      Get.find<BookingRequestController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          backgroundColor: AppColors.bgColor,
          extendBody: true,
          appBar: CustomAppBar(
              appBarContent: CustomBack(text: "Booking Request".tr)),
          body: Obx(() {
            switch (bookingReqController.rxRequestStatus.value) {
              case Status.loading:
                return const CustomLoader();
              case Status.internetError:
                return NoInternetScreen(
                  onTap: () {
                    bookingReqController.bookingReq();
                  },
                );
              case Status.error:
                return GeneralErrorScreen(
                  onTap: () {
                    bookingReqController.bookingReq();
                  },
                );

              case Status.completed:
                return bookingReqController.bookingReqModel.isEmpty
                    ? Center(
                        child: CustomText(
                          text: "No booking found",
                          fontSize: 18.sp,
                        ),
                      )
                    : RefreshIndicator(
                        color: AppColors.primaryOrange,
                        onRefresh: () async {
                          bookingReqController.refreshBookingReq();
                        },
                        child: ListView.builder(
                            controller: bookingReqController.scrollController,
                            padding: EdgeInsets.only(
                                top: 24.h, left: 20.w, right: 20.w),
                            itemCount:
                                bookingReqController.bookingReqModel.length,
                            itemBuilder: (context, index) {
                              var userInfo = bookingReqController
                                  .bookingReqModel[index].booking!.user;

                              if (bookingReqController
                                      .isLoadMoreRunning.value ==
                                  false) {
                                return BookingCard(
                                  //============================Navigate Screen========================

                                  onTap: () {
                                    Get.toNamed(AppRoute.bookingRequestDetails,
                                        arguments: bookingReqController
                                            .bookingReqModel[index]);
                                  },
                                  profileImage: userInfo!.image!,
                                  profileName: userInfo.name!,
                                  date: bookingReqController
                                      .bookingReqModel[index].booking!.date!,
                                  catelouges: bookingReqController
                                      .bookingReqModel[index].catalogDetails!,
                                  totalPrice: bookingReqController
                                      .bookingReqModel[index].booking!.price!,
                                  buttonLeft: "Accept".tr,
                                  time: bookingReqController
                                      .bookingReqModel[index].booking!.time!,
                                  buttonRight: "Decline".tr,

                                  //===============================Accept Button===========================

                                  onPressedLeft: () async {
                                    // showDialog(
                                    //   context: context,
                                    //   builder: (context) {
                                    //     return CommonPopUp(
                                    //       title: "Appointment booked".tr,
                                    //       imageSrc: AppIcons.successfulAppointment,
                                    //       subText:
                                    //           "Your booking has been successfully done."
                                    //               .tr,
                                    //       buttonText: "Back to Home".tr,
                                    //       imageType: ImageType.png,
                                    //       onPressed: () =>
                                    //           Get.offAllNamed(AppRoute.navBar),
                                    //     );
                                    //   },
                                    // );

                                    bookingReqController.updateBooking(
                                        bookingID: bookingReqController
                                            .bookingReqModel[index].booking!.id
                                            .toString(),
                                        updateBooking: UpdateBooking.accept);
                                  },

                                  //===============================Decline Button===========================

                                  onPressedRight: () {
                                    // showDialog(
                                    //   context: context,
                                    //   builder: (context) {
                                    //     return CommonPopUp(
                                    //       title: "Slot Unavailable !".tr,
                                    //       imageSrc: AppIcons.slotUnavailable,
                                    //       subText:
                                    //           "Sorry, This slot is already booked. Please try another slot",
                                    //       buttonText: "Try Another Slot".tr,
                                    //       imageType: ImageType.png,
                                    //       onPressed: () => Get.back(),
                                    //     );
                                    //   },
                                    // );

                                    bookingReqController.updateBooking(
                                        bookingID: bookingReqController
                                            .bookingReqModel[index].booking!.id
                                            .toString(),
                                        updateBooking: UpdateBooking.decline);
                                  },
                                );
                              } else {
                                return const CustomLoader();
                              }
                            }),
                      );
            }
          })),
    );
  }
}
