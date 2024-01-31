import 'package:barbar_provider/service/api_ckeck.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/service/app_service.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/view/screens/notification/model/notification_model.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  Rx<NotificationModel> notificationModel = NotificationModel().obs;

  getNotifications() async {
    setRxRequestStatus(Status.loading);
    var response = await ApiClient.getData(ApiConstant.notification);

    if (response.statusCode == 200) {
      notificationModel.value = NotificationModel.fromJson(response.body);

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
    getNotifications();
    super.onInit();
  }
}
