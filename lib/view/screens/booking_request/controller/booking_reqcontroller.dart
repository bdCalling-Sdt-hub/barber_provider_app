import 'package:barbar_provider/service/api_ckeck.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/service/app_service.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/utils/snack_bar.dart';
import 'package:barbar_provider/view/screens/approved_booking/controller/approved_booking_controller.dart';
import 'package:barbar_provider/view/screens/booking_request/model/booking_req_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum UpdateBooking { accept, decline, late, complete }

class BookingRequestController extends GetxController {
  ApprovedBookingController approvedBookingController =
      Get.find<ApprovedBookingController>();

  final rxRequestStatus = Status.loading.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  RxList<Datum> bookingReqModel = <Datum>[].obs;

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

  //==================================Booking req==================================

  bookingReq() async {
    setRxRequestStatus(Status.loading);

    var response = await ApiClient.getData(ApiConstant.bookingReq);

    if (response.statusCode == 200) {
      bookingReqModel.value =
          List<Datum>.from(response.body["data"].map((x) => Datum.fromJson(x)));

      if (bookingReqModel.isNotEmpty) {
        currentPage = response.body['pagination']['current_page'];
        totalPage = response.body['pagination']['total_pages'];
      }

      //  bookingReqList.value = bookingReqModel.value.data!;
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

//==================Update Booking like Accept==1, Decline==4, Mark-as-late==3, complete==2=================

  Future<bool> updateBooking(
      {required String bookingID, required UpdateBooking updateBooking}) async {
    isLoading = true;
    update();

    var body = {
      "id": bookingID,
      "status": updateBooking == UpdateBooking.accept
          ? "1"
          : updateBooking == UpdateBooking.decline
              ? "4"
              : updateBooking == UpdateBooking.complete
                  ? "2"
                  : "3"
    };

    var response = await ApiClient.postData(ApiConstant.bookingReqUpdate, body);

    if (response.statusCode == 200) {
      toastMessage(message: "Success");

      approvedBookingController.approvedBooking();
      refreshBookingReq();
      isLoading = false;
      update();
      return true;
    } else {
      ApiChecker.checkApi(response);
      isLoading = false;
      update();
      return false;
    }
  }

  Future<bool> reSchedule(
      {required String id, required String date, required String time}) async {
    isLoading = true;
    update();

    var body = {
      "id": id,
      "date": date,
      "time": time,
    };

    var response = await ApiClient.postData(ApiConstant.reSchedule, body);

    if (response.statusCode == 200) {
      toastMessage(message: "Appointment Rescheduled");

      refreshBookingReq();
      isLoading = false;
      update();
      return true;
    } else {
      ApiChecker.checkApi(response);
      isLoading = false;
      update();
      return false;
    }
  }

//==================================Pagination============================

  var isLoadMoreRunning = false.obs;
  RxInt page = 1.obs;

  loadMore() async {
    debugPrint("===============load more=============");
    if (rxRequestStatus.value != Status.loading &&
        isLoadMoreRunning.value == false &&
        totalPage != currentPage) {
      isLoadMoreRunning(true);
      page.value += 1;

      Response response = await ApiClient.getData(
        "${ApiConstant.bookingReq}?page=$page",
      );
      currentPage = response.body['pagination']['current_page'];
      totalPage = response.body['pagination']['total_pages'];

      if (response.statusCode == 200) {
        var demoList = List<Datum>.from(
            response.body["data"].map((x) => Datum.fromJson(x)));
        bookingReqModel.addAll(demoList);

        bookingReqModel.refresh();
      } else {
        ApiChecker.checkApi(response);
      }
      isLoadMoreRunning(false);
    }
  }

//=====================refresh Booking==================
  refreshBookingReq() {
    bookingReqModel.clear();
    bookingReq();
    page.value = 1;
    refresh();
  }

  @override
  void onInit() {
    scrollController.addListener(addScrollListener);
    bookingReq();
    super.onInit();
  }
}
