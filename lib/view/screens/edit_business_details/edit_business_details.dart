import 'dart:io';

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

class EditBusinessDetails extends StatefulWidget {
  const EditBusinessDetails({super.key});

  @override
  State<EditBusinessDetails> createState() => _EditBusinessDetailsState();
}

class _EditBusinessDetailsState extends State<EditBusinessDetails> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(
            appBarContent: CustomBack(text: "Edit Provider Details".tr)),
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

                  //================================Upload Cover Photo==============================

                  CustomText(
                      text: "Upload Cover Photo".tr,
                      bottom: 16,
                      top: 16,
                      fontWeight: FontWeight.w500),
                  GestureDetector(
                    onTap: () {
                      controller.openGallery(isCoverPhoto: true);
                    },
                    child: Container(
                      height: 240.h,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.cardBgColor),
                      child: controller.coverPhoto == null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.camera_alt_outlined,
                                    color: AppColors.primaryOrange, size: 64),
                                CustomText(
                                    text: "Upload Picture".tr,
                                    color: AppColors.primaryOrange,
                                    fontWeight: FontWeight.w500)
                              ],
                            )
                          : Image.file(
                              fit: BoxFit.cover,
                              File(controller.coverPhoto!.path)),
                    ),
                  ),

                  //================================Upload Cover Photo==============================

                  CustomText(
                      text: "Gallery Photo".tr,
                      top: 24,
                      bottom: 16,
                      fontWeight: FontWeight.w500),
                  GestureDetector(
                    onTap: () {
                      controller.openGallery(isCoverPhoto: false);
                    },
                    child: Container(
                      height: 240.h,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.cardBgColor),
                      child: controller.galleryPhoto == null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.camera_alt_outlined,
                                    color: AppColors.primaryOrange, size: 64),
                                CustomText(
                                    text: "Upload Picture".tr,
                                    color: AppColors.primaryOrange,
                                    fontWeight: FontWeight.w500)
                              ],
                            )
                          : Image.file(
                              fit: BoxFit.cover,
                              File(controller.galleryPhoto!.path)),
                    ),
                  ),

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
                              itemCount: controller.days.length,
                              itemBuilder: (context, index) {
                                var data2 = controller.days[index];
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
                                                  controller.days[index]
                                                      ["start"] = time;
                                                });
                                              },
                                              initialTime: controller
                                                  .days[index]["start"],
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
                                                  controller.days[index]
                                                      ["end"] = time;
                                                });
                                              },
                                              initialTime:
                                                  controller.days[index]["end"],
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
                          controller.updateProvider();

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
