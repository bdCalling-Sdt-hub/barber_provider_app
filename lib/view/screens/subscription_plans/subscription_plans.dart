import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/view/screens/subscription_plans/controller/subscription_controller.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/custom_loader/custom_loader.dart';
import 'package:barbar_provider/view/widgets/error/general_error.dart';
import 'package:barbar_provider/view/widgets/subsription_plan/subsription_plan_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SubscriptionPlans extends StatelessWidget {
  SubscriptionPlans({super.key});
  // final List<dynamic> packages = [
  //   {"months": "3", "price": "200", "title": "Gold"},
  //   {"months": "6", "price": "400", "title": "Diamond"},
  //   {"months": "12", "price": "600", "title": "Platinum"}
  // ];

  final SubscriptionController subscriptionController =
      Get.find<SubscriptionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          appBarContent: CustomBack(text: "Subscription plans".tr)),
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Obx(() {
          switch (subscriptionController.rxRequestStatus.value) {
            case Status.loading:
              return const CustomLoader();
            case Status.internetError:
              return const CustomLoader();
            case Status.error:
              return GeneralErrorScreen(
                onTap: () {
                  subscriptionController.showPackages();
                },
              );

            case Status.completed:
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CarouselSlider.builder(
                    itemCount: subscriptionController
                        .packageListModel.value.data!.length,
                    itemBuilder: (context, index, realIndex) {
                      var data = subscriptionController
                          .packageListModel.value.data![index];

                      //===================================Custom Package Design===========================

                      return Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: SubscriptionPlanCard(
                          packageFeatures: data.packageFeatures!,
                          ontap: () {
                            Get.toNamed(AppRoute.makePayments, arguments: data);
                          },
                          color: AppColors.cardBgColor,
                          months: data.packageDuration!,
                          price: data.price.toString(),
                          buttonText: "Purchase Now",
                          title: data.packageName!,
                        ),
                      );
                    },
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        subscriptionController.updateCurrentIndex(value: index);
                      },
                      autoPlay: false,
                      height: 420,
                      autoPlayCurve: Curves.easeInOut,
                      viewportFraction: 0.8,
                    ),
                  ),
                  SizedBox(
                    height: 36.h,
                  ),

                  //=======================================DotsIndicator================================

                  if (subscriptionController
                      .packageListModel.value.data!.isNotEmpty)
                    DotsIndicator(
                      decorator: DotsDecorator(
                          activeColor: AppColors.primaryOrange,
                          size: Size.square(16.r),
                          activeSize: Size.square(16.r)),
                      dotsCount: subscriptionController
                          .packageListModel.value.data!.length,
                      position: subscriptionController.currentIndex.value,
                    )
                ],
              );
          }
        }),
      ),
    );
  }
}
