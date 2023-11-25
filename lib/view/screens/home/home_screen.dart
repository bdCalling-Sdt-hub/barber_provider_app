import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_icons.dart';
import 'package:barbar_provider/view/screens/home/inner_widgets/custom_drawer.dart';
import 'package:barbar_provider/view/screens/home/inner_widgets/purchase_popup.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        key: scaffoldKey,
        appBar: PreferredSize(
          preferredSize: const Size(double.maxFinite, 80),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                  icon: const Icon(Icons.menu, size: 24, color: AppColors.white),
                ),
                CustomText(
                    text: "Atyose".tr,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoute.notification);
                  },
                  child: Stack(
                    children: [
                      const Align(
                        alignment: Alignment.center,
                        child: CustomImage(
                            imageSrc: AppIcons.notification, size: 24),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 10,
                          width: 10,
                          margin: const EdgeInsets.only(left: 14, bottom: 14),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primaryOrange),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        drawer: const CustomDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomImage(
                  imageSrc: AppIcons.homeScreen, imageType: ImageType.png),
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
                    const Icon(Icons.add_circle_outline,
                        color: AppColors.primaryOrange, size: 16),
                    CustomText(
                        text: "Add New Services".tr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        left: 16,
                        color: AppColors.primaryOrange,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
