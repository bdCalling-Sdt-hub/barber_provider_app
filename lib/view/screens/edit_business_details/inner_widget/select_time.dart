import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectTime extends StatelessWidget {
  const SelectTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.cardBgColor
      ),
      child: Row(
        children: [
          const Icon(Icons.watch_later_outlined,size: 16,color: AppColors.white),
          CustomText(text: "Select Time".tr,fontSize: 12,left: 8)
        ],
      ),
    );
  }
}
