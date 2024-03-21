import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/app_link.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);

  postData(String username, String email, String phone, String password) async {
    var response = await crud.postData(AppLink.signup, {
      "username": username,
      "email": email,
      "phone": phone,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
