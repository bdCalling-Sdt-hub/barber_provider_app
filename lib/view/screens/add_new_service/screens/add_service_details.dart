import 'package:barbar_provider/utils/api_static_string.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/view/screens/add_new_service/controllers/add_service_controller.dart';
import 'package:barbar_provider/view/screens/edit_business_details/inner_widget/select_time.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/button/custom_button.dart';
import 'package:barbar_provider/view/widgets/custom_loader/custom_loader.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/custom_textfield/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddServiceDetails extends StatefulWidget {
  const AddServiceDetails({super.key});

  @override
  State<AddServiceDetails> createState() => _AddServiceDetailsState();
}

class _AddServiceDetailsState extends State<AddServiceDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(
            appBarContent: CustomBack(text: "Add Service Details".tr)),
        body: GetBuilder<AddServiceController>(builder: (controller) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //================================Service name=============================

                CustomText(text: "Service name".tr, bottom: 12),
                CustomTextField(
                    textEditingController: controller.serviceNameController,
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return AppStaticStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                    hintText: "Enter service name".tr),

                //================================Service description=============================

                CustomText(text: "Service description".tr, bottom: 12, top: 16),
                CustomTextField(
                    textEditingController: controller.serviceDesController,
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return AppStaticStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                    hintText: "Enter service description".tr,
                    maxLines: 5),

                //================================Gallery Photo=============================

                CustomText(text: "Gallery Photo".tr, bottom: 12, top: 16),
                GestureDetector(
                  onTap: () {
                    controller.openGallery();
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
                            controller.galleryPhoto!,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),

                //================================Service Duration=============================

                CustomText(text: "Service Duration".tr, bottom: 12, top: 16),
                CustomTextField(
                    keyboardType: TextInputType.number,
                    textEditingController: controller.serviceDurationController,
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return AppStaticStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                    hintText: "Enter service duration".tr),

                CustomText(
                    text: "Select service charges".tr,
                    top: 16,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),

                //================================Salon service charges=============================

                CustomText(
                    text: "Salon Service Charge".tr, bottom: 12, top: 16),

                CustomTextField(
                    keyboardType: TextInputType.number,
                    textEditingController: controller.salonSerChargeController,
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return AppStaticStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                    hintText: "Enter service amount".tr),

                //================================Home service charges=============================

                CustomText(text: "Home Service Charge".tr, bottom: 12, top: 16),
                CustomTextField(
                    keyboardType: TextInputType.number,
                    textEditingController: controller.homeSerChargeController,
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return AppStaticStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                    hintText: "Set booking money".tr),

                //================================Set Booking money=============================

                CustomText(text: "Set Booking money".tr, bottom: 12, top: 16),
                CustomTextField(
                    keyboardType: TextInputType.number,
                    textEditingController: controller.setBookingController,
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return AppStaticStrings.fieldCantBeEmpty;
                      }
                      return null;
                    },
                    hintText: "Set Booking money".tr),

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
                                                controller.days[index]
                                                    ["start"] = time;
                                              });
                                            },
                                            initialTime: controller.days[index]
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
                                                bottom: 16.h, text: "End Time"),
                                          SelectTime(
                                            onTimeSelected: (time) {
                                              setState(() {
                                                controller.days[index]["end"] =
                                                    time;
                                              });
                                            },
                                            initialTime: controller.days[index]
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

                //================================Save Button=============================

                controller.isLoading
                    ? const CustomLoader()
                    : CustomButton(
                        titleText: "Save".tr,
                        onPressed: () async {
                          //===========================Add Service================================

                          controller.addService();
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
