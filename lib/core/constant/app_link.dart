class AppLink {
  static const String server = "https://mohammedanwar.in/ecommerce";

  //-------------------------- Auth ------------------------------
  static const String signup = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verifyCodeSignUp = "$server/auth/verifycode.php";
  static const String resentVerifycode = "$server/auth/resent_verifycode.php";
  //-------------------- Forget Password --------------------------
  static const String checkEmail = "$server/forgetpassword/check_email.php";
  static const String verifyCodeForgetPassword =
      "$server/forgetpassword/verify_code.php";
  static const String resetPassword =
      "$server/forgetpassword/reset_password.php";
}
