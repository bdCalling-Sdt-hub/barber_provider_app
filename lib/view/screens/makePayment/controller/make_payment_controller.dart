import 'package:barbar_provider/helper/prefs_helper.dart';
import 'package:barbar_provider/service/api_ckeck.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/service/app_service.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/view/screens/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave_standard/core/flutterwave.dart';
import 'package:flutterwave_standard/models/requests/customer.dart';
import 'package:flutterwave_standard/models/requests/customizations.dart';
import 'package:flutterwave_standard/models/responses/charge_response.dart';
import 'package:get/get.dart';

class MakePaymentController extends GetxController {
  ProfileController profileController = Get.find<ProfileController>();

  RxBool isloading = false.obs;
  Customer customer = Customer(email: "");

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

    customer = Customer(
        name: info.name,
        phoneNumber: info.phoneNumber ?? "123456789",
        email: info.email!);

    var response =
        await ApiClient.postData("${ApiConstant.makePayment}$packageID", body);

    if (response.statusCode == 200) {
      debugPrint(
          "Response URL===================================${response.body["gateway_link"]}");

      makePayment(redirectUrl: response.body["gateway_link"], ammount: ammount);
    } else {
      ApiChecker.checkApi(response);
    }

    isloading.value = false;
    refresh();
  }

  makePayment({required String redirectUrl, required String ammount}) async {
    final Flutterwave flutterwave = Flutterwave(
        context: Get.context!,
        publicKey: ApiConstant.paymentPublicKey,
        currency: "NGN",
        redirectUrl: redirectUrl,
        txRef: "12678999",
        amount: ammount,
        customer: customer,
        paymentOptions: "ussd, card, barter, payattitude",
        customization: Customization(title: "My Payment"),
        isTestMode: true);

    final ChargeResponse response = await flutterwave.charge();

    debugPrint(
        "Payment Success===================================${response.success}");
    debugPrint(
        "Payment transactionId===================================${response.transactionId}");
    debugPrint(
        "Payment status===================================${response.status}");
    debugPrint(
        "Payment txRef===================================${response.txRef}");

    SharePrefsHelper.setBool(AppConstants.paymentDone, response.success!);
  }
}
