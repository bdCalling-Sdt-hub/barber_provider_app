import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/view/screens/catalouge_list/model/catalouge_list_model.dart';

import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/row_text/row_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CatalougeDetails extends StatefulWidget {
  const CatalougeDetails({super.key});

  @override
  State<CatalougeDetails> createState() => _CatalougeDetailsState();
}

class _CatalougeDetailsState extends State<CatalougeDetails> {
  Provider data = Provider();

  @override
  void initState() {
    data = Get.arguments;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          backgroundColor: AppColors.bgColor,
          extendBody: true,

          //==================================Edit Button==================================

          appBar: CustomAppBar(
              appBarContent: CustomBack(
                  text: "Catalouge Details".tr,
                  isEdit: true,
                  onPressed: () {
                    Get.toNamed(AppRoute.editCatalouge, arguments: data);
                  })),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //==========================================Cover Image=================================

                Container(
                  height: 240.h,
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "${ApiConstant.baseUrl}${data.image![0]}"))),
                ),

                //==========================================Service Name=================================

                CustomText(
                    text: data.catalogName!, fontWeight: FontWeight.w600),
                const SizedBox(height: 12),

                //==========================================Duration=================================

                Row(
                  children: [
                    const Icon(Icons.timer_outlined,
                        size: 16, color: AppColors.primaryOrange),
                    CustomText(
                        text: "Duration - ${data.serviceDuration} Minutes",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        left: 12)
                  ],
                ),
                const SizedBox(height: 12),

                // //==========================================Location=================================

                // Row(
                //   children: [
                //     const Icon(Icons.star,
                //         size: 16, color: AppColors.primaryOrange),
                //     CustomText(
                //         text:
                //             "${homeController.serviceDetailsModel.rating} (${homeController.serviceDetailsModel.review})",
                //         fontSize: 14,
                //         fontWeight: FontWeight.w600,
                //         left: 12)
                //   ],
                // ),

                //==========================================Description=================================

                const CustomText(
                    text: "Description",
                    fontWeight: FontWeight.w600,
                    top: 24,
                    bottom: 16),
                CustomText(
                  text: data.catalogDescription!,
                  maxLines: 5,
                  textAlign: TextAlign.start,
                  fontSize: 14,
                  color: AppColors.paragraph,
                  overflow: TextOverflow.ellipsis,
                ),

                //================================Gallery Image============================

                CustomText(
                  text: "Gallery".tr,
                  fontWeight: FontWeight.w600,
                  top: 24,
                  bottom: 16,
                ),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.image!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 80,
                        width: 80,
                        margin: const EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "${ApiConstant.baseUrl}${data.image![0]}"))),
                      );
                    },
                  ),
                ),
                CustomText(
                    text: "Service Hours".tr,
                    fontWeight: FontWeight.w600,
                    top: 24,
                    bottom: 16),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.serviceHour!.length,
                  itemBuilder: (context, index) {
                    return RowText(
                      field: data.serviceHour![index].day.toString(),
                      value:
                          "${data.serviceHour![index].startTime} - ${data.serviceHour![index].endTime}",
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }
}