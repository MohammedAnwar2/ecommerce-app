import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/data/datasource/remote/categories.dart/view_all_categories.dart';
import 'package:ecommerce/data/model/categories_model.dart';
import 'package:get/get.dart';

abstract class CategoriesController extends GetxController {
  storeData();
}

class CategoriesControllerImp extends CategoriesController {
  List<CategoriesModel> categoriesModelList = [];
  ViewCategories viewCategories = ViewCategories(Get.find());
  StatusRequest statusRequest = StatusRequest.success;
  @override
  storeData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await viewCategories.postData();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        for (var element in response['data']) {
          categoriesModelList.add(CategoriesModel.fromJson(element));
        }
      } else {
        statusRequest = StatusRequest.nodata;
        // Get.defaultDialog(
        //     title: response['status'].tr, middleText: response['status']);
      }
    }
    update();
  }

  @override
  void onInit() {
    storeData();
    super.onInit();
  }
}
