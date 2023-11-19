import 'package:barbar_provider/view/screens/auth/forget_password/forget_password.dart';
import 'package:barbar_provider/view/screens/auth/otp/otp_screen.dart';
import 'package:barbar_provider/view/screens/auth/reset_password/reset_password_screen.dart';
import 'package:barbar_provider/view/screens/auth/sign_in/sign_in_screen.dart';
import 'package:barbar_provider/view/screens/auth/sign_up/sign_up_continue.dart';
import 'package:barbar_provider/view/screens/auth/sign_up/sign_up_screen.dart';
import 'package:barbar_provider/view/screens/nav_bar/nav_bar.dart';
import 'package:barbar_provider/view/screens/onboarding/onboarding_screen.dart';
import 'package:barbar_provider/view/screens/profile/edit_profile/edit_profile_screen.dart';
import 'package:barbar_provider/view/screens/settings/about_us/about_us_screen.dart';
import 'package:barbar_provider/view/screens/settings/change_password/change_password_screen.dart';
import 'package:barbar_provider/view/screens/settings/privacy_policy/privacy_policy_screen.dart';
import 'package:barbar_provider/view/screens/settings/settings_screen.dart';
import 'package:barbar_provider/view/screens/settings/terms_conditions/terms_condition_screen.dart';
import 'package:barbar_provider/view/screens/splash_screen/splash_screen.dart';
import 'package:barbar_provider/view/screens/subscription_plan/subscription_plan.dart';
import 'package:get/get.dart';

class AppRoute {
  static const String splashscreen = "/splash_screen";
  static const String onboardingScreen = "/onboarding_screen";
  static const String signInScreen = "/sign_in_screen";
  static const String forgetPassScreen = "/forget_password";
  static const String otpScreen = "/otp_screen";
  static const String resetPassword = "/reset_password_screen";
  static const String signUpScreen = "/sign_up_screen";
  static const String signUpContinue = "/sign_up_continue";


  static const String navBar = "/nav_bar";

  static const String editProfile = "/edit_profile_screen";
  static const String settings = "/settings_screen";
  static const String changePassword = "/change_password_screen";
  static const String privacyPolicy = "/privacy_policy_screen";
  static const String termsCondition = "/terms_condition_screen";
  static const String aboutUs = "/about_us_screen";
  static const String subscriptionPlans = "/subscription_plans";


  static List<GetPage> routes = [
    GetPage(name: splashscreen, page: () => const SplashScreen()),
    GetPage(name: onboardingScreen, page: () => const OnboardingScreen()),
    GetPage(name: signInScreen, page: () => const SignInScreen()),
    GetPage(name: forgetPassScreen, page: () => const ForgetPassword()),
    GetPage(name: otpScreen, page: () =>  const OtpScreen()),
    GetPage(name: resetPassword, page: () =>  const ResetPassword()),
    GetPage(name: signUpScreen, page: () =>  const SignUpScreen()),
    GetPage(name: signUpContinue, page: () =>  const SignUpContinue()),


    GetPage(name: navBar, page: () =>  const NavBar()),


    GetPage(name: editProfile, page: () =>  const EditProfile()),
    GetPage(name: settings, page: () =>  const SettingsScreen()),
    GetPage(name: changePassword, page: () =>  const ChangePasswordScreen()),
    GetPage(name: privacyPolicy, page: () =>  const PrivacyPolicy()),
    GetPage(name: termsCondition, page: () =>  const TermsCondition()),
    GetPage(name: aboutUs, page: () =>  const AboutUs()),
    GetPage(name: subscriptionPlans, page: () =>  const SubscriptionPlan()),
  ];
}