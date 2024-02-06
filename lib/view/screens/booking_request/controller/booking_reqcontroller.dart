import 'package:get/get.dart';

enum UpdateBooking { accept, decline, late }

class BookingRequestController extends GetxController {
  //==================Update Booking like Accept, Decline, Mark-as-late=================

  updateBooking(
      {required String bookingID, required UpdateBooking updateBooking}) {}
}
