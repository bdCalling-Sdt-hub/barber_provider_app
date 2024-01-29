import 'package:barbar_provider/service/api_ckeck.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/service/app_service.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/view/screens/subscription_plans/model/show_package_model.dart';
import 'package:get/get.dart';

class SubscriptionController extends GetxController with GetxServiceMixin {
  var currentIndex = 0.obs;

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  Rx<PackageListModel> packageListModel = PackageListModel().obs;

  updateCurrentIndex({required int value}) {
    currentIndex.value = value;
    refresh();
  }

  showPackages() async {
    setRxRequestStatus(Status.loading);
    var response = await ApiClient.getData(ApiConstant.showPackage);

    if (response.statusCode == 200) {
      packageListModel.value = PackageListModel.fromJson(response.body);

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
    showPackages();
    super.onInit();
  }
}
