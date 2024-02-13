import 'package:barbar_provider/helper/prefs_helper.dart';
import 'package:barbar_provider/service/api_ckeck.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/service/app_service.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/view/screens/service_catalouge/model/service_catalouge_model.dart';
import 'package:get/get.dart';

class ServiceCatalougeController extends GetxController with GetxServiceMixin {
  final rxRequestStatus = Status.loading.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  RxList<Service> serviceList = <Service>[].obs;

  //================================Get Service List=========================

  getServiceList() async {
    setRxRequestStatus(Status.loading);

    String? providerID =
        await SharePrefsHelper.getString(AppConstants.providerID);

    var response =
        await ApiClient.getData("${ApiConstant.serviceList}$providerID");

    if (response.statusCode == 200) {
      serviceList.value = List<Service>.from(
          response.body["services"].map((x) => Service.fromJson(x)));

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

  @override
  void onInit() {
    getServiceList();
    super.onInit();
  }
}
