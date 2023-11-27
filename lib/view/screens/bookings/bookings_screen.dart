import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(
            appBarContent: CustomBack(text: "Bookings".tr, isIcon: false)),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: "Search".tr,
                  hintStyle: GoogleFonts.montserrat(
                      color: AppColors.black60,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  fillColor: AppColors.cardBgColor,
                  filled: true,
                  prefixIcon: const Icon(Icons.search,
                      size: 18, color: AppColors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: AppColors.stroke, width: 1),
                      gapPadding: 0),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: AppColors.stroke, width: 1),
                      gapPadding: 0),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: AppColors.stroke, width: 1),
                      gapPadding: 0),
                ),
              ),
              Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(top: 24),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryOrange,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(8),topLeft: Radius.circular(8))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(text: "Client".tr,fontSize: 10,fontWeight: FontWeight.w600),
                        CustomText(text: "Services".tr,fontSize: 10,fontWeight: FontWeight.w600),
                        CustomText(text: "Date & Time".tr,fontSize: 10,fontWeight: FontWeight.w600),
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.stroke,width: 1,style: BorderStyle.solid),
                      color: AppColors.cardBgColor
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(text: "Jane Cooper".tr,fontSize: 10),
                        CustomText(text: "Hair Cut, Shaving".tr,fontSize: 10),
                        Flexible(child: CustomText(text: "23 Sept, 10:02 am".tr,fontSize: 10,maxLines: 2,textAlign: TextAlign.right,overflow: TextOverflow.ellipsis)),
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.stroke,width: 1,style: BorderStyle.solid),
                        color: AppColors.cardBgColor
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(text: "Jane Cooper".tr,fontSize: 10),
                        CustomText(text: "Hair Cut, Shaving".tr,fontSize: 10),
                        Flexible(child: CustomText(text: "23 Sept, 10:02 am".tr,fontSize: 10,maxLines: 2,textAlign: TextAlign.right,overflow: TextOverflow.ellipsis)),
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.stroke,width: 1,style: BorderStyle.solid),
                        color: AppColors.cardBgColor
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(text: "Jane Cooper".tr,fontSize: 10),
                        CustomText(text: "Hair Cut, Shaving".tr,fontSize: 10),
                        Flexible(child: CustomText(text: "23 Sept, 10:02 am".tr,fontSize: 10,maxLines: 2,textAlign: TextAlign.right,overflow: TextOverflow.ellipsis)),
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.stroke,width: 1,style: BorderStyle.solid),
                        color: AppColors.cardBgColor
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(text: "Jane Cooper".tr,fontSize: 10),
                        CustomText(text: "Hair Cut, Shaving".tr,fontSize: 10),
                        Flexible(child: CustomText(text: "23 Sept, 10:02 am".tr,fontSize: 10,maxLines: 2,textAlign: TextAlign.right,overflow: TextOverflow.ellipsis)),
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.stroke,width: 1,style: BorderStyle.solid),
                        color: AppColors.cardBgColor
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(text: "Jane Cooper".tr,fontSize: 10),
                        CustomText(text: "Hair Cut, Shaving".tr,fontSize: 10),
                        Flexible(child: CustomText(text: "23 Sept, 10:02 am".tr,fontSize: 10,maxLines: 2,textAlign: TextAlign.right,overflow: TextOverflow.ellipsis)),
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.stroke,width: 1,style: BorderStyle.solid),
                        color: AppColors.cardBgColor
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(text: "Jane Cooper".tr,fontSize: 10),
                        CustomText(text: "Hair Cut, Shaving".tr,fontSize: 10),
                        Flexible(child: CustomText(text: "23 Sept, 10:02 am".tr,fontSize: 10,maxLines: 2,textAlign: TextAlign.right,overflow: TextOverflow.ellipsis)),
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(8),bottomLeft: Radius.circular(8)),
                        border: Border.all(color: AppColors.stroke,width: 1,style: BorderStyle.solid),
                        color: AppColors.cardBgColor
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(text: "Jane Cooper".tr,fontSize: 10),
                        CustomText(text: "Hair Cut, Shaving".tr,fontSize: 10),
                        Flexible(child: CustomText(text: "23 Sept, 10:02 am".tr,fontSize: 10,maxLines: 2,textAlign: TextAlign.right,overflow: TextOverflow.ellipsis)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
