import 'package:barbar_provider/service/api_ckeck.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/service/app_service.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/view/screens/catalouge_list/model/catalouge_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatalougeListController extends GetxController {
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  // AddCatalougeController addCatalougeController =
  //     Get.find<AddCatalougeController>();

  RxList<Provider> catalougeList = <Provider>[].obs;

  var avgrating = 0;

  //==============================Get the Catagory List==========================

  getCatalougeList({required String serviceID}) async {
    catalougeList.value = [];
    setRxRequestStatus(Status.loading);

    debugPrint("service ID==========>>>>>>>>>>>>>>>>$serviceID");

    var response =
        await ApiClient.getData(ApiConstant.catalougeList + serviceID);

    if (response.statusCode == 200) {
      catalougeList.value = List<Provider>.from(
          response.body["provider"].map((x) => Provider.fromJson(x)));

      setRxRequestStatus(Status.completed);
    } else {
      if (response.statusText == ApiClient.noInternetMessage) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }
}
