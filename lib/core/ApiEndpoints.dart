var baseUrl = "https://getmeacard.com/club_npc/index.php";

class ApiEndpoints {
  static String registerUser = "$baseUrl/user/create-user";
  static String OTP_register_User = "$baseUrl/verify-otp";
  static String signInUser = "$baseUrl/login";
  static String ContactDetails = "$baseUrl/user-details";
  static String forgotPassword = "$baseUrl/forget-password";
  static String changePassword = "$baseUrl/change-password";
  static String dashboardData = "$baseUrl/dashboard/";
  static String SettingPostApi = "$baseUrl/update-profile";
  static String SettingGetApi = "$baseUrl/edit-profile/";
}
