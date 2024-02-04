import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/helper/network_image.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_icons.dart';
import 'package:barbar_provider/view/screens/home/controller/home_controller.dart';
import 'package:barbar_provider/view/screens/home/inner_widgets/custom_drawer.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/image/custom_image.dart';
import 'package:barbar_provider/view/widgets/row_text/row_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        key: scaffoldKey,
        appBar: PreferredSize(
          preferredSize: const Size(double.maxFinite, 80),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                  icon:
                      const Icon(Icons.menu, size: 24, color: AppColors.white),
                ),
                CustomText(
                    text: "Atyose".tr,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoute.notification);
                  },
                  child: Stack(
                    children: [
                      const Align(
                        alignment: Alignment.center,
                        child: CustomImage(
                            imageSrc: AppIcons.notification, size: 24),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 10,
                          width: 10,
                          margin: const EdgeInsets.only(left: 14, bottom: 14),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primaryOrange),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        drawer: const CustomDrawer(),
        body: RefreshIndicator(
          backgroundColor: AppColors.cardBgColor,
          color: AppColors.primaryOrange,
          onRefresh: () async {
            homeController.homeData();
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GetBuilder<HomeController>(builder: (controller) {
              var data = controller.provider[0];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //=================================Banner image=============================

                  CustomNetworkImage(
                      imageUrl:
                          "${ApiConstant.baseUrl}images/${data.coverPhoto}",
                      height: 240.h,
                      width: double.maxFinite),

                  //=================================Business Name=============================
                  CustomText(
                      text: data.businessName!,
                      fontWeight: FontWeight.w600,
                      top: 16,
                      bottom: 12),
                  Row(
                    children: [
                      const Icon(Icons.location_on_rounded,
                          color: AppColors.primaryOrange, size: 16),
                      CustomText(text: data.address!, fontSize: 14, left: 12)
                    ],
                  ),

                  //=================================Description=============================

                  CustomText(
                    text: "Description".tr,
                    fontWeight: FontWeight.w600,
                    top: 24,
                    bottom: 16,
                  ),
                  CustomText(
                    text: data.description!,
                    fontSize: 14,
                    maxLines: 5,
                    textAlign: TextAlign.start,
                  ),

                  //=================================Services=============================

                  if (data.salonDetails!.isNotEmpty)
                    CustomText(
                      text: "Services".tr,
                      fontWeight: FontWeight.w600,
                      top: 24,
                      bottom: 16,
                    ),
                  if (data.salonDetails!.isNotEmpty)
                    SizedBox(
                      height: 130.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: data.salonDetails!.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => Get.toNamed(AppRoute.serviceDetails,
                                arguments:
                                    data.salonDetails![index].id.toString()),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //=================================Services Image=============================

                                CustomNetworkImage(
                                    imageUrl:
                                        "${ApiConstant.baseUrl}images/${data.salonDetails![index].gallaryPhoto![0]}",
                                    height: 90.w,
                                    width: 90.w),

                                //=================================Services Text=============================

                                CustomText(
                                    textAlign: TextAlign.center,
                                    right: 16.w,
                                    text:
                                        data.salonDetails![index].serviceName!)
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                  //=================================Available Service Hours=============================

                  if (data.availableServiceOur!.isNotEmpty)
                    CustomText(
                        text: "Available Service Hours".tr,
                        fontWeight: FontWeight.w600,
                        top: 24,
                        bottom: 16),

                  if (data.availableServiceOur!.isNotEmpty)
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return RowText(
                          field:
                              data.availableServiceOur![index].day.toString(),
                          value:
                              "${data.availableServiceOur![index].startTime} - ${data.availableServiceOur![index].endTime}",
                        );
                      },
                    ),

                  //=================================Gallery=============================

                  if (data.salonDetails!.isNotEmpty)
                    CustomText(
                      text: "Gallery".tr,
                      fontWeight: FontWeight.w600,
                      top: 24,
                      bottom: 16,
                    ),

                  if (data.salonDetails!.isNotEmpty)
                    CustomNetworkImage(
                        imageUrl:
                            "${ApiConstant.baseUrl}images/${data.gallaryPhoto![0]}",
                        height: 90.w,
                        width: 90.w),
                  SizedBox(height: 26.h),

                  //================================waiting for admin approval========================================-

                  data.status == 0
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.error_outline,
                                size: 20.r, color: AppColors.white),
                            CustomText(
                                text:
                                    "Users won’t see the details before admins approval"
                                        .tr,
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                left: 8,
                                fontSize: 12.w,
                                fontWeight: FontWeight.w500),
                          ],
                        )
                      :

                      //=================================Add New Services=============================

                      GestureDetector(
                          onTap: () {
                            //If don't have subscription then this section will show
                            /*showDialog(
                                context: context,
                                builder: (context) {
                                  return const PurchasePopUp();
                                });*/
                            Get.toNamed(AppRoute.addServiceDetails);
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.add_circle_outline,
                                  color: AppColors.primaryOrange, size: 16),
                              CustomText(
                                text: "Add New Services".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                left: 16,
                                color: AppColors.primaryOrange,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                  SizedBox(height: 26.h),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
