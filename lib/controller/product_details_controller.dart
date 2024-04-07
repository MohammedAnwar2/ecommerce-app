import 'package:ecommerce/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  initData();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  late ItemModel itemModel;
  List<Map<String, dynamic>> colors = [
    {"name": "Red", "id": 1, "active": "0"},
    {"name": "Blue", "id": 2, "active": "1"},
    {"name": "Black", "id": 3, "active": "0"},
  ];
  @override
  initData() {
    itemModel = Get.arguments['itemModel'];
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
