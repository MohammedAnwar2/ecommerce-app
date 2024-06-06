class AppLink {
  static const String server = "https://mohammedanwar.in/ecommerce";
  static const String image = "https://mohammedanwar.in/ecommerce/uploade";

  //*-------------------------- Image ------------------------------
  static const String imageCategories = "$image/categories";
  static const String imageItem = "$image/item";
  //*-------------------------- Auth ------------------------------
  static const String signup = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verifyCodeSignUp = "$server/auth/verifycode.php";
  static const String resentVerifycode = "$server/auth/resent_verifycode.php";
  //*-------------------- Forget Password --------------------------
  static const String checkEmail = "$server/forgetpassword/check_email.php";
  static const String verifyCodeForgetPassword =
      "$server/forgetpassword/verify_code.php";
  static const String resetPassword =
      "$server/forgetpassword/reset_password.php";
  //*-------------------- Categories --------------------------
  //?static const String viewCategories = "$server/categories/view.php";
  //*-------------------- Home --------------------------
  static const String home = "$server/home.php";
  //*-------------------- Items --------------------------
  static const String items = "$server/items/items.php";
  static const String itemsSearch = "$server/items/search.php";
  //*-------------------- Favorite --------------------------
  //* static const String favorite = "$server/favorite.php";
  static const String addFavorite = "$server/favorite/addFavorite.php";
  static const String removeFavorite = "$server/favorite/removeFavorite.php";
  static const String viewFavorite = "$server/favorite/viewFavorite.php";
  static const String deleteFavorite = "$server/favorite/deleteFavorite.php";
  static const String favoriteSearch = "$server/favorite/search.php";
  //*-------------------- Cart --------------------------
  static const String addCart = "$server/cart/addCart.php";
  static const String deleteCart = "$server/cart/deleteCart.php";
  static const String viewCart = "$server/cart/viewCart.php";
  static const String getCountItems = "$server/cart/getCountItems.php";
  //*------------------- Address -----------------------
  static const String addAdress = "$server/address/add.php";
  static const String editAdress = "$server/address/edit.php";
  static const String viewAdress = "$server/address/view.php";
  static const String deleteAdress = "$server/address/delete.php";
  //*------------------- Coupon -------------------------
  static const String checkCoupon = "$server/coupon/checkCoupon.php";
  //*------------------- Orders -------------------------
  static const String checkout = "$server/orders/checkout.php";
  static const String pending = "$server/orders/pending.php";
  static const String archive = "$server/orders/archive.php";
  //*------------------- Notification -------------------------
  static const String viewNotifications = "$server/notification/view.php";
  static const String deleteNotifications = "$server/notification/delete.php";
}
