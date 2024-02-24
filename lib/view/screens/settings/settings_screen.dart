import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/helper/prefs_helper.dart';
import 'package:barbar_provider/utils/app_colors.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/utils/app_icons.dart';
import 'package:barbar_provider/view/screens/profile/inner_widgets/profile_cards.dart';
import 'package:barbar_provider/view/widgets/appbar/custom_appbar.dart';
import 'package:barbar_provider/view/widgets/back/custom_back.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  //=====================Check If Login with social media or not to show change password==================

  bool? isSocialLogIn = false;

  getSocialInfo() async {
    isSocialLogIn = await SharePrefsHelper.getBool(AppConstants.isSocialLogIn);
    debugPrint("Social Login===================$isSocialLogIn");
    setState(() {});
  }

  @override
  void initState() {
    getSocialInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(appBarContent: CustomBack(text: "Settings".tr)),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              //=============================Change Password========================

              if (isSocialLogIn == false)
                ProfileCards(
                    imageSrc: AppIcons.changePass,
                    text: "Change Password".tr,
                    onTap: () {
                      Get.toNamed(AppRoute.changePassword);
                    }),
              const SizedBox(height: 16),
              ProfileCards(
                  imageSrc: AppIcons.privacyPolicy,
                  text: "Privacy Policy".tr,
                  onTap: () {
                    Get.toNamed(AppRoute.privacyPolicy);
                  }),
              const SizedBox(height: 16),
              ProfileCards(
                  imageSrc: AppIcons.terms,
                  text: "Terms & Conditions".tr,
                  onTap: () {
                    Get.toNamed(AppRoute.termsCondition);
                  }),
              const SizedBox(height: 16),
              ProfileCards(
                  imageSrc: AppIcons.aboutUs,
                  text: "About Us".tr,
                  onTap: () {
                    Get.toNamed(AppRoute.aboutUs);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
