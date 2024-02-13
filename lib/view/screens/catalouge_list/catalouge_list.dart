import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/helper/network_image.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/view/screens/catalouge_list/controller/catalouge_list_controller.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/button/custom_button.dart';
import 'package:barbar_provider/view/widgets/custom_loader/custom_loader.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/error/general_error.dart';
import 'package:barbar_provider/view/widgets/row_text/row_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CatalougeListScreen extends StatefulWidget {
  const CatalougeListScreen({super.key});

  @override
  State<CatalougeListScreen> createState() => _CatalougeListScreenState();
}

class _CatalougeListScreenState extends State<CatalougeListScreen> {
  int currentIndex = 0;
  String serviceID = Get.arguments;
  CatalougeListController controller = Get.find<CatalougeListController>();
  @override
  void initState() {
    controller.getCatalougeList(serviceID: serviceID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          backgroundColor: AppColors.bgColor,
          extendBody: true,
          appBar: const CustomAppBar(
            appBarContent: CustomBack(text: "Catalouge List"),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(20.r),
            child: CustomButton(
              titleText: "Add new catalouge",
              onPressed: () {
                Get.toNamed(AppRoute.addCatalouge,
                    arguments: int.parse(serviceID));
              },
            ),
          ),
          body: Obx(() {
            switch (controller.rxRequestStatus.value) {
              case Status.loading:
                return const CustomLoader();
              case Status.internetError:
                return const CustomLoader();
              case Status.error:
                return GeneralErrorScreen(onTap: () {
                  controller.getCatalougeList(serviceID: serviceID);
                });
              case Status.completed:
                return ListView.builder(
                  padding: EdgeInsets.only(top: 24.h, left: 20.w, right: 20.w),
                  itemCount: controller.catalougeList.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    var data = controller.catalougeList[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                          Get.toNamed(AppRoute.catalogueDetails,
                              arguments: data);
                        });
                      },
                      child: Container(
                        width: double.maxFinite,
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 1,
                            color: currentIndex == index
                                ? AppColors.primaryOrange
                                : Colors.transparent,
                            style: BorderStyle.solid,
                          ),
                          color: AppColors.cardBgColor,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (data.image!.isNotEmpty)
                              CustomNetworkImage(
                                  imageUrl:
                                      "${ApiConstant.baseUrl}${data.image![0]}",
                                  height: 100.h,
                                  width: 100.w),
                            SizedBox(
                              width: 12.w,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: CustomText(
                                          text: data.catalogName.toString(),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          maxLines: 2,
                                          textAlign: TextAlign.start,
                                          right: 8,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.star,
                                        size: 16,
                                        color: AppColors.primaryOrange,
                                      ),
                                      CustomText(
                                        text: controller.avgrating.toString(),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        maxLines: 2,
                                        textAlign: TextAlign.start,
                                        left: 4,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.watch_later_outlined,
                                        color: AppColors.primaryOrange,
                                        size: 12,
                                      ),
                                      CustomText(
                                        text:
                                            'Duration - ${data.serviceDuration.toString()} minutes',
                                        fontSize: 12,
                                        left: 4,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  RowText(
                                    field: "Salon Service".tr,
                                    value: data.salonServiceCharge.toString(),
                                    color: AppColors.primaryOrange,
                                  ),
                                  const SizedBox(height: 12),
                                  RowText(
                                    field: "Home Service".tr,
                                    value: data.homeServiceCharge.toString(),
                                    color: AppColors.primaryOrange,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
            }
          })),
    );
  }
}
