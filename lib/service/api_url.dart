class ApiConstant {
  static const baseUrl = "http://192.168.10.121:8000/";

  //===================Auth===============================
  //=========Sign UP==========
  static const register = "api/register";
  static const verified = "api/verified";
  static const resendOtp = "api/resendOtp";

  //=========Sign IN==========
  static const login = "api/login";
  static const resetPassword = "api/reset-password";

  //===================Home Screen=========================
  static const showCategory = "api/category-search/";

  //===================Provider=========================
  static const addProvider = "api/post/provider";
  static const updateProvider = "api/update/provider";

  //===================Post Service=========================
  static const postService = "api/post/service";
  static const updateService = "api/post/update/service";

  //===================Post Catalouge=========================
  static const postCatalouge = "api/post/catalouge";

  //===================Profile=========================
  static const getProfile = "api/profile";
  static const profileUpdate = "api/profileUpdate";

  //===================Post Catalouge=========================
  static const home = "api/get/provider";

  //===================Settings=========================
  static const logOut = "api/logout";
  static const changePassword = "api/change-password";
  static const aboutPrivacyTerms = "api/show-website-pages";

  //===================Service Details=========================
  static const serviceDetails = "api/service/details/";
}
