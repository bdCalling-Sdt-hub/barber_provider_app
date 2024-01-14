import 'dart:async';
import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/helper/prefs_helper.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_icons.dart';
import 'package:barbar_provider/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigate() async {
    //==================Get Information abount showing onboarding screen==================

    bool? isOnboarding =
        await PrefsHelper.getBool(SharedPreferenceValue.isOnboarding);

    //======================If First time opening app goes to onboarding=====================

    // ignore: unnecessary_null_comparison
    if (isOnboarding == true || isOnboarding == null) {
      Timer(const Duration(seconds: 2), () {
        Get.offAllNamed(AppRoute.onboardingScreen);
      });
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAllNamed(AppRoute.signInScreen);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    navigate();
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
