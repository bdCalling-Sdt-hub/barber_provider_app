import 'package:barbar_provider/service/api_ckeck.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/service/app_service.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/view/screens/approved_booking/model/approved_booking_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApprovedBookingController extends GetxController with GetxServiceMixin {
  final rxRequestStatus = Status.loading.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  RxList<Datum> approvedBookingModel = <Datum>[].obs;

  RxList<bool> isSelectRemoveList = <bool>[].obs;

  var isSelected = false.obs;

  selectContent(int index) {
    isSelectRemoveList[index] = !isSelectRemoveList[index];
    var isEmpty = [];
    for (int i = 0; i < isSelectRemoveList.length; i++) {
      if (isSelectRemoveList[i] == true) {
        isEmpty.add(i);
      }
    }
    if (isEmpty.isEmpty) {
      isSelected.value = false;
    }

    isSelectRemoveList.refresh();
  }

  bool isLoading = false;
  RxBool dataLoading = false.obs;
  RxInt pageNum = 1.obs;

  ScrollController scrollController = ScrollController();

  //===================Pagination Scroll Controller===============

  Future<void> addScrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      // loadMore();
    }
  }

  //==================================approved Booking req==================================

  approvedBooking() async {
    setRxRequestStatus(Status.loading);

    var response = await ApiClient.getData(ApiConstant.approvedBooking);

    if (response.statusCode == 200) {

      approvedBookingModel.value =
          List<Datum>.from(response.body["data"].map((x) => Datum.fromJson(x)));

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
