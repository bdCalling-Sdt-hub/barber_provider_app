import 'package:barbar_provider/service/api_ckeck.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/service/app_service.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/view/screens/earnings/model/weekly_model.dart';
import 'package:get/get.dart';

enum IncomeType {
  weekly,
  monthly,
}

class SalesData {
  SalesData(this.weekday, this.totalAmount);

  final String weekday;
  final dynamic totalAmount;

  // Factory method to create SalesData from JSON
  factory SalesData.fromJson(Map<String, dynamic> json) {
    return SalesData(
      json['Dayname'],
      json['total_amount'],
    );
  }
}

class EarningController extends GetxController {
  //==============For Loading, complete status===========
  final rxRequestStatus = Status.loading.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  //==============For weekly, monthly, yearly status===========

  final incomeTypeValue = IncomeType.weekly.obs;

  void setincomeTypeValue(IncomeType value) => incomeTypeValue.value = value;

  RxString incomeType = "Weekly".obs;

  updateIncomeType({required String getIncomeType}) {
    incomeType.value = getIncomeType;
    refresh();
  }

  //=======Weekly income Variable========
  RxList<WeekEarning> weekEarning = <WeekEarning>[].obs;

  Rx<WeeklyData> weeklyData = WeeklyData().obs;

  RxList<SalesData> weekEarningData = <SalesData>[].obs;

  weeklyIncome() async {
    weekEarning.value = [];
    weekEarningData.value = [];

    refresh();

    setRxRequestStatus(Status.loading);
    var response = await ApiClient.getData(ApiConstant.weeklyIncome);

    if (response.statusCode == 200) {
      //=====================Getting the Weekly Income=====================

      weekEarning.value = List<WeekEarning>.from(
          response.body["week_earning"].map((x) => WeekEarning.fromJson(x)));

      //=====================Saving the Weekly Income=====================

      weekEarningData.addAll(
        weekEarning.map((item) => SalesData.fromJson(item.toJson())),
      );
      //=====================Saving Aditional Information=====================

      weeklyData.value = WeeklyData.fromJson(response.body["data"]);

      refresh();

      setRxRequestStatus(Status.completed);

      setincomeTypeValue(IncomeType.weekly);
    } else {
      if (response.statusText == ApiClient.noInternetMessage) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }

  monthlyIncome() async {
    weekEarning.value = [];
    weekEarningData.value = [];

    refresh();

    setRxRequestStatus(Status.loading);
    var response = await ApiClient.getData(ApiConstant.monthIncome);

    if (response.statusCode == 200) {
      //=====================Getting the Weekly Income=====================

      weekEarning.value = List<WeekEarning>.from(
          response.body["week_earning"].map((x) => WeekEarning.fromJson(x)));

      //=====================Saving the Weekly Income=====================

      weekEarningData.addAll(
        weekEarning.map((item) => SalesData.fromJson(item.toJson())),
      );
      //=====================Saving Aditional Information=====================

      weeklyData.value = WeeklyData.fromJson(response.body["data"]);

      refresh();

      setRxRequestStatus(Status.completed);
      setincomeTypeValue(IncomeType.monthly);
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
    weeklyIncome();
    super.onInit();
  }
}
