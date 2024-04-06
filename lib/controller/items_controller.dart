import 'package:ecommerce/data/model/categories_model.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  initData();
  changeCategoryItem(int index);
}

class ItemsControllerImp extends ItemsController {
  late List<CategoriesModel> categoriesModelList;
  late int selectedCat;
  @override
  initData() {
    selectedCat = Get.arguments['selectedCat'];
    categoriesModelList = Get.arguments['categoriesList'];
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  changeCategoryItem(int index) {
    selectedCat = index;
    update();
  }
}
