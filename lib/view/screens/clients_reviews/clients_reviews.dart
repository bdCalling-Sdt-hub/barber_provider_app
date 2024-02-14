import 'package:barbar_provider/helper/network_image.dart';
import 'package:barbar_provider/helper/time_converter.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/view/screens/clients_reviews/controller/client_review_controller.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/custom_loader/custom_loader.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/error/general_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ClientsReviews extends StatelessWidget {
  ClientsReviews({super.key});

  final ClientReviewController clientReviewController =
      Get.find<ClientReviewController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          backgroundColor: AppColors.bgColor,
          extendBody: true,
          appBar: CustomAppBar(
              appBarContent: CustomBack(text: "Client Reviews".tr)),
          body: Obx(() {
            switch (clientReviewController.rxRequestStatus.value) {
              case Status.loading:
                return const CustomLoader();
              case Status.internetError:
                return const CustomLoader();
              case Status.error:
                return GeneralErrorScreen(
                  onTap: () {
                    clientReviewController.review();
                  },
                );

              case Status.completed:
                return clientReviewController.rattingList.isEmpty
                    ? Center(
                        child: CustomText(
                        fontSize: 24.sp,
                        text: "No review yet",
                      ))
                    : Padding(
                        padding:
                            EdgeInsets.only(top: 24.h, left: 20, right: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //=================================Review Box with ratting and total review========================

                            Container(
                              width: double.maxFinite,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 12),
                              decoration: BoxDecoration(
                                  color: AppColors.cardBgColor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //==========================ratting Design====================
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List.generate(5, (index) {
                                      return Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CustomText(
                                              text: clientReviewController
                                                  .rattingDesign[index]
                                                      ["ratting"]
                                                  .toString(),
                                              fontSize: 14,
                                              right: 4),
                                          const Icon(Icons.star,
                                              color: AppColors.primaryOrange,
                                              size: 16),
                                          Container(
                                            height: 6,
                                            width: clientReviewController
                                                .rattingDesign[index]["height"],
                                            margin:
                                                const EdgeInsets.only(left: 4),
                                            decoration: BoxDecoration(
                                                color: AppColors.primaryOrange,
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                          ),
                                        ],
                                      );
                                    }),
                                  ),
                                  const SizedBox(height: 24),

                                  //=========================Total Ratting and review===========================
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      //===============Total Review=============

                                      CustomText(
                                          text: clientReviewController
                                              .averageRating,
                                          fontSize: 36,
                                          fontWeight: FontWeight.w700,
                                          bottom: 8),
                                      SizedBox(
                                        height: 20,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: 5,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return const Icon(Icons.star,
                                                color: AppColors.primaryOrange,
                                                size: 16);
                                          },
                                        ),
                                      ),

                                      //===============Average Review=============

                                      CustomText(
                                          text:
                                              "${clientReviewController.totalReview} Reviews",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          top: 8),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),

                            //===============================User review Design==========================-

                            Expanded(
                                child: ListView.builder(
                              controller:
                                  clientReviewController.scrollController,
                              itemCount:
                                  clientReviewController.rattingList.length,
                              itemBuilder: (context, index) {
                                var data =
                                    clientReviewController.rattingList[index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          //=======================user image==================

                                          CustomNetworkImage(
                                              boxShape: BoxShape.circle,
                                              imageUrl:
                                                  "${ApiConstant.baseUrl}${data.user!.image}",
                                              height: 38,
                                              width: 38),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              //=======================user name==================

                                              CustomText(
                                                text: data.user!.name!,
                                                fontWeight: FontWeight.w600,
                                                bottom: 4,
                                              ),

                                              //=======================user Ratting==================

                                              Row(
                                                children: [
                                                  SizedBox(
                                                    height: 16,
                                                    child: ListView.builder(
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount: data.rating,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return const Icon(
                                                            Icons.star,
                                                            color: AppColors
                                                                .primaryOrange,
                                                            size: 16);
                                                      },
                                                    ),
                                                  ),

                                                  //=======================Comment Time==================

                                                  CustomText(
                                                      text: dateMonthYear(
                                                          data.createdAt!),
                                                      fontSize: 12,
                                                      left: 4),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),

                                      //=======================Comment Description==================

                                      CustomText(
                                        text: data.review!,
                                        fontSize: 14,
                                        textAlign: TextAlign.start,
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                        top: 12,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ))
                          ],
                        ),
                      );
            }
          })),
    );
  }
}
