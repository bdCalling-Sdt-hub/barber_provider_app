import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/view/screens/earnings/controller/earning_controller.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/custom_loader/custom_loader.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/error/general_error.dart';
import 'package:barbar_provider/view/widgets/row_text/row_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class EarningsScreen extends StatefulWidget {
  const EarningsScreen({super.key});

  @override
  State<EarningsScreen> createState() => _EarningsScreenState();
}

class _EarningsScreenState extends State<EarningsScreen> {
  final EarningController earningController = Get.find<EarningController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          backgroundColor: AppColors.bgColor,
          extendBody: true,
          appBar: CustomAppBar(
            appBarContent: CustomBack(text: "Earnings".tr, isIcon: false),
          ),
          body: GetBuilder<EarningController>(builder: (controller) {
            return controller.providerAdded.value == false
                ? Center(
                    child: CustomText(
                      text: "No Earnings",
                      fontSize: 18.r,
                    ),
                  )
                : Obx(() {
                    switch (earningController.rxRequestStatus.value) {
                      case Status.loading:
                        return const CustomLoader();
                      case Status.internetError:
                        return const CustomLoader();
                      case Status.error:
                        return GeneralErrorScreen(
                          onTap: () {
                            earningController.weeklyIncome();
                          },
                        );

                      case Status.completed:
                        var weeklyData =
                            earningController.weeklyData.value.original!;
                        return SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 24),
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //=========================Wallet Balance======================

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

                                    //==============Balance============
                                    CustomText(
                                        text:
                                            "\$ ${weeklyData.totalEarning}".tr,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        top: 16,
                                        color: AppColors.primaryOrange),
                                  ],
                                ),
                              ),

                              //==============================Graph Chart=========================

                              Container(
                                width: double.maxFinite,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 24),
                                margin: const EdgeInsets.only(bottom: 24),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColors.cardBgColor),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // CustomText(text: "Sept 1 - Sept 8", fontSize: 12),
                                            CustomText(
                                                text:
                                                    "\$${earningController.weeklyData.value.original!.totalWeekEarning}",
                                                fontSize: 18,
                                                top: 8,
                                                color: AppColors.primaryOrange,
                                                fontWeight: FontWeight.w600),
                                          ],
                                        ),

                                        //==============================DropDown Button==============================

                                        DropdownButton(
                                          hint: CustomText(
                                            text: earningController
                                                .incomeType.value,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          items: const [
                                            DropdownMenuItem(
                                              value: "Weekly",
                                              child: CustomText(
                                                text: "Weekly",
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.black80,
                                              ),
                                            ),
                                            DropdownMenuItem(
                                              value: "Monthly",
                                              child: CustomText(
                                                text: "Monthly",
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.black80,
                                              ),
                                            ),
                                            DropdownMenuItem(
                                              value: "Yearly",
                                              child: CustomText(
                                                text: "Yearly",
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.black80,
                                              ),
                                            ),
                                          ],
                                          onChanged: (value) {
                                            //===========update the income Type===========
                                            earningController.updateIncomeType(
                                                getIncomeType: value!);

                                            //===========Get the income type===========

                                            if (value == "Weekly") {
                                              earningController.weeklyIncome();
                                            } else if (value == "Monthly") {
                                              earningController.monthlyIncome();
                                            } else if (value == "Yearly") {
                                              earningController.yearlyIncome();
                                            }
                                          },
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 12),

                                    //==================================Graph Design==================================

                                    if (earningController
                                        .weekEarningData.isNotEmpty)
                                      SfCartesianChart(
                                        primaryXAxis: const CategoryAxis(),
                                        series: <LineSeries<SalesData, String>>[
                                          LineSeries<SalesData, String>(
                                            dataSource: earningController
                                                .weekEarningData,
                                            xValueMapper:
                                                (SalesData sales, _) =>
                                                    sales.weekday.toString(),
                                            yValueMapper:
                                                (SalesData sales, _) =>
                                                    sales.totalAmount,
                                            dataLabelSettings:
                                                const DataLabelSettings(
                                              isVisible: true,
                                              color: AppColors.white,
                                            ),
                                          ),
                                        ],
                                      )
                                  ],
                                ),
                              ),

                              //=============================================Earning Details=======================================

                              // //============-Total Earnings===============

                              // RowText(
                              //     field: "Total Earnings".tr,
                              //     value: "\$ ${weeklyData}",
                              //     color: AppColors.primaryOrange),
                              // const SizedBox(height: 16),

                              //============-Yearly Earnings===============

                              RowText(
                                  field: "Yearly Earnings".tr,
                                  value: "\$ ${weeklyData.totalYearlyEarning}",
                                  color: AppColors.primaryOrange),
                              const SizedBox(height: 16),

                              //============-Monthly Earnings===============

                              RowText(
                                  field: "Monthly Earnings".tr,
                                  value: "\$ ${weeklyData.totalMonthEarning}",
                                  color: AppColors.primaryOrange),
                              const SizedBox(height: 16),

                              //============-Weekly Earnings===============

                              RowText(
                                  field: "Weekly Earnings".tr,
                                  value: "\$ ${weeklyData.totalWeekEarning}",
                                  color: AppColors.primaryOrange),
                              const SizedBox(height: 16),

                              // //============-Daily Earnings===============

                              // RowText(
                              //     field: "Daily Earnings".tr,
                              //     value: "\$ 500",
                              //     color: AppColors.primaryOrange),
                            ],
                          ),
                        );
                    }
                  });
          })),
    );
  }
}
