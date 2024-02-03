import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as loc;

class LocationController extends GetxController {
  bool addressLoading = false;
  loc.LocationData? locationData;

  Future getLocation() async {
    try {
      addressLoading = true;
      update();
      locationData = await loc.Location.instance.getLocation();

      // var locationData = loc.LocationData.fromMap({
      //   'latitude' : 44.2423649,
      //   'longitude' : -119.8093025
      //  });

      debugPrint(
          "Latitute====================================${locationData!.latitude}");
      debugPrint(
          "Longitude====================================${locationData!.longitude}");
    } catch (error) {
      addressLoading = false;
      update();
      //Get.snackbar("Error", error.toString());
    }
  }

  @override
  void onInit() {
    getLocation();
    super.onInit();
  }
}
