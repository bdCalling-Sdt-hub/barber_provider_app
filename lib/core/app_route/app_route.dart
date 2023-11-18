import 'package:barbar_provider/view/screens/auth/forget_password/forget_password.dart';
import 'package:barbar_provider/view/screens/auth/sign_in/sign_in_screen.dart';
import 'package:barbar_provider/view/screens/onboarding/onboarding_screen.dart';
import 'package:barbar_provider/view/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  static const String splashscreen = "/splash_screen";
  static const String onboardingScreen = "/onboarding_screen";
  static const String signInScreen = "/sign_in_screen";
  static const String forgetPassScreen = "/sign_in_screen";


  static List<GetPage> routes = [
    GetPage(name: splashscreen, page: () => const SplashScreen()),
    GetPage(name: onboardingScreen, page: () => const OnboardingScreen()),
    GetPage(name: signInScreen, page: () => const SignInScreen()),
    GetPage(name: forgetPassScreen, page: () => const ForgetPassword()),
  ];
}