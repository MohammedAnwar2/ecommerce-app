import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/data/datasource/remote/home.dart';
import 'package:ecommerce/data/datasource/remote/items/search.dart';
import 'package:ecommerce/data/model/categories_model.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:ecommerce/route/route_app.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class HomePageController extends GetxController {
  getData();
  searchData();
  goToItems(
      {required List<CategoriesModel> categoriesList,
      required int selectedCat});
  initData();
  goToMyFavorite();
  onClickSearch();
  onChangeSearch(String val);
  goToProductDetails(ItemModel itemModel);
}

class HomePageControllerImp extends HomePageController {
  MyServices services = Get.find<MyServices>();
  List<CategoriesModel> categoriesModelList = [];
  List<ItemModel> itemModelList = [];
  List<ItemModel> searchItemList = [];
  HomeData homeData = HomeData(Get.find());
  SearchItemsData searchItemData = SearchItemsData(Get.find());
  StatusRequest statusRequest = StatusRequest.success;
  late String lang;
  late TextEditingController search;
  bool isSearch = false;
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
    search = TextEditingController();
    lang = services.sharePref.getString(AppKey.language)!;
    getData();
  }

  @override
  goToMyFavorite() {
    Get.toNamed(AppRoute.myFavorite);
  }

  @override
  onChangeSearch(String val) {
    if (val == "") {
      isSearch = false;
      // searchData();
    }
    update();
  }

  @override
  onClickSearch() {
    isSearch = true;
    searchData();
    update();
  }

  @override
  searchData() async {
    searchItemList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await searchItemData.searchData(search.text);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List items = response['data'];
        searchItemList.addAll(items.map((e) => ItemModel.fromJson(e)));
      } else {
        // statusRequest = StatusRequest.nodata;
        // Get.defaultDialog(
        //     title: response['status'].tr, middleText: response['status']);
      }
    }
    update();
  }

  @override
  goToProductDetails(ItemModel itemModel) {
    Get.toNamed(
      AppRoute.productDetails,
      arguments: {
        "itemModel": itemModel,
      },
    );
  }
}
