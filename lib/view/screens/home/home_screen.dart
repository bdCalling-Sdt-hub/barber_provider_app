import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_icons.dart';
import 'package:barbar_provider/utils/app_images.dart';
import 'package:barbar_provider/view/screens/home/inner_widgets/custom_drawer.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/image/custom_image.dart';
import 'package:barbar_provider/view/widgets/row_text/row_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> category = [
    "Spa",
    "Nails",
    "Barber",
    "Salon",
    "Women’s",
    "Men’s",
    "Massage",
    "Piercing",
    "Skin care",
    "Hair Care",
    "Makeover",
    "Facial"
  ];

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
                  icon:
                      const Icon(Icons.menu, size: 24, color: AppColors.white),
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
        body:
            //If there no business added then this section shows up first.
            /*const AddNewService()*/
            SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 180,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                        image: AssetImage(AppImages.salon), fit: BoxFit.fill)),
              ),
              const CustomText(
                  text: "Green Apple Salon",
                  fontWeight: FontWeight.w600,
                  top: 16,
                  bottom: 12),
              const Row(
                children: [
                  Icon(Icons.location_on_rounded,
                      color: AppColors.primaryOrange, size: 16),
                  CustomText(
                      text: "6391 Elgin St Celina, Delaware",
                      fontSize: 14,
                      left: 12)
                ],
              ),
              CustomText(
                text: "Description".tr,
                fontWeight: FontWeight.w600,
                top: 24,
                bottom: 16,
              ),
              const CustomText(
                text:
                    "Lorem ipsum dolor sit amet consectetur. Tortor nec lectus lectus felis odio. Quis accumsan adipiscing massa leo urna tincidunt at. Eleifend in rutrum in scelerisque faucibus sem imperdiet. Nisi pharetra aliquam nunc pellentesque habitasse donec nulla.",
                fontSize: 14,
                maxLines: 5,
                textAlign: TextAlign.start,
              ),
              CustomText(
                text: "Services".tr,
                fontWeight: FontWeight.w600,
                top: 24,
                bottom: 16,
              ),
              SizedBox(
                height: 110,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: category.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Get.toNamed(AppRoute.serviceDetails),
                      child: Container(
                        margin: const EdgeInsets.only(right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const CustomImage(
                                  imageSrc: AppImages.service,
                                  imageType: ImageType.png,
                                  size: 80),
                            ),
                            CustomText(text: category[index])
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              CustomText(
                  text: "Available Service Hours".tr,
                  fontWeight: FontWeight.w600,
                  top: 24,
                  bottom: 16),
              const RowText(field: "Sun :", value: "8.00 AM - 10 PM"),
              const SizedBox(height: 12),
              const RowText(field: "Mon :", value: "8.00 AM - 10 PM"),
              const SizedBox(height: 12),
              const RowText(field: "Tue :", value: "8.00 AM - 10 PM"),
              const SizedBox(height: 12),
              const RowText(field: "Wed :", value: "8.00 AM - 10 PM"),
              const SizedBox(height: 12),
              const RowText(field: "Thu :", value: "8.00 AM - 10 PM"),
              const SizedBox(height: 12),
              const RowText(field: "Fri :", value: "8.00 AM - 10 PM"),
              const SizedBox(height: 12),
              const RowText(field: "Sat :", value: "8.00 AM - 10 PM"),
              CustomText(
                text: "Gallery".tr,
                fontWeight: FontWeight.w600,
                top: 24,
                bottom: 16,
              ),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 80,
                      width: 80,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const CustomImage(
                        imageSrc: AppImages.service,
                        imageType: ImageType.png,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              //This Section is shows when first time add ane business then need the permission from the admin to add new service.
              /*Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.error_outline,size: 20,color: AppColors.white),
                  Flexible(child: CustomText(text: "Users won’t see the details before admins approval".tr,maxLines: 2,textAlign: TextAlign.start,left: 8,fontSize: 14,fontWeight: FontWeight.w500),),
                ],
              ),*/

              GestureDetector(
                onTap: () {
                  //If don't have subscription then this section will show
                  /*showDialog(
                      context: context,
                      builder: (context) {
                        return const PurchasePopUp();
                      });*/
                  Get.toNamed(AppRoute.addServiceDetails);
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
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
