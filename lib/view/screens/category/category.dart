import 'package:barbar_provider/helper/network_image.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/view/screens/add_new_service/controllers/category_controller.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/custom_loader/custom_loader.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/custom_textfield/custom_textfield.dart';
import 'package:barbar_provider/view/widgets/error/general_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryController categoryController = Get.put(CategoryController());

    return SafeArea(
      top: true,
      child: Scaffold(
          backgroundColor: AppColors.bgColor,
          extendBody: true,
          appBar: CustomAppBar(
            appBarContent: CustomBack(text: "Select Categorie".tr),
          ),
          body: RefreshIndicator(
            backgroundColor: AppColors.cardBgColor,
            color: AppColors.primaryOrange,
            onRefresh: () async {
              await categoryController.getCategory();
            },
            child: Obx(() {
              switch (categoryController.rxRequestStatus.value) {
                case Status.loading:
                  return const CustomLoader();
                case Status.internetError:
                  return const CustomLoader();
                case Status.error:
                  return GeneralErrorScreen(
                    onTap: () {
                      categoryController.getCategory();
                    },
                  );

                case Status.completed:
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 24),
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //==============================Search Field==============================

                        CustomTextField(
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (value) {
                            if (value.isNotEmpty) {
                              categoryController.getCategory(search: value);
                            }
                          },
                          hintText: "Search".tr,
                          hintColor: AppColors.white,
                          fillColor: AppColors.stroke,
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 24,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),

                        //==============================Cetegorys===================================

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
                            itemCount: categoryController.categoryList.length,
                            itemBuilder: (context, index) {
                              var data = categoryController.categoryList[index];
                              return GestureDetector(
                                onTap: () {
                                  // Get.toNamed(AppRoute.providerDetails,
                                  //     arguments: data.id);
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    //===============================Image======================

                                    CustomNetworkImage(
                                        imageUrl:
                                            "${ApiConstant.baseUrl}${data.categoryImage!}",
                                        height: 85.w,
                                        width: 85.w),

                                    //===============================Name======================

                                    CustomText(
                                        text: data.categoryName ?? "",
                                        fontSize: 14,
                                        top: 8)
                                  ],
                                ),
                              );
                            },
                          ),
                        ),

                        if (categoryController.clearSearch.value == false)
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: IconButton(
                                  onPressed: () {
                                    categoryController.getCategory(search: "");

                                    categoryController.clearSearch.value = true;
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: AppColors.primaryOrange,
                                  )))
                      ],
                    ),
                  );
              }
            }),
          )),
    );
  }
}
