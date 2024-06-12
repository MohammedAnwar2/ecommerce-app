import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/data/datasource/remote/cart/add_cart.dart';
import 'package:ecommerce/data/datasource/remote/cart/delete_cart.dart';
import 'package:get/get.dart';

class AddDeleteItemsCounter extends GetxController {
  AddCartData addCartData = AddCartData(Get.find());
  DeleteCartData deleteCartData = DeleteCartData(Get.find());
  StatusRequest statusRequest = StatusRequest.success;
  late int id;
  addData(String itemId, String itemprice) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addCartData.addCart(id.toString(), itemId, itemprice);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
      } else {
        statusRequest = StatusRequest.serverfailure;
      }
    }
    update();
  }

  deleteData(String itemId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await deleteCartData.deleteCart(id.toString(), itemId);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
      } else {
        statusRequest = StatusRequest.serverfailure;
      }
    }
    update();
  }
}
