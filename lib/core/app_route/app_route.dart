import 'package:barbar_provider/view/screens/add_new_service/screens/add_catalouge_details.dart';
import 'package:barbar_provider/view/screens/add_new_service/screens/add_photo.dart';
import 'package:barbar_provider/view/screens/add_new_service/screens/add_provider_details.dart';
import 'package:barbar_provider/view/screens/add_new_service/screens/add_service_details.dart';
import 'package:barbar_provider/view/screens/add_new_service/screens/select_category.dart';
import 'package:barbar_provider/view/screens/approved_booking/approved_booking.dart';
import 'package:barbar_provider/view/screens/auth/forget_password/forget_password.dart';
import 'package:barbar_provider/view/screens/auth/otp/otp_screen.dart';
import 'package:barbar_provider/view/screens/auth/reset_password/reset_password_screen.dart';
import 'package:barbar_provider/view/screens/auth/sign_in/sign_in_screen.dart';
import 'package:barbar_provider/view/screens/auth/sign_up/sign_up_continue.dart';
import 'package:barbar_provider/view/screens/auth/sign_up/sign_up_screen.dart';
import 'package:barbar_provider/view/screens/booking_history/booking_history.dart';
import 'package:barbar_provider/view/screens/booking_request/booking_request.dart';
import 'package:barbar_provider/view/screens/booking_request/booking_request_details/booking_request_details.dart';
import 'package:barbar_provider/view/screens/booking_request/booking_reschedule/booking_reschedule.dart';
import 'package:barbar_provider/view/screens/category/category.dart';
import 'package:barbar_provider/view/screens/clients_reviews/clients_reviews.dart';
import 'package:barbar_provider/view/screens/edit_business_details/edit_business_details.dart';
import 'package:barbar_provider/view/screens/edit_service_details/edit_service_details.dart';
import 'package:barbar_provider/view/screens/nav_bar/nav_bar.dart';
import 'package:barbar_provider/view/screens/notification/notification_screen.dart';
import 'package:barbar_provider/view/screens/onboarding/onboarding_screen.dart';
import 'package:barbar_provider/view/screens/profile/edit_profile/edit_profile_screen.dart';
import 'package:barbar_provider/view/screens/service_details/service_details.dart';
import 'package:barbar_provider/view/screens/settings/about_us/about_us_screen.dart';
import 'package:barbar_provider/view/screens/settings/change_password/change_password_screen.dart';
import 'package:barbar_provider/view/screens/settings/privacy_policy/privacy_policy_screen.dart';
import 'package:barbar_provider/view/screens/settings/settings_screen.dart';
import 'package:barbar_provider/view/screens/settings/terms_conditions/terms_condition_screen.dart';
import 'package:barbar_provider/view/screens/splash_screen/splash_screen.dart';
import 'package:barbar_provider/view/screens/makePayment/make_payment.dart';
import 'package:barbar_provider/view/screens/subscription_plans/subscription_plans.dart';
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

  static const String addCatalouge = "/add_catalouge";

  static const String editProfile = "/edit_profile_screen";
  static const String settings = "/settings_screen";
  static const String changePassword = "/change_password_screen";
  static const String privacyPolicy = "/privacy_policy_screen";
  static const String termsCondition = "/terms_condition_screen";
  static const String aboutUs = "/about_us_screen";
  static const String makePayments = "/makePayments";

  static const String notification = "/notification_screen";
  static const String bookingRequest = "/booking_request";
  static const String bookingRequestDetails = "/booking_request_details";
  static const String bookingReSchedule = "/booking_reschedule";
  static const String approvedBooking = "/approved_booking";
  static const String bookingHistory = "/booking_history";
  static const String editBusinessDetails = "/edit_business_details";
  static const String categoriesScreen = "/category";
  static const String clientsReviews = "/clients_reviews";
  static const String addNewServiceCategory = "/add_new_service_category";
  static const String providerDetails = "/add_provider_details";
  static const String addPhotos = "/add_photo";
  static const String addServiceDetails = "/add_service_details";
  static const String serviceDetails = "/service_details";
  static const String editServiceDetails = "/edit_service_details";
  static const String subscriptionPlans = "/subscriptionPlans";

  static List<GetPage> routes = [
    GetPage(name: splashscreen, page: () => const SplashScreen()),
    GetPage(name: onboardingScreen, page: () => const OnboardingScreen()),
    GetPage(name: signInScreen, page: () => const SignInScreen()),
    GetPage(name: forgetPassScreen, page: () => const ForgetPassword()),
    GetPage(name: otpScreen, page: () => const OtpScreen()),
    GetPage(name: resetPassword, page: () => ResetPassword()),
    GetPage(name: signUpScreen, page: () => const SignUpScreen()),
    GetPage(name: signUpContinue, page: () => const SignUpContinue()),
    GetPage(name: navBar, page: () => const NavBar()),
    GetPage(name: editProfile, page: () => const EditProfile()),
    GetPage(name: settings, page: () => const SettingsScreen()),
    GetPage(name: changePassword, page: () => const ChangePasswordScreen()),
    GetPage(name: privacyPolicy, page: () => PrivacyPolicy()),
    GetPage(name: termsCondition, page: () => TermsCondition()),
    GetPage(name: aboutUs, page: () => AboutUs()),
    GetPage(name: makePayments, page: () => const MakePayment()),
    GetPage(name: notification, page: () => NotificationScreen()),
    GetPage(name: bookingRequest, page: () => BookingsRequest()),
    GetPage(name: bookingRequestDetails, page: () => BookingRequestDetails()),
    GetPage(name: bookingReSchedule, page: () => const BookingReSchedule()),
    GetPage(name: approvedBooking, page: () => const ApprovedBooking()),
    GetPage(name: bookingHistory, page: () => const BookingHistory()),
    GetPage(name: editBusinessDetails, page: () => const EditBusinessDetails()),
    GetPage(name: categoriesScreen, page: () => const CategoryScreen()),
    GetPage(name: clientsReviews, page: () => const ClientsReviews()),
    GetPage(name: addNewServiceCategory, page: () => const SelectCategory()),
    GetPage(name: providerDetails, page: () => const AddProviderDetails()),
    GetPage(name: addPhotos, page: () => const AddPhoto()),
    GetPage(name: addServiceDetails, page: () => const AddServiceDetails()),
    GetPage(name: serviceDetails, page: () => const ServiceDetails()),
    GetPage(name: editServiceDetails, page: () => const EditServiceDetails()),
    GetPage(name: addCatalouge, page: () => const AddCatalougeDetails()),
    GetPage(name: subscriptionPlans, page: () => SubscriptionPlans()),
  ];
}
