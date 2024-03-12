import 'package:barbar_provider/service/api_ckeck.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/service/app_service.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/view/screens/notification/model/notification_model.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  RxList<MyNotification> notificationModel = <MyNotification>[].obs;

  getNotifications() async {
    setRxRequestStatus(Status.loading);
    var response = await ApiClient.getData(ApiConstant.notification);

    if (response.statusCode == 200) {
      notificationModel.value = List<MyNotification>.from(response
          .body["notifications"]
          .map((x) => MyNotification.fromJson(x)));

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
