import 'package:ecommerce/controller/mix_class_controller/search_class_methods.dart';
import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/data/datasource/remote/items/items.dart';
import 'package:ecommerce/data/datasource/remote/items/notifyme.dart';
import 'package:ecommerce/data/model/categories_model.dart';
import 'package:ecommerce/data/model/items_model.dart';
import 'package:ecommerce/routes/route_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin ItemsControllerMethod {
  initData();
  changeCategoryItem(int index);
  getData(String categoriesId);
  goToMyFavorite();
  updateNotifyMeState({required int itemId, required int notifyMeState});
  updateNotifyMeInBackend({required int itemId});
  refereshItemsPage();
}

mixin ItemsControllerVaraible {
  late List<CategoriesModel> categoriesModelList;
  MyServices services = Get.find<MyServices>();
  late int selectedCat;
  late int id;
  List<ItemModel> itemModelList = [];
  ItemsData itemsData = ItemsData(Get.find());
  NotifymeData notifymeData = NotifymeData(Get.find());
  bool hideListItems = false;
  Map isNotify = {};
}

class ItemsControllerImp extends SearchMethodMix
    with ItemsControllerVaraible, ItemsControllerMethod {
  @override
  searchData();
  @override
  onClickSearch();
  @override
  onChangeSearch(String val);
  @override
  goToProductDetails(ItemModel itemModel);
//*------------------------------------------
//*------------------------------------------
  @override
  updateNotifyMeState({required int itemId, required int notifyMeState}) {
    isNotify[itemId] = notifyMeState;
    update();
  }

  @override
  updateNotifyMeInBackend({required int itemId}) {
    notifymeData.notifyMe(itemId.toString(), id.toString());
  }

  @override
  initData() {
    search = TextEditingController();
    selectedCat = Get.arguments['selectedCat'];
    categoriesModelList = Get.arguments['categoriesList'];
    id = services.sharePref.getInt(AppKey.usersId)!;
    getData(categoriesModelList[selectedCat].categoriesId.toString());
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  changeCategoryItem(int index) {
    selectedCat = index;
    getData(categoriesModelList[selectedCat].categoriesId.toString());
    update();
  }

  @override
  getData(String categoriesId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.postData(categoriesId, id.toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        itemModelList.clear();
        List data = response['data'];
        itemModelList.addAll(data.map((e) => ItemModel.fromJson(e)));
        for (int i = 0; i < itemModelList.length; i++) {
          updateNotifyMeState(
              itemId: itemModelList[i].itemsId!,
              notifyMeState: itemModelList[i].itemsIsnotify!);
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
  goToMyFavorite() {
    Get.toNamed(AppRoute.myFavorite);
  }

  @override
  refereshItemsPage() async {
    await getData(categoriesModelList[selectedCat].categoriesId.toString());
  }
}
