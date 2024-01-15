import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/view/screens/add_new_service/controllers/add_provider_controller.dart';
import 'package:barbar_provider/view/screens/edit_business_details/inner_widget/select_time.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/button/custom_button.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/custom_textfield/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddProviderDetails extends StatefulWidget {
  const AddProviderDetails({super.key});

  @override
  State<AddProviderDetails> createState() => _AddProviderDetailsState();
}

class _AddProviderDetailsState extends State<AddProviderDetails> {
  List<Map<String, dynamic>> days = [
    {"day": "Sun", "start": TimeOfDay.now(), "end": TimeOfDay.now()},
    {"day": "Mon", "start": TimeOfDay.now(), "end": TimeOfDay.now()},
    {"day": "Tue", "start": TimeOfDay.now(), "end": TimeOfDay.now()},
    {"day": "Wed", "start": TimeOfDay.now(), "end": TimeOfDay.now()},
    {"day": "Thu", "start": TimeOfDay.now(), "end": TimeOfDay.now()},
    {"day": "Fri", "start": TimeOfDay.now(), "end": TimeOfDay.now()},
    {"day": "Sat", "start": TimeOfDay.now(), "end": TimeOfDay.now()},
  ];

  // List<Map<String, dynamic>> selectedServiceHours = [];

  @override
  Widget build(BuildContext context) {
    // List<String> days = [
    //   "Sun",
    //   "Mon",
    //   "Tue",
    //   "Wed",
    //   "Thu",
    //   "Fri",
    //   "Thu",
    //   "Thu",
    // ];
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(
            appBarContent: CustomBack(text: "Add Provider Details".tr)),
        body: GetBuilder<AddProviderController>(builder: (controller) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //================================Business Name=============================
                CustomText(text: "Business Name".tr, bottom: 12),
                CustomTextField(
                  hintText: "Enter salon name".tr,
                ),

                //================================Address=============================

                CustomText(text: "Address".tr, top: 16, bottom: 12),
                CustomTextField(hintText: "Enter salon address".tr),

                //================================Description=============================

                CustomText(text: "Description".tr, top: 16, bottom: 12),
                CustomTextField(
                    hintText: "Enter salon description".tr, maxLines: 6),

                //================================Available Service Hours=============================

                CustomText(
                    text: "Available Service Hours".tr, top: 16, bottom: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: days.length,
                            itemBuilder: (context, index) {
                              var data2 = days[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Column(
                                      children: [
                                        if (index == 0)
                                          CustomText(bottom: 16.h, text: "Day"),
                                        CustomText(text: data2["day"])
                                      ],
                                    )),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        children: [
                                          if (index == 0)
                                            CustomText(
                                                bottom: 16.h,
                                                text: "Start Time"),
                                          SelectTime(
                                            onTimeSelected: (time) {
                                              setState(() {
                                                days[index]["start"] = time;
                                              });
                                            },
                                            initialTime: days[index]["start"],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        children: [
                                          if (index == 0)
                                            CustomText(
                                                bottom: 16.h, text: "End Time"),
                                          SelectTime(
                                            onTimeSelected: (time) {
                                              setState(() {
                                                days[index]["end"] = time;
                                              });
                                            },
                                            initialTime: days[index]["end"],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 44),

                //================================Continue Button=============================

                CustomButton(
                    titleText: "Continue".tr,
                    onPressed: () {
                      Get.toNamed(AppRoute.addPhotos);
                      for (var data in days) {
                        controller.selectedServiceHours.add({
                          "Day": data["day"],
                          "Start Time": data["start"],
                          "End Time": data["end"]
                        });
                      }

                      print(controller.selectedServiceHours);
                    }),
                const SizedBox(height: 24),
              ],
            ),
          );
        }),
      ),
    );
  }
}
