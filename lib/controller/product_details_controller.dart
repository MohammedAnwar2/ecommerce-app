import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/data/datasource/remote/cart/add_cart.dart';
import 'package:ecommerce/data/datasource/remote/cart/delete_cart.dart';
import 'package:ecommerce/data/datasource/remote/cart/get_count_cart.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:ecommerce/route/route_app.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  initData();
  add();
  remove();
  goToCard();
  getCountData(String itemId);
}

class ProductDetailsControllerImp extends ProductDetailsController {
  StatusRequest statusRequest = StatusRequest.success;
  int count = 0;
  CoutCartData coutCartData = CoutCartData(Get.find());
  AddCartData addCartData = AddCartData(Get.find());
  DeleteCartData deleteCartData = DeleteCartData(Get.find());
  MyServices services = Get.find<MyServices>();
  late ItemModel itemModel;
  late int id;
  List<Map<String, dynamic>> colors = [
    {"name": "Red", "id": 1, "active": "0"},
    {"name": "Blue", "id": 2, "active": "1"},
    {"name": "Black", "id": 3, "active": "0"},
  ];
  @override
  initData() async {
    id = services.sharePref.getInt(AppKey.usersId)!;
    statusRequest = StatusRequest.loading;
    itemModel = Get.arguments['itemModel'];
    count = await getCountData(itemModel.itemsId.toString());
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  add() {
    count++;
    addData(itemModel.itemsId.toString());
    update();
  }

  @override
  remove() {
    if (count > 0) {
      count--;
      deleteData(itemModel.itemsId.toString());
    }
    update();
  }

  @override
  goToCard() {
    Get.offNamed(AppRoute.myCardScreen);
  }

  addData(String itemId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addCartData.addCart(id.toString(), itemId);
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

  @override
  getCountData(String itemId) async {
    var response = await coutCartData.getCartCount(id.toString(), itemId);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        int count = 0;
        count = response['count'];
        print("--------------------- $count");
        return count;
      } else {
        return 0;
      }
    }
    update();
  }
}
