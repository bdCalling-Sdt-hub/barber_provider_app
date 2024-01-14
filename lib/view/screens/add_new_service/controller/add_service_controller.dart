import 'package:barbar_provider/service/api_ckeck.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/service/app_service.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/view/screens/add_new_service/model/category_model.dart';
import 'package:get/get.dart';

class AddNewServiceController extends GetxController {
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  final Rx<Message> categoryModel = Message().obs;

  getCategory() async {
    setRxRequestStatus(Status.loading);
    var response = await ApiClient.getData(ApiConstant.showCategory);

    if (response.statusCode == 200) {
      categoryModel.value = Message.fromJson(response.body);

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
    getCategory();
    super.onInit();
  }
}
