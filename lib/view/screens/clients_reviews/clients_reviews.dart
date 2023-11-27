import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_images.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientsReviews extends StatelessWidget {
  const ClientsReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar:
            CustomAppBar(appBarContent: CustomBack(text: "Clients Reviews".tr)),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                decoration: BoxDecoration(
                    color: AppColors.cardBgColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CustomText(text: "5", fontSize: 14, right: 4),
                            const Icon(Icons.star,
                                color: AppColors.primaryOrange, size: 16),
                            Container(
                              height: 6,
                              width: 120,
                              margin: const EdgeInsets.only(left: 4),
                              decoration: BoxDecoration(
                                  color: AppColors.primaryOrange,
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CustomText(text: "4", fontSize: 14, right: 4),
                            const Icon(Icons.star,
                                color: AppColors.primaryOrange, size: 16),
                            Container(
                              height: 6,
                              width: 90,
                              margin: const EdgeInsets.only(left: 4),
                              decoration: BoxDecoration(
                                  color: AppColors.primaryOrange,
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CustomText(text: "3", fontSize: 14, right: 4),
                            const Icon(Icons.star,
                                color: AppColors.primaryOrange, size: 16),
                            Container(
                              height: 6,
                              width: 60,
                              margin: const EdgeInsets.only(left: 4),
                              decoration: BoxDecoration(
                                  color: AppColors.primaryOrange,
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CustomText(text: "2", fontSize: 14, right: 4),
                            const Icon(Icons.star,
                                color: AppColors.primaryOrange, size: 16),
                            Container(
                              height: 6,
                              width: 30,
                              margin: const EdgeInsets.only(left: 4),
                              decoration: BoxDecoration(
                                  color: AppColors.primaryOrange,
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CustomText(text: "1", fontSize: 14, right: 4),
                            const Icon(Icons.star,
                                color: AppColors.primaryOrange, size: 16),
                            Container(
                              height: 6,
                              width: 10,
                              margin: const EdgeInsets.only(left: 4),
                              decoration: BoxDecoration(
                                  color: AppColors.primaryOrange,
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const CustomText(
                            text: "4.0",
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            bottom: 8),
                        SizedBox(
                          height: 20,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return const Icon(Icons.star,
                                  color: AppColors.primaryOrange, size: 16);
                            },
                          ),
                        ),
                        const CustomText(
                            text: "52 Reviews",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            top: 8),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 38,
                        width: 38,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(AppImages.profile),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            text: "Courtney Henry",
                            fontWeight: FontWeight.w600,
                            bottom: 4,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 16,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return const Icon(Icons.star,
                                        color: AppColors.primaryOrange,
                                        size: 16);
                                  },
                                ),
                              ),
                              const CustomText(
                                  text: "2 mins ago", fontSize: 12, left: 4),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const CustomText(
                    text: "Consequat velit qui adipisicing sunt do rependerit ad laborum tempor ullamco exercitation. Ullamco tempor adipisicing et voluptate duis sit esse aliqua",
                    fontSize: 14,textAlign: TextAlign.start,maxLines: 4,overflow: TextOverflow.ellipsis,top: 12,
                  ),
                ],
              ),

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Divider(height: 1,color: AppColors.stroke,thickness: 1),
              ),Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 38,
                        width: 38,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(AppImages.profile),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            text: "Courtney Henry",
                            fontWeight: FontWeight.w600,
                            bottom: 4,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 16,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return const Icon(Icons.star,
                                        color: AppColors.primaryOrange,
                                        size: 16);
                                  },
                                ),
                              ),
                              const CustomText(
                                  text: "2 mins ago", fontSize: 12, left: 4),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const CustomText(
                    text: "Consequat velit qui adipisicing sunt do rependerit ad laborum tempor ullamco exercitation. Ullamco tempor adipisicing et voluptate duis sit esse aliqua",
                    fontSize: 14,textAlign: TextAlign.start,maxLines: 4,overflow: TextOverflow.ellipsis,top: 12,
                  ),
                ],
              ),

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Divider(height: 1,color: AppColors.stroke,thickness: 1),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 38,
                        width: 38,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(AppImages.profile),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            text: "Courtney Henry",
                            fontWeight: FontWeight.w600,
                            bottom: 4,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 16,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return const Icon(Icons.star,
                                        color: AppColors.primaryOrange,
                                        size: 16);
                                  },
                                ),
                              ),
                              const CustomText(
                                  text: "2 mins ago", fontSize: 12, left: 4),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const CustomText(
                    text: "Consequat velit qui adipisicing sunt do rependerit ad laborum tempor ullamco exercitation. Ullamco tempor adipisicing et voluptate duis sit esse aliqua",
                    fontSize: 14,textAlign: TextAlign.start,maxLines: 4,overflow: TextOverflow.ellipsis,top: 12,
                  ),
                ],
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
