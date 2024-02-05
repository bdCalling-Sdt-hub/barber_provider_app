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
import 'package:uuid/uuid.dart';

class MakePaymentController extends GetxController {
  ProfileController profileController = Get.find<ProfileController>();

  dynamic package;

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

      // Get.to(() => WebviewPayment(
      //       url: response.body["gateway_link"],
      //     ));

      makePayment(
          redirectUrl: response.body["gateway_link"],
          ammount: ammount,
          packageID: packageID.toString());
    } else {
      ApiChecker.checkApi(response);
    }

    isloading.value = false;
    refresh();
  }

  makePayment(
      {required String redirectUrl,
      required String ammount,
      required String packageID}) async {
    var uuid = const Uuid();

    debugPrint("uuid========================${uuid.v1()}");

    final Flutterwave flutterwave = Flutterwave(
        context: Get.context!,
        publicKey: ApiConstant.paymentPublicKey,
        currency: "NGN",
        redirectUrl: redirectUrl,
        txRef: uuid.v1(),
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

    inputInServer(
        ammount: ammount,
        status: response.status!,
        txRef: response.txRef!,
        packageID: packageID,
        transactionId: response.transactionId!);
  }

  inputInServer({
    required String ammount,
    required String status,
    required String txRef,
    required String packageID,
    required String transactionId,
  }) async {
    var info = profileController.profileModel.value;

    //=============Get User ID==========
    var profileID = await SharePrefsHelper.getInt(
      AppConstants.profileID,
    );

    debugPrint("user_id==========================>>>>>>>>>>>$profileID");

    var body = {
      "package_id": packageID,
      "user_id": profileID.toString(),
      "tx_ref": txRef,
      "amount": ammount,
      "currency": "NGN",
      "payment_type": "Card",
      "status": status,
      "email": info.email,
      "name": info.name,
    };

    var response = await ApiClient.postData(ApiConstant.paymentSuccess, body);

    if (response.statusCode == 200) {
      profileController.getMyPlan();
    } else {
      ApiChecker.checkApi(response);
    }
  }
}
