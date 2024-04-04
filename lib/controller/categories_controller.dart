import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/data/datasource/remote/home.dart';
import 'package:ecommerce/data/model/categories_model.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class CategoriesController extends GetxController {
  getData();
}

class CategoriesControllerImp extends CategoriesController {
  List<CategoriesModel> categoriesModelList = [];
  List<ItemModel> itemModelList = [];
  HomeData homeData = HomeData(Get.find());
  StatusRequest statusRequest = StatusRequest.success;
  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.postData();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        for (var element in response['categories']) {
          categoriesModelList.add(CategoriesModel.fromJson(element));
        }
        for (var element in response['items']) {
          itemModelList.add(ItemModel.fromJson(element));
        }
      } else {
        statusRequest = StatusRequest.nodata;
        // Get.defaultDialog(
        //     title: response['status'].tr, middleText: response['status']);
      }
    }
    print("----------------items------------------------");

    print(itemModelList[0].itemsName);
    print(itemModelList[1].itemsName);
    print(itemModelList[2].itemsName);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
