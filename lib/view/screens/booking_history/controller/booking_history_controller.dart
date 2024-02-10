import 'package:barbar_provider/service/api_ckeck.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/service/app_service.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/view/screens/booking_history/model/booking_history_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingHistoryController extends GetxController {
  final rxRequestStatus = Status.loading.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  RxList<Datum> bookingHistoryModel = <Datum>[].obs;

  var totalPage = 0;
  var currentPage = 0;

  bool isLoading = false;

  ScrollController scrollController = ScrollController();

  //===================Pagination Scroll Controller===============

  Future<void> addScrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      loadMore();
    }
  }

  //=================================Booking History===========================

  bookingHistory() async {
    setRxRequestStatus(Status.loading);

    var response = await ApiClient.getData(ApiConstant.bookingHistory);

    if (response.statusCode == 200) {
      bookingHistoryModel.value =
          List<Datum>.from(response.body["data"].map((x) => Datum.fromJson(x)));

      if (bookingHistoryModel.isNotEmpty) {
        currentPage = response.body['pagination']['current_page'];
        totalPage = response.body['pagination']['total_pages'];
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

//==================================Pagination Load More Data============================

  var isLoadMoreRunning = false.obs;
  RxInt page = 1.obs;

  loadMore() async {
    debugPrint(
        "============================>>>>>>>>>load more Booking History");
    if (rxRequestStatus.value != Status.loading &&
        isLoadMoreRunning.value == false &&
        totalPage != currentPage) {
      isLoadMoreRunning(true);
      page.value += 1;

      Response response = await ApiClient.getData(
        "${ApiConstant.approvedBooking}?page=$page",
      );
      currentPage = response.body['pagination']['current_page'];
      totalPage = response.body['pagination']['total_pages'];

      if (response.statusCode == 200) {
        var demoList = List<Datum>.from(
            response.body["data"].map((x) => Datum.fromJson(x)));
        bookingHistoryModel.addAll(demoList);

        bookingHistoryModel.refresh();
      } else {
        ApiChecker.checkApi(response);
      }
      isLoadMoreRunning(false);
    }
  }

//=================================refresh Approved Booking===============================

  refreshBookingHistory() {
    page = 1.obs;
    bookingHistoryModel.clear();
    bookingHistory();
  }

//==============================Get Booking Status======================

  String bookingStatus({required int bookingStatus}) {
    if (bookingStatus == 0) {
      return "Pending";
    } else if (bookingStatus == 1) {
      return "Approved";
    } else if (bookingStatus == 2) {
      return "Complete";
    } else if (bookingStatus == 3) {
      return "Late";
    } else {
      return "Decline";
    }
  }

  @override
  void onInit() {
    scrollController.addListener(addScrollListener);
    bookingHistory();
    super.onInit();
  }
}
