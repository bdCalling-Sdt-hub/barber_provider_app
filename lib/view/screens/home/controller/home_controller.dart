import 'package:barbar_provider/helper/prefs_helper.dart';
import 'package:barbar_provider/helper/time_converter.dart';
import 'package:barbar_provider/service/api_ckeck.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/service/app_service.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/view/screens/home/model/home_model.dart';
import 'package:barbar_provider/view/screens/service_details/model/salon_details_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetxServiceMixin {
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  HomeModel homeModel = HomeModel();

  List<Provider> provider = [];

  List<Map<String, dynamic>> convertedServiceHour = [];

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

        convertedServiceHour = stringToTimeDate(rawData[0].availableServiceOur);

        SharePrefsHelper.setString(
            AppConstants.catID, provider[0].categoryId.toString());
        SharePrefsHelper.setString(
            AppConstants.providerID, provider[0].id.toString());

        if (rawData.isNotEmpty) {
          SharePrefsHelper.setBool(AppConstants.isProviderAdded, true);
        }

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

  ServiceDetailsModel serviceDetailsModel = ServiceDetailsModel();

  getServiceDetails({required String salonID}) async {
    setRxRequestStatus(Status.loading);
    var response =
        await ApiClient.getData("${ApiConstant.serviceDetails}$salonID");
    if (response.statusCode == 200) {
      serviceDetailsModel = ServiceDetailsModel.fromJson(response.body);

      // convertedServiceHour =
      //     stringToTimeDate(serviceDetailsModel.serviceDetails!.availableServiceOur);

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
    homeData();
    super.onInit();
  }
}
