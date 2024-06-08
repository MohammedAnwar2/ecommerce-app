import 'dart:developer';

import 'package:ecommerce/controller/mix_class_controller/serch_class_methods.dart';
import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/data/datasource/remote/home.dart';
import 'package:ecommerce/data/model/categories_model.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:ecommerce/data/model/strings_model.dart';
import 'package:ecommerce/routes/route_app.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class HomePageController extends SearchMethodMix {
  getData();
  goToItems(
      {required List<CategoriesModel> categoriesList,
      required int selectedCat});
  initData();
  goToMyFavorite();
  @override
  searchData();
  @override
  onClickSearch();
  @override
  onChangeSearch(String val);
  @override
  goToProductDetails(ItemModel itemModel);
}

class HomePageControllerImp extends HomePageController {
  MyServices services = Get.find<MyServices>();
  List<CategoriesModel> categoriesModelList = [];
  List<ItemModel> itemModelList = [];
  List<StringsModel> strings = [
    StringsModel(stringsBody: "", stringsTitle: "")
  ];
  HomeData homeData = HomeData(Get.find());
  late String lang;

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.postData();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        strings.clear();
        List data1 = response['strings'];
        log("$data1");
        strings.addAll(data1.map((e) => StringsModel.fromJson(e)));
        data1 = response['categories'];
        categoriesModelList
            .addAll(data1.map((e) => CategoriesModel.fromJson(e)));
        data1 = response['items'];
        itemModelList.addAll(data1.map((e) => ItemModel.fromJson(e)));
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
}
