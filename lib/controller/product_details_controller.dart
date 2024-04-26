import 'package:ecommerce/controller/my_card_controller.dart';
import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:ecommerce/route/route_app.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  initData();
  updateCount();
  add();
  remove();
  goToCard();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  MyCardControllerImp cartController = Get.put(MyCardControllerImp());
  StatusRequest statusRequest = StatusRequest.success;
  int count = 0;
  late ItemModel itemModel;
  List<Map<String, dynamic>> colors = [
    {"name": "Red", "id": 1, "active": "0"},
    {"name": "Blue", "id": 2, "active": "1"},
    {"name": "Black", "id": 3, "active": "0"},
  ];
  @override
  initData() async {
    statusRequest = StatusRequest.loading;
    itemModel = Get.arguments['itemModel'];
    count = await cartController.getCountData(itemModel.itemsId.toString());
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  updateCount() async {}

  @override
  add() {
    count++;
    cartController.addData(itemModel.itemsId.toString());
    update();
  }

  @override
  remove() {
    if (count > 0) {
      count--;
      cartController.deleteData(itemModel.itemsId.toString());
    }
    update();
  }

  @override
  goToCard() {
    cartController.refreshView();
    Get.offNamed(AppRoute.myCardScreen);
  }
}
