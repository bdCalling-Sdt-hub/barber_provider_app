import 'package:barbar_provider/service/api_ckeck.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/service/app_service.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/view/screens/home/model/home_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetxServiceMixin {
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  HomeModel homeModel = HomeModel();

  List<Provider> provider = [];

  bool routeLoading = false;

  homeData() async {
    routeLoading = true;
    provider = [];
    update();
    setRxRequestStatus(Status.loading);
    var response = await ApiClient.getData(ApiConstant.home);

    if (response.statusCode == 200) {
      homeModel = HomeModel.fromJson(response.body);
      List<Provider> rawData = homeModel.provider!;

      if (rawData.isNotEmpty) {
        provider.addAll(rawData);

        debugPrint("Lenght=================${provider.length}");
        update();
      }

      setRxRequestStatus(Status.completed);
    } else {
      if (response.statusText == ApiClient.noInternetMessage) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
    }

    routeLoading = false;
    update();
  }

  @override
  void onInit() {
    homeData();
    super.onInit();
  }
}
