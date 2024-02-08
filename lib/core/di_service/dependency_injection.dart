import 'package:barbar_provider/core/global/location_controller.dart';
import 'package:barbar_provider/view/screens/add_new_service/controllers/add_catalouge_controller.dart';
import 'package:barbar_provider/view/screens/add_new_service/controllers/add_provider_controller.dart';
import 'package:barbar_provider/view/screens/add_new_service/controllers/add_service_controller.dart';
import 'package:barbar_provider/view/screens/add_new_service/controllers/category_controller.dart';
import 'package:barbar_provider/view/screens/approved_booking/controller/approved_booking_controller.dart';
import 'package:barbar_provider/view/screens/auth/controller/auth_controller.dart';
import 'package:barbar_provider/view/screens/booking_request/controller/booking_reqcontroller.dart';

import 'package:barbar_provider/view/screens/home/controller/home_controller.dart';
import 'package:barbar_provider/view/screens/makePayment/controller/make_payment_controller.dart';
import 'package:barbar_provider/view/screens/notification/controller/notification_controller.dart';
import 'package:barbar_provider/view/screens/profile/controller/profile_controller.dart';
import 'package:barbar_provider/view/screens/settings/controller/settings_controller.dart';
import 'package:barbar_provider/view/screens/subscription_plans/controller/subscription_controller.dart';
import 'package:get/get.dart';

class Dependancy extends Bindings {
  @override
  void dependencies() {
    //============================Authentication=======================
    Get.lazyPut(() => Authcontroller(), fenix: true);

    //============================Location=======================
    Get.lazyPut(() => LocationController(), fenix: true);

    //============================Home=======================

    Get.lazyPut(() => CategoryController(), fenix: true);
    Get.lazyPut(() => AddProviderController(), fenix: true);
    Get.lazyPut(() => AddServiceController(), fenix: true);
    Get.lazyPut(() => AddCatalougeController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);

    //============================Profile=========================

    Get.lazyPut(() => ProfileController(), fenix: true);

    //============================Settings=========================

    Get.lazyPut(() => SettingsController(), fenix: true);

    //============================Subscription=========================

    Get.lazyPut(() => SubscriptionController(), fenix: true);

    Get.lazyPut(() => MakePaymentController(), fenix: true);

    //============================Notification=======================

    Get.lazyPut(() => NotificationController(), fenix: true);

    //============================Booking Request========================

    Get.lazyPut(() => BookingRequestController(), fenix: true);

    //============================Approved Booking========================

    Get.lazyPut(() => ApprovedBookingController(), fenix: true);
  }
}
