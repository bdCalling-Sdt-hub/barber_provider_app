import 'package:barbar_provider/service/api_ckeck.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/service/app_service.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/view/screens/clients_reviews/model/client_review_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientReviewController extends GetxController with GetxServiceMixin {
  final rxRequestStatus = Status.loading.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  String totalReview = "";
  String averageRating = "";

  var totalPage = 0;
  var currentPage = 0;

  //=======================================Getting the Review Information==========================

  RxList<Datum> rattingList = <Datum>[].obs;

  review() async {
    setRxRequestStatus(Status.loading);

    var response = await ApiClient.getData(ApiConstant.review);

    if (response.statusCode == 200) {
      rattingList.value = List<Datum>.from(response
          .body["service_details_with_user"]["data"]
          .map((x) => Datum.fromJson(x)));

      totalReview = response.body["total_review"].toString();
      averageRating = response.body["average_rating"].toString();

      if (rattingList.isNotEmpty) {
        currentPage =
            response.body['service_details_with_user']['current_page'];
        totalPage = response.body['service_details_with_user']['last_page'];
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

  //===========================Pagination Scroll Controller=======================

  ScrollController scrollController = ScrollController();

  Future<void> addScrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      loadMore();
    }
  }

  //==================================Pagination=================================

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
        "${ApiConstant.review}?page=$page",
      );

      currentPage = response.body['service_details_with_user']['current_page'];
      totalPage = response.body['service_details_with_user']['last_page'];

      if (response.statusCode == 200) {
        var demoList = List<Datum>.from(response
            .body["service_details_with_user"]
            .map((x) => Datum.fromJson(x)));

        rattingList.addAll(demoList);

        rattingList.refresh();
      } else {
        ApiChecker.checkApi(response);
      }
      isLoadMoreRunning(false);
    }
  }

  List<Map<String, dynamic>> rattingDesign = [
    {
      "ratting": 5,
      "height": 150.0,
    },
    {
      "ratting": 4,
      "height": 130.0,
    },
    {
      "ratting": 3,
      "height": 110.0,
    },
    {
      "ratting": 2,
      "height": 90.0,
    },
    {
      "ratting": 1,
      "height": 70.0,
    },
  ];
  @override
  void onInit() {
    scrollController.addListener(addScrollListener);
    review();
    super.onInit();
  }
}
