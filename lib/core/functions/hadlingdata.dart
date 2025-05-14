import 'package:ecommerce/core/class/sratus_request.dart';

handlingData(response) {
  if (response is StatusRequest) {
    print("status request == ${response.toString()}");
    return response;
  } else {
    return StatusRequest.success;
  }
}
