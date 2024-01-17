import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/helper/prefs_helper.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/utils/snack_bar.dart';
import 'package:get/get.dart';

class ApiChecker {
  static void checkApi(Response response, {bool getXSnackBar = false}) async {
    if (response.statusCode == 401) {
      await SharePrefsHelper.remove(AppConstants.bearerToken);
      Get.offAllNamed(AppRoute.signInScreen);
    } else {
      showCustomSnackBar(response.statusText!, getXSnackBar: getXSnackBar);
    }
  }
}
