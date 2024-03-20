import 'package:get/get.dart';

validationInput(
    {required String val,
    required int min,
    required int max,
    required String type}) {
  if (val.isEmpty) {
    return "can't be empyt";
  }
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "not valid username";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not valid email";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not valid phone number";
    }
  }
  // if (type == "password") {
  //   if (!GetUtils.ispa(val)) {
  //     return "not valid username";
  //   }
  // }

  if (val.length > max) {
    return "can't be greater than $max";
  }
  if (val.length < min) {
    return "can't be less than $min";
  }
}
