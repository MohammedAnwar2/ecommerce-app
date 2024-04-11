class AppLink {
  static const String server = "https://mohammedanwar.in/ecommerce";
  static const String image = "https://mohammedanwar.in/ecommerce/uploade";

  //-------------------------- Image ------------------------------
  static const String imageCategories = "$image/categories";
  static const String imageItem = "$image/item";
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
  //-------------------- Categories --------------------------
  //static const String viewCategories = "$server/categories/view.php";
  //-------------------- Home --------------------------
  static const String home = "$server/home.php";
  //-------------------- Items --------------------------
  static const String items = "$server/items.php";
  //-------------------- Favorite --------------------------
  // static const String favorite = "$server/favorite.php";
  static const String addFavorite = "$server/favorite/addFavorite.php";
  static const String removeFavorite = "$server/favorite/removeFavorite.php";
}
