import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/data/datasource/remote/items.dart';
import 'package:ecommerce/data/model/categories_model.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  initData();
  changeCategoryItem(int index);
  getData();
}

class ItemsControllerImp extends ItemsController {
  late List<CategoriesModel> categoriesModelList;
  late int selectedCat;

  List<ItemModel> itemModelList = [];
  ItemsData itemsData = ItemsData(Get.find());
  StatusRequest statusRequest = StatusRequest.success;

  @override
  initData() {
    selectedCat = Get.arguments['selectedCat'];
    categoriesModelList = Get.arguments['categoriesList'];
    getData();
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  changeCategoryItem(int index) {
    selectedCat = index;

    getData();
    update();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData
        .postData(categoriesModelList[selectedCat].categoriesName!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        itemModelList = [];
        for (var element in response['items']) {
          itemModelList.add(
            ItemModel.fromJson(element),
          );
        }
      } else {
        statusRequest = StatusRequest.nodata;
        // Get.defaultDialog(
        //     title: response['status'].tr, middleText: response['status']);
      }
    }

    update();
  }
}
