import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/helper/network_image.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/view/screens/booking_request/controller/booking_reqcontroller.dart';
import 'package:barbar_provider/view/screens/booking_request/model/booking_req_model.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/button/custom_button.dart';
import 'package:barbar_provider/view/widgets/custom_loader/custom_loader.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/row_text/row_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookingRequestDetails extends StatelessWidget {
  BookingRequestDetails({super.key});

  final Datum bookingReqList = Get.arguments;

  final BookingRequestController bookingRequestController =
      Get.find<BookingRequestController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(
            appBarContent: CustomBack(text: "Booking Request Details".tr)),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          physics: const BouncingScrollPhysics(),
          child: GetBuilder<BookingRequestController>(builder: (controller) {
            return Column(
              children: [
                //Image, Name and call section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          //==========================Image===========================

                          CustomNetworkImage(
                              boxShape: BoxShape.circle,
                              imageUrl:
                                  "${ApiConstant.baseUrl}${bookingReqList.booking!.user!.image}",
                              height: 64.h,
                              width: 64.w),

                          //==========================Name===========================

                          Flexible(
                            child: CustomText(
                                text: bookingReqList.booking!.user!.name!,
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                left: 16,
                                maxLines: 2,
                                textAlign: TextAlign.start),
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   padding: const EdgeInsets.all(10),
                    //   decoration: BoxDecoration(
                    //     color: AppColors.primaryOrange,
                    //     borderRadius: BorderRadius.circular(8),
                    //   ),
                    //   child: const Icon(
                    //     Icons.call,
                    //     size: 24,
                    //     color: AppColors.white,
                    //   ),
                    // ),
                  ],
                ),

                const SizedBox(height: 24),

                //==================================Date===============================

                RowText(
                    field: "Date:".tr, value: bookingReqList.booking!.date!),

                //==================================Time===============================
                const SizedBox(height: 24),
                RowText(
                    field: "Time:".tr, value: bookingReqList.booking!.time!),

                // //==================================Client name===============================

                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 16),
                //   child: RowText(field: "Client name :".tr, value: "Jane Cooper"),
                // ),

                //==================================Address===============================

                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: RowText(
                      field: "Address :".tr,
                      value: bookingReqList.booking!.user!.address!,
                      maxLine: 2),
                ),
                //==================================Phone number===============================

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: RowText(
                      field: "Phone number :".tr,
                      value: bookingReqList.booking!.user!.phoneNumber!),
                ),
                //==================================Catelouge===============================

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
                            bookingReqList.catalogDetails!.length, (index) {
                          return CustomText(
                            maxLines: 100,
                            fontSize: 12.w,
                            fontWeight: FontWeight.w500,
                            right: index % 2 == 0 ? 10.w : 0,
                            text: bookingReqList
                                .catalogDetails![index].catalogName!,
                          );
                        }),
                      ),
                    )
                  ],
                ),
                //==================================Service Type===============================

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: RowText(
                      field: "Service Type :".tr,
                      value: bookingReqList.booking!.serviceType!),
                ),

                //==================================Service Duration===============================

                RowText(
                    field: "Service Duration :".tr,
                    value:
                        "${bookingReqList.booking!.serviceDuration!} Minutes"),

                //==================================Total Amount===============================

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: RowText(
                      field: "Total Amount :".tr,
                      value: "\$ ${bookingReqList.booking!.price!} "),
                ),

                // //==================================Received Booking Money===============================

                // RowText(field: "Received Booking Money :".tr, value: "\$ 15"),

                //==================================Payment Method===============================

                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 16),
                //   child:
                //       RowText(field: "Payment Method :".tr, value: "Debit Card"),
                // ),

                SizedBox(height: 80.h),

                controller.isLoading
                    ? const CustomLoader()
                    : Row(
                        children: [
                          //==============================Accept Button=======================

                          Expanded(
                              child: CustomButton(
                                  onPressed: () async {
                                    bool success =
                                        await bookingRequestController
                                            .updateBooking(
                                                bookingID: bookingReqList
                                                    .booking!.id
                                                    .toString(),
                                                updateBooking:
                                                    UpdateBooking.accept);

                                    if (success == true) {
                                      Get.back();
                                    }
                                  },
                                  titleText: "Accept".tr,
                                  buttonHeight: 44)),
                          const SizedBox(width: 12),

                          //==============================Re-Schedule=========================

                          Expanded(
                            child: CustomButton(
                              titleText: "Re-Schedule".tr,
                              buttonHeight: 44,
                              buttonColor: AppColors.bgColor,
                              borderColor: AppColors.primaryOrange,
                              onPressed: () => Get.toNamed(
                                  AppRoute.bookingReSchedule,
                                  arguments: bookingReqList),
                            ),
                          ),
                        ],
                      ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
