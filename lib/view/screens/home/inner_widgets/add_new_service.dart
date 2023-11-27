import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_icons.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewService extends StatelessWidget {
  const AddNewService({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomImage(imageSrc: AppIcons.homeScreen, imageType: ImageType.png),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: () {
              //If don't have subscription then this section will show
              /*showDialog(
                      context: context,
                      builder: (context) {
                        return const PurchasePopUp();
                      });*/
              Get.toNamed(AppRoute.addNewServiceCategory);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.add_circle_outline, color: AppColors.primaryOrange, size: 16),
                CustomText(
                  text: "Add New Services".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  left: 16,
                  color: AppColors.primaryOrange,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
