import 'dart:convert';
import 'dart:io';
import 'package:barbar_provider/core/app_route/app_route.dart';
import 'package:barbar_provider/helper/prefs_helper.dart';
import 'package:barbar_provider/service/api_ckeck.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/service/app_service.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/utils/snack_bar.dart';
import 'package:barbar_provider/view/screens/home/controller/home_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProviderController extends GetxController {
  List<Map<String, dynamic>> days = [
    {"day": "Sun", "start": TimeOfDay.now(), "end": TimeOfDay.now()},
    {"day": "Mon", "start": TimeOfDay.now(), "end": TimeOfDay.now()},
    {"day": "Tue", "start": TimeOfDay.now(), "end": TimeOfDay.now()},
    {"day": "Wed", "start": TimeOfDay.now(), "end": TimeOfDay.now()},
    {"day": "Thu", "start": TimeOfDay.now(), "end": TimeOfDay.now()},
    {"day": "Fri", "start": TimeOfDay.now(), "end": TimeOfDay.now()},
    {"day": "Sat", "start": TimeOfDay.now(), "end": TimeOfDay.now()},
  ];
  TextEditingController buisnessNameController =
      TextEditingController(text: kDebugMode ? "Shanto Salon" : "");
  TextEditingController addressController =
      TextEditingController(text: kDebugMode ? "Demra Stuf Quater" : "");
  TextEditingController descriptionController = TextEditingController(
      text: kDebugMode
          ? "Moye Moye Salon, Very Cheap. The place you get your hair cut. A salon is a good place to get a perm or highlights, to get your nails painted, or just to get a trim. A salon is like a barber shop, only fancier"
          : "");
  HomeController homeController = Get.find<HomeController>();
  List<Map<String, dynamic>> selectedServiceHours = [];
  File? coverPhoto;
  File? galleryPhoto;

  String catId = "";

  // final rxRequestStatus = Status.loading.obs;
  // void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  bool isLoading = false;
  void openGallery({required bool isCoverPhoto}) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      if (isCoverPhoto) {
        coverPhoto = File(pickedFile.path);
        debugPrint("Cover Photo======================$coverPhoto");
      } else {
        galleryPhoto = File(pickedFile.path);
        debugPrint("Gallery Photo======================$galleryPhoto");
      }
    }
    update();
  }

  getServiceDate({
    required String getCatId,
  }) {
    Get.toNamed(AppRoute.addPhotos);

    //======================Formatting the time======================

    String formatTimeOfDay(TimeOfDay time) {
      final hour = time.hour.toString().padLeft(2, '0');
      final minute = time.minute.toString().padLeft(2, '0');
      return '$hour:$minute';
    }

    //======================Getting the Json of Date======================
    for (var data in days) {
      selectedServiceHours.add({
        "Day": data["day"],
        "Start Time": formatTimeOfDay(data["start"]),
        "End Time": formatTimeOfDay(data["end"]),
      });
    }

    catId = getCatId;

    update();

    debugPrint("Selected Service Hours=========$selectedServiceHours");
    debugPrint("Cat Id=========$catId");
  }

  addProvider() async {
    isLoading = true;
    update();

    if (coverPhoto != null && galleryPhoto != null) {
      var body = {
        "catId": catId.toString(),
        "businessName": buisnessNameController.text,
        "address": addressController.text,
        "description": descriptionController.text,
        "serviceOur": selectedServiceHours.toString(),
      };

      var response = await ApiClient.postMultipartData(
          ApiConstant.addProvider, body,
          multipartBody: [
            MultipartBody("coverPhoto", coverPhoto!),
            MultipartBody("photoGellary[]", galleryPhoto!),
          ]);

      if (response.statusCode == 200) {
        homeController.homeData();

        var jSONData = jsonDecode(response.body);
        debugPrint(
            "Provider ID========================${jSONData["message"]["id"]}");
        SharePrefsHelper.setString(AppConstants.catID, catId);
        SharePrefsHelper.setString(
            AppConstants.providerID, jSONData["message"]["id"].toString());

        debugPrint(
            "selectedServiceHours========================$selectedServiceHours");
        debugPrint("catIDShaPre========================$catId");

        Get.offAllNamed(AppRoute.addServiceDetails);
      } else {
        ApiChecker.checkApi(response);
      }
    } else {
      showCustomSnackBar("Pick image");
    }

    isLoading = false;
    update();
  }
}
