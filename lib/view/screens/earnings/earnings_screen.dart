import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/row_text/row_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EarningsScreen extends StatefulWidget {
  const EarningsScreen({super.key});

  @override
  State<EarningsScreen> createState() => _EarningsScreenState();
}

class _EarningsScreenState extends State<EarningsScreen> {
  @override
  Widget build(BuildContext context) {

    List<dynamic> data = [
      {
        "size" : 100.0,
        "title" : "Sun",
      },
      {
        "size" : 110.0,
        "title" : "Mon",
      },
      {
        "size" : 150.0,
        "title" : "Tue",
      },
      {
        "size" : 140.0,
        "title" : "Wed",
      },
      {
        "size" : 115.0,
        "title" : "Thu",
      },
      {
        "size" : 70.0,
        "title" : "Fri",
      },
      {
        "size" : 120.0,
        "title" : "Sat",
      },
    ];

    int selectedIndex = 2;

    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(
          appBarContent: CustomBack(text: "Earnings".tr, isIcon: false),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.cardBgColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                        text: "Wallet Balance".tr,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                    CustomText(
                        text: "\$ 500.90".tr,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        top: 16,
                        color: AppColors.primaryOrange),
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                margin: const EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.cardBgColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(text: "Sept 1 - Sept 8", fontSize: 12),
                            CustomText(
                                text: "\$ 1959",
                                fontSize: 18,
                                top: 8,
                                color: AppColors.primaryOrange,
                                fontWeight: FontWeight.w600),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.white),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                  text: "Weekly".tr,
                                  fontSize: 12,
                                  color: AppColors.black80,
                                  right: 8),
                              const Icon(Icons.keyboard_arrow_down_sharp, size: 24, color: AppColors.black80)
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        itemCount: data.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex == index;
                                });
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [

                                  Container(
                                    height: data[index]["size"],width: 30,
                                    margin: const EdgeInsets.only(top: 8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: selectedIndex == index ? AppColors.primaryOrange : AppColors.primaryLightOrange
                                    ),
                                  ),
                                  CustomText(text: "${data[index]["title"]}",fontSize: 10,top: 12,fontWeight: selectedIndex== index ? FontWeight.w600 : FontWeight.w400)
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              RowText(field: "Total Earnings".tr, value: "\$ 5500",color: AppColors.primaryOrange),
              const SizedBox(height: 16),
              RowText(field: "Yearly Earnings".tr, value: "\$ 5500",color: AppColors.primaryOrange),
              const SizedBox(height: 16),
              RowText(field: "Monthly Earnings".tr, value: "\$ 1500",color: AppColors.primaryOrange),
              const SizedBox(height: 16),
              RowText(field: "Weekly Earnings".tr, value: "\$ 500",color: AppColors.primaryOrange),
              const SizedBox(height: 16),
              RowText(field: "Daily Earnings".tr, value: "\$ 500",color: AppColors.primaryOrange),
            ],
          ),
        ),
      ),
    );
  }
}
