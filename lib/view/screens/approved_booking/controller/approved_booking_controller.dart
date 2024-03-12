import 'package:barbar_provider/service/api_ckeck.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/service/app_service.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/view/screens/approved_booking/model/approved_booking_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApprovedBookingController extends GetxController {
  final rxRequestStatus = Status.loading.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  RxList<Datum> approvedBookingModel = <Datum>[].obs;

  var totalPage = 0;
  var currentPage = 0;

  ScrollController scrollController = ScrollController();

  //===================Pagination Scroll Controller===============

  Future<void> addScrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      loadMore();
    }
  }

  //==================================Get Approved Booking req==================================

  approvedBooking() async {
    setRxRequestStatus(Status.loading);

    var response = await ApiClient.getData(ApiConstant.approvedBooking);

    if (response.statusCode == 200) {
      page = 1;
      approvedBookingModel.value =
          List<Datum>.from(response.body["data"].map((x) => Datum.fromJson(x)));

      if (approvedBookingModel.isNotEmpty) {
        currentPage = response.body['pagination']['current_page'];
        totalPage = response.body['pagination']['last_page'];
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

//==================================Pagination============================

  var isLoadMoreRunning = false.obs;
  int page = 1;

  loadMore() async {
    debugPrint(
        "============================>>>>>>>>>load more Approved Booking");
    if (rxRequestStatus.value != Status.loading &&
        isLoadMoreRunning.value == false &&
        totalPage != currentPage) {
      isLoadMoreRunning(true);
      page += 1;

      Response response = await ApiClient.getData(
        "${ApiConstant.approvedBooking}?page=$page",
      );
      currentPage = response.body['pagination']['current_page'];
      totalPage = response.body['pagination']['last_page'];

      if (response.statusCode == 200) {
        var demoList = List<Datum>.from(
            response.body["data"].map((x) => Datum.fromJson(x)));
        approvedBookingModel.addAll(demoList);

        approvedBookingModel.refresh();
      } else {
        ApiChecker.checkApi(response);
      }
      isLoadMoreRunning(false);
    }
  }

//=====================refresh Approved Booking==================

  refreshApprovedBooking() {
    page = 1;
    approvedBookingModel.clear();
    approvedBooking();
  }

  @override
  void onInit() {
    approvedBooking();
    scrollController.addListener(addScrollListener);
    super.onInit();
  }
}
