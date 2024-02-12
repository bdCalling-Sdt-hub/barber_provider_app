import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/view/screens/bookings/controller/booking_controller.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/custom_loader/custom_loader.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/error/general_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookingsScreen extends StatelessWidget {
  BookingsScreen({super.key});

  final BookingsController bookingsController = Get.find<BookingsController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(
            appBarContent: CustomBack(text: "Bookings".tr, isIcon: false)),
        body: bookingsController.bookingsModel.isEmpty
            ? const Center(
                child: CustomText(
                  text: "No Bookings Found",
                ),
              )
            : Padding(
                padding: EdgeInsets.only(top: 24.h, left: 20.w, right: 20.r),
                child: Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(top: 24),
                      decoration: const BoxDecoration(
                          color: AppColors.primaryOrange,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              topLeft: Radius.circular(8))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                              text: "Client".tr,
                              fontSize: 10,
                              fontWeight: FontWeight.w600),
                          CustomText(
                              text: "Catelouge".tr,
                              fontSize: 10,
                              fontWeight: FontWeight.w600),
                          CustomText(
                              text: "Date & Time".tr,
                              fontSize: 10,
                              fontWeight: FontWeight.w600),
                        ],
                      ),
                    ),
                    Obx(() {
                      switch (bookingsController.rxRequestStatus.value) {
                        case Status.loading:
                          return const CustomLoader();
                        case Status.internetError:
                          return const CustomLoader();
                        case Status.error:
                          return GeneralErrorScreen(
                            onTap: () {
                              bookingsController.bookings();
                            },
                          );

                        case Status.completed:
                          return Expanded(
                              child: ListView.builder(
                            itemCount: bookingsController.bookingsModel.length,
                            itemBuilder: (context, index) {
                              var bookInfo = bookingsController
                                  .bookingsModel[index].booking;

                              var catelouge = bookingsController
                                  .bookingsModel[index].catalogDetails;
                              return Container(
                                width: double.maxFinite,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.stroke,
                                        width: 1,
                                        style: BorderStyle.solid),
                                    color: AppColors.cardBgColor),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CustomText(
                                        text: bookInfo!.user!.name!,
                                        fontSize: 10),
                                    Wrap(
                                      alignment: WrapAlignment.end,
                                      children: List.generate(catelouge!.length,
                                          (index) {
                                        return CustomText(
                                          maxLines: 100,
                                          fontSize: 10,
                                          right: 0,
                                          text:
                                              "${catelouge[index].catalogName!} ",
                                        );
                                      }),
                                    ),
                                    Flexible(
                                        child: CustomText(
                                            text: bookInfo.date!,
                                            fontSize: 10,
                                            maxLines: 2,
                                            textAlign: TextAlign.right,
                                            overflow: TextOverflow.ellipsis)),
                                  ],
                                ),
                              );
                            },
                          ));
                      }
                    })
                  ],
                ),
              ),
      ),
    );
  }
}
