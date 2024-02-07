import 'package:barbar_provider/service/api_ckeck.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/service/app_service.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/utils/snack_bar.dart';
import 'package:barbar_provider/view/screens/booking_request/model/booking_req_model.dart';
import 'package:get/get.dart';

enum UpdateBooking { accept, decline, late, complete }

class BookingRequestController extends GetxController with GetxServiceMixin {
  final rxRequestStatus = Status.loading.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  Rx<BookingReqModel> bookingReqModel = BookingReqModel().obs;

  List<Datum> bookingReqList = [];

  bool isLoading = false;
  //==================================Booking req==================================

  bookingReq() async {
    setRxRequestStatus(Status.loading);

    var response = await ApiClient.getData(ApiConstant.bookingReq);

    if (response.statusCode == 200) {
      bookingReqModel.value = BookingReqModel.fromJson(response.body);

      bookingReqList = bookingReqModel.value.data!;
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

  refreshBookingReq() {
    bookingReq();
  }
  //==================Update Booking like Accept==1, Decline==4, Mark-as-late==3, complete==2  =================

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
      toastMessage(message: "Booking Accepted");
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

  @override
  void onInit() {
    bookingReq();
    super.onInit();
  }
}
