import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/data/datasource/remote/home.dart';
import 'package:ecommerce/data/model/categories_model.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:ecommerce/route/route_app.dart';
import 'package:get/get.dart';

abstract class HomePageController extends GetxController {
  getData();
  goToItems(
      {required List<CategoriesModel> categoriesList,
      required int selectedCat});
  initData();
}

class HomePageControllerImp extends HomePageController {
  MyServices services = Get.find<MyServices>();
  List<CategoriesModel> categoriesModelList = [];
  List<ItemModel> itemModelList = [];
  HomeData homeData = HomeData(Get.find());
  StatusRequest statusRequest = StatusRequest.success;
  late String lang;

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

    update();
  }

  @override
  void onInit() {
    getData();
    initData();
    super.onInit();
  }

  @override
  goToItems({required categoriesList, required selectedCat}) {
    Get.toNamed(
      AppRoute.items,
      arguments: {
        "categoriesList": categoriesList,
        "selectedCat": selectedCat,
      },
    );
  }

  @override
  initData() {
    lang = services.sharePref.getString(AppKey.language)!;
  }
}
