import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/app_link.dart';

class RessetPasswordData {
  Crud crud;
  RessetPasswordData(this.crud);

  postData(String password, String email) async {
    var response = await crud.postData(AppLink.resetPassword, {
      "password": password,
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
