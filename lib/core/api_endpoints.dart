abstract class ApiEndpoints {
  static const String adminSignup = "/auth/adminsignup";
  static const String organizationSignup = "/auth/organisationsignup";
  static const String verifyOtp = "/auth/verify-otp";
  static const String forgotPasswordSendEmail = "http://localhost:5000/api/auth/forgot-password";
  static const String verifyForgotPasswordOTP = "http://localhost:5000/api/auth/verify-user";
  static const String resetPassword = "http://localhost:5000/api/auth/reset-password";
}
