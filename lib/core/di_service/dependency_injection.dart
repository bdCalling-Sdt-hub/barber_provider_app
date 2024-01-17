import 'package:barbar_provider/view/screens/add_new_service/controllers/add_catalouge_controller.dart';
import 'package:barbar_provider/view/screens/add_new_service/controllers/add_provider_controller.dart';
import 'package:barbar_provider/view/screens/add_new_service/controllers/add_service_controller.dart';
import 'package:barbar_provider/view/screens/add_new_service/controllers/category_controller.dart';
import 'package:barbar_provider/view/screens/auth/sign_in/sign_in_controller/sign_in_controller.dart';
import 'package:barbar_provider/view/screens/auth/sign_up/sign_up_controller/sign_up_controller.dart';
import 'package:barbar_provider/view/screens/home/controller/home_controller.dart';
import 'package:barbar_provider/view/screens/profile/controller/profile_controller.dart';
import 'package:get/get.dart';

class Dependancy extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => SignInController(), fenix: true);
    Get.lazyPut(() => CategoryController(), fenix: true);
    Get.lazyPut(() => AddProviderController(), fenix: true);
    Get.lazyPut(() => AddServiceController(), fenix: true);
    Get.lazyPut(() => AddCatalougeController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}
