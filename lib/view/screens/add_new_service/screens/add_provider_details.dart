import 'package:barbar_provider/helper/time_converter.dart';
import 'package:barbar_provider/utils/api_static_string.dart';
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
  final formKey = GlobalKey<FormState>();

  int catID = Get.arguments;

  @override
  Widget build(BuildContext context) {
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
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //================================Business Name=============================
                  CustomText(text: "Business Name".tr, bottom: 12),
                  CustomTextField(
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return AppStaticStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                    textEditingController: controller.buisnessNameController,
                    hintText: "Enter salon name".tr,
                  ),

                  //================================Address=============================

                  CustomText(text: "Address".tr, top: 16, bottom: 12),
                  CustomTextField(
                      validator: (value) {
                        if (value == null || value.toString().isEmpty) {
                          return AppStaticStrings.fieldCantBeEmpty;
                        }
                        return null;
                      },
                      textEditingController: controller.addressController,
                      hintText: "Enter salon address".tr),

                  //================================Description=============================

                  CustomText(text: "Description".tr, top: 16, bottom: 12),
                  CustomTextField(
                      validator: (value) {
                        if (value == null || value.toString().isEmpty) {
                          return AppStaticStrings.fieldCantBeEmpty;
                        }
                        return null;
                      },
                      textEditingController: controller.descriptionController,
                      hintText: "Enter salon description".tr,
                      maxLines: 6),

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
                              itemCount: serviceHours.length,
                              itemBuilder: (context, index) {
                                var data2 = serviceHours[index];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: Column(
                                        children: [
                                          if (index == 0)
                                            CustomText(
                                                bottom: 16.h, text: "Day"),
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
                                                  serviceHours[index]["start"] =
                                                      time;
                                                });
                                              },
                                              initialTime: serviceHours[index]
                                                  ["start"],
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
                                                  bottom: 16.h,
                                                  text: "End Time"),
                                            SelectTime(
                                              onTimeSelected: (time) {
                                                setState(() {
                                                  serviceHours[index]["end"] =
                                                      time;
                                                });
                                              },
                                              initialTime: serviceHours[index]
                                                  ["end"],
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
                        if (formKey.currentState!.validate()) {
                          controller.getServiceDate(
                              getCatId: catID.toString(), navigateScreen: true);

                          // debugPrint(
                          //     "Date============================${controller.selectedServiceHours}");
                        }
                      }),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
