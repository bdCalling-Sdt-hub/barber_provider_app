import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/view/screens/subscription_plan/inner_widget/payment_method.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/button/custom_button.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/subsription_plan/subsription_plan_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscriptionPlan extends StatefulWidget {
  const SubscriptionPlan({super.key});

  @override
  State<SubscriptionPlan> createState() => _SubscriptionPlanState();
}

class _SubscriptionPlanState extends State<SubscriptionPlan> {
  final List<dynamic> packages = [
    {"months": "3", "price": "200", "title": "Gold"},
    {"months": "6", "price": "400", "title": "Diamond"},
    {"months": "12", "price": "600", "title": "Platinum"}
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(appBarContent: CustomBack(text: "Subscription plans".tr)),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: CustomText(
                      text: "Packages".tr,
                      bottom: 16,
                      fontWeight: FontWeight.w500)),
              CarouselSlider.builder(
                itemCount: packages.length,
                itemBuilder: (context, index, realIndex) {
                  return SubscriptionPlanCard(
                    color: AppColors.cardBgColor,
                    months: packages[index]["months"],
                    price: packages[index]["price"],
                    buttonText: "Purchase Now",
                    title: packages[index]["title"],
                  );
                },
                options: CarouselOptions(
                    autoPlay: true,
                    height: 420,
                    autoPlayCurve: Curves.easeInOut,
                    viewportFraction: 1,
                    enlargeCenterPage: true),
              ),
              CustomText(text: "Choose your payment method".tr, top: 44, bottom: 16),
              const PaymentMethod(),
              const SizedBox(height: 24),
              CustomButton(
                titleText: "Proceed to Payment".tr,
                onPressed: () {
                  Get.toNamed(AppRoute.makePayment);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
