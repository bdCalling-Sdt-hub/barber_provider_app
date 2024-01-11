import 'package:barbar_provider/view/screens/auth/sign_up/sign_up_controller/sign_up_controller.dart';
import 'package:get/get.dart';

class Dependancy extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}
