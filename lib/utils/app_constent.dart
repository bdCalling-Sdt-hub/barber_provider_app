class AppConstants {
  static String bearerToken = "BearerToken";
  static String userId = "UserId";
  static String onBoard = "Onboard";

  /// <-------------- All Response Message Static---------->
  static String successfull = "Request Successfull";
  static String error = "Oops, something went wrong";
  static String secretKey =
      "sk_test_51NiWAKHloEqm4Hcr2bW9Od8OZL1ySHO48NmyqgylSNkvRfp3GRAtAPcgr0EldrlZQ5QbnrdPDOTlI8UmIGxv11di00HWChl1wB";
}

/// otp screen type

enum OptScreenType { signupotp, forgotOtp }

enum ContentPermission { pendingCreator, creator, user }

enum Status { loading, error, completed, internetError }
