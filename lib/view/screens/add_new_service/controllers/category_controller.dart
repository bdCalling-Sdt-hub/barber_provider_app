import 'package:barbar_provider/service/api_ckeck.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/service/app_service.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/view/screens/add_new_service/model/category_model.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController with GetxServiceMixin {
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  CategoryModel categoryModel = CategoryModel();
  List<Message> categoryList = [];

  var clearSearch = true.obs;

  getCategory({String search = ""}) async {
    categoryList = [];
    setRxRequestStatus(Status.loading);

    var response =
        await ApiClient.getData("${ApiConstant.showCategory}$search");

    if (response.statusCode == 200) {
      categoryModel = CategoryModel.fromJson(response.body);

      List<Message>? rawData = categoryModel.message;

      if (rawData != null && rawData.isNotEmpty) {
        categoryList.addAll(rawData);

        if (search.isNotEmpty) {
          clearSearch.value = false;
          refresh();
        }
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
  }

  @override
  void onInit() {
    getCategory();
    super.onInit();
  }
}
