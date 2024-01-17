class ApiConstant {
  static const baseUrl = "http://192.168.10.121:8000/";

  //===================Auth=========================
  //=========Sign UP==========
  static const register = "api/register";
  static const verified = "api/verified";
  static const resendOtp = "api/resendOtp";

  //=========Sign IN==========
  static const login = "api/login";

  //===================Home Screen=========================
  static const showCategory = "api/show-category";

  //===================Provider=========================
  static const addProvider = "api/post/provider";

  //===================Post Service=========================
  static const postService = "api/post/service?";

  //===================Post Catalouge=========================
  static const postCatalouge = "api/post/catalouge";

  //===================Profile=========================
  static const getProfile = "api/profile";
  static const profileUpdate = "api/profileUpdate";

  //===================Post Catalouge=========================
  static const home = "api/get/provider";
}
