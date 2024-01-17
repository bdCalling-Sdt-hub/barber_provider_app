import 'dart:io';

import 'package:barbar_provider/helper/prefs_helper.dart';
import 'package:barbar_provider/service/api_ckeck.dart';
import 'package:barbar_provider/service/api_url.dart';
import 'package:barbar_provider/service/app_service.dart';
import 'package:barbar_provider/utils/app_constent.dart';
import 'package:barbar_provider/view/screens/profile/model/profile_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController with GetxServiceMixin {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  Rx<ProfileModel> profileModel = ProfileModel().obs;

  bool profileUpdateLoading = false;

  File? proImage;

  saveProfileID({required int iD}) {
    SharePrefsHelper.setInt(AppConstants.profileID, iD);
  }

  getProfileInfo() async {
    setRxRequestStatus(Status.loading);
    var response = await ApiClient.getData(ApiConstant.getProfile);

    if (response.statusCode == 200) {
      profileModel.value = ProfileModel.fromJson(response.body);
      saveProfileID(iD: profileModel.value.id!);
      setRxRequestStatus(Status.completed);

      debugPrint(
          "Profile Body====================${profileModel.value.address}");
    } else {
      if (response.statusText == ApiClient.noInternetMessage) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }

  updateProfile() async {
    profileUpdateLoading = true;
    update();

    var body = {
      "name": nameController.text,
      "email": emailController.text,
      "id": nameController.text,
      "phone_number": nameController.text,
      "address": nameController.text,
    };

    var response = await ApiClient.postMultipartData(
        ApiConstant.postCatalouge, body,
        multipartBody: [
          MultipartBody("UserImage", proImage!),
        ]);

    if (response.statusCode == 200) {
      getProfileInfo();
      navigator!.pop();
    } else {
      ApiChecker.checkApi(response);
    }

    profileUpdateLoading = false;
    update();
  }

  @override
  void onInit() {
    getProfileInfo();
    super.onInit();
  }
}
