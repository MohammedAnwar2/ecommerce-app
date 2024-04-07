import 'package:ecommerce/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  initData();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  late ItemModel itemModel;
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
