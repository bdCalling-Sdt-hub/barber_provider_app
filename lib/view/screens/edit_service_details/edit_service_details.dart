import 'package:barbar_provider/helper/time_converter.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/view/screens/add_new_service/controllers/add_service_controller.dart';
import 'package:barbar_provider/view/screens/edit_business_details/inner_widget/select_time.dart';
import 'package:barbar_provider/view/screens/service_details/model/salon_details_model.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/button/custom_button.dart';
import 'package:barbar_provider/view/widgets/custom_loader/custom_loader.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/custom_textfield/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditServiceDetails extends StatefulWidget {
  const EditServiceDetails({super.key});

  @override
  State<EditServiceDetails> createState() => _EditServiceDetailsState();
}

class _EditServiceDetailsState extends State<EditServiceDetails> {
  List<Map<String, dynamic>> convertedServiceHour = [];

  ServiceDetails serviceDetails = ServiceDetails();

  @override
  void initState() {
    serviceDetails = Get.arguments;
    convertedServiceHour = stringToTimeDate(serviceDetails.availableServiceOur);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(
            appBarContent: CustomBack(text: "Edit Service Details".tr)),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          physics: const BouncingScrollPhysics(),
          child: GetBuilder<AddServiceController>(builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //===================================Service name=========================
                CustomText(text: "Service name".tr, bottom: 12),
                CustomTextField(
                  textEditingController: controller.serviceNameController =
                      TextEditingController(text: serviceDetails.serviceName),
                  hintColor: AppColors.white,
                ),

                //===================================Service description=========================

                CustomText(text: "Service description".tr, bottom: 12, top: 16),
                CustomTextField(
                    textEditingController: controller.serviceDesController =
                        TextEditingController(
                            text: serviceDetails.serviceDescription),
                    maxLines: 5),

                //===================================Gallery Photo==============================

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
                      child: controller.pickGalleryPhoto == null
                          ? Image.network(
                              "${ApiConstant.baseUrl}images/${serviceDetails.gallaryPhoto![0]}",
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              controller.pickGalleryPhoto!,
                              fit: BoxFit.cover,
                            )),
                ),

                //===================================Service Duration==========================

                CustomText(
                    text: "Service Duration (min)".tr, bottom: 12, top: 16),
                CustomTextField(
                    textInputFormatter: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    keyboardType:
                        const TextInputType.numberWithOptions(signed: true),
                    textEditingController:
                        controller.serviceDurationController =
                            TextEditingController(
                                text: serviceDetails.serviceDuration),
                    hintText: "Enter service duration".tr),

                CustomText(
                    text: "Select service charges".tr,
                    top: 16,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),

                //===================================Salon Service Charge==========================

                CustomText(
                    text: "Salon Service Charge".tr, bottom: 12, top: 16),
                CustomTextField(
                    textInputFormatter: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    keyboardType:
                        const TextInputType.numberWithOptions(signed: true),
                    textEditingController: controller.salonSerChargeController =
                        TextEditingController(
                            text: serviceDetails.salonServiceCharge),
                    hintText: "Enter service amount".tr),

                //===================================Home Service Charge=============================

                CustomText(text: "Home Service Charge".tr, bottom: 12, top: 16),
                CustomTextField(
                    textInputFormatter: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    keyboardType:
                        const TextInputType.numberWithOptions(signed: true),
                    textEditingController: controller.homeSerChargeController =
                        TextEditingController(
                            text: serviceDetails.homeServiceCharge),
                    hintText: "Set booking money".tr),

                //===================================Set Booking money==========================

                CustomText(text: "Set Booking money".tr, bottom: 12, top: 16),
                CustomTextField(
                    textInputFormatter: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    keyboardType:
                        const TextInputType.numberWithOptions(signed: true),
                    textEditingController: controller.setBookingController =
                        TextEditingController(
                            text: serviceDetails.setBookingMony),
                    hintText: "Set Booking money".tr),

                //===================================Available Service Hours==========================

                CustomText(
                    text: "Available Service Hours".tr, top: 16, bottom: 16),
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
                            itemCount: convertedServiceHour.length,
                            itemBuilder: (context, index) {
                              var value = convertedServiceHour[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //==================================Show Days===============================

                                    Expanded(
                                        child: Column(
                                      children: [
                                        if (index == 0)
                                          CustomText(bottom: 16.h, text: "Day"),
                                        CustomText(text: value["day"])
                                      ],
                                    )),

                                    //===============================Show Start Time==========================

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
                                                value["start"] = time;
                                              });
                                            },
                                            initialTime: value["start"],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),

                                    //===============================Show End Time==========================

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
                                                value["end"] = time;
                                              });
                                            },
                                            initialTime: value["end"],
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

                //==================================Save Button=========================
                controller.isLoading
                    ? const CustomLoader()
                    : CustomButton(
                        titleText: "Save".tr,
                        onPressed: () {
                          controller.updateService(
                              serviceID: serviceDetails.id.toString(),
                              updatedServiceHours: convertedServiceHour);
                        }),
                const SizedBox(height: 24),
              ],
            );
          }),
        ),
      ),
    );
  }
}
