import 'package:barbar_provider/service/api_ckeck.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/service/app_service.dart';
import 'package:barbar_provider/view/screens/profile/controller/profile_controller.dart';
import 'package:get/get.dart';

class MakePaymentController extends GetxController {
  ProfileController profileController = Get.find<ProfileController>();

  RxBool isloading = false.obs;

  generateGatewayLink({required String ammount, required int packageID}) async {
    isloading.value = true;
    refresh();

    var info = profileController.profileModel.value;

    var body = {
      "amount": ammount,
      "email": info.email,
      "currency": "NGN",
      "name": info.name,
      "phone": info.phoneNumber ?? "123456789",
    };

    var response =
        await ApiClient.postData("${ApiConstant.makePayment}$packageID", body);

    if (response.statusCode == 200) {
      print(
          "Response URL===================================${response.body["gateway_link"]}");
    } else {
      ApiChecker.checkApi(response);
    }

    isloading.value = false;
    refresh();
  }





}
