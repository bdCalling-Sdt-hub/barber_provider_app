import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProviderController extends GetxController {
  TextEditingController buisnessName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController description = TextEditingController();

  List<Map<String, dynamic>> selectedServiceHours = [];
  File? coverPhoto;
  File? galleryPhoto;

  void openGallery({required bool isCoverPhoto}) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      if (isCoverPhoto) {
        coverPhoto = File(pickedFile.path);
      } else {
        galleryPhoto = File(pickedFile.path);
      }

      update();
    }
  }
}
