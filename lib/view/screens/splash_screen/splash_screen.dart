import 'dart:async';
import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_icons.dart';
import 'package:barbar_provider/view/widgets/custom_text/custom_text.dart';
import 'package:barbar_provider/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3),(){
      //Navigator.pushNamed(context, AppRoute.onboardingScreen);
      Get.offAllNamed(AppRoute.onboardingScreen);
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImage(imageSrc: AppIcons.appIcon),
                SizedBox(height: 24),
                CustomText(
                  text: "Atyose",
                  fontSize: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}