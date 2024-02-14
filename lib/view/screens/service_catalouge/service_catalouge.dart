import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/helper/network_image.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/view/screens/service_catalouge/controller/service_catalouge_controller.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/custom_loader/custom_loader.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/error/general_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ServiceCatalogue extends StatelessWidget {
  const ServiceCatalogue({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceCatalougeController serviceCatalougeController =
        Get.put(ServiceCatalougeController());

    return SafeArea(
      top: true,
      child: Scaffold(
          backgroundColor: AppColors.bgColor,
          extendBody: true,
          appBar: const CustomAppBar(
            appBarContent: CustomBack(text: "Service & Catalogue "),
          ),
          body: RefreshIndicator(
            backgroundColor: AppColors.cardBgColor,
            color: AppColors.primaryOrange,
            onRefresh: () async {
              await serviceCatalougeController.getServiceList();
            },
            child: Obx(() {
              switch (serviceCatalougeController.rxRequestStatus.value) {
                case Status.loading:
                  return const CustomLoader();
                case Status.internetError:
                  return const CustomLoader();
                case Status.error:
                  return GeneralErrorScreen(
                    onTap: () {
                      serviceCatalougeController.getServiceList();
                    },
                  );

                case Status.completed:
                  return SingleChildScrollView(
                    padding: EdgeInsets.only(top: 24.h),
                    physics: const ClampingScrollPhysics(),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 24,
                              mainAxisExtent: 120),
                      itemCount: serviceCatalougeController.serviceList.length,
                      itemBuilder: (context, index) {
                        var data =
                            serviceCatalougeController.serviceList[index];
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoute.catalogueList,
                                arguments: data.id.toString());
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //===============================Image======================

                              CustomNetworkImage(
                                  imageUrl:
                                      "${ApiConstant.baseUrl}images/${data.gallaryPhoto![0]}",
                                  height: 85.w,
                                  width: 85.w),

                              //===============================Name======================

                              CustomText(
                                  text: data.serviceName ?? "",
                                  fontSize: 14,
                                  top: 8)
                            ],
                          ),
                        );
                      },
                    ),
                  );
              }
            }),
          )),
    );
  }
}
