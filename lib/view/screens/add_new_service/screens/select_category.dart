import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/utils/app_icons.dart';
import 'package:barbar_provider/utils/app_images.dart';
import 'package:barbar_provider/view/screens/add_new_service/controller/add_service_controller.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/custom_loader/custom_loader.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/error/general_error.dart';
import 'package:barbar_provider/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectCategory extends StatelessWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context) {
    // List<String> category = [
    //   "Spa",
    //   "Nails",
    //   "Barber",
    //   "Salon",
    //   "Women’s",
    //   "Men’s",
    //   "Massage",
    //   "Piercing",
    //   "Skin care",
    //   "Hair Care",
    //   "Makeover",
    //   "Facial"
    // ];

    AddNewServiceController addNewServiceController =
        Get.put(AddNewServiceController());

    return SafeArea(
      top: true,
      child: Scaffold(
          backgroundColor: AppColors.bgColor,
          extendBody: true,
          appBar: CustomAppBar(
            appBarContent: CustomBack(text: "Select Categorie".tr),
          ),
          body: Obx(() {
            switch (addNewServiceController.rxRequestStatus.value) {
              case Status.loading:
                return const CustomLoader();
              case Status.internetError:
                return const CustomLoader();
              case Status.error:
                return GeneralErrorScreen(
                  onTap: () {
                    addNewServiceController.categoryModel();
                  },
                );

              case Status.completed:
                return SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //==============================Search Field==============================
                      Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(bottom: 24),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.cardBgColor,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  const Icon(Icons.search,
                                      size: 18, color: AppColors.paragraph),
                                  CustomText(
                                      text: "Search".tr,
                                      color: AppColors.paragraph,
                                      fontSize: 14,
                                      left: 12),
                                ],
                              ),
                            ),
                            const CustomImage(
                              imageSrc: AppIcons.filter,
                              size: 18,
                              imageColor: AppColors.paragraph,
                            ),
                          ],
                        ),
                      ),

                      //==============================Cetegorys==============================
                      SingleChildScrollView(
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
                          itemCount: addNewServiceController
                              .categoryModel.value.categoryImage!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoute.providerDetails);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: const CustomImage(
                                        imageSrc: AppImages.service,
                                        imageType: ImageType.png,
                                        size: 85,
                                        fit: BoxFit.fill),
                                  ),
                                  CustomText(
                                      text: addNewServiceController
                                              .categoryModel
                                              .value
                                              .categoryName ??
                                          "",
                                      fontSize: 14,
                                      top: 8)
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
            }
          })),
    );
  }
}