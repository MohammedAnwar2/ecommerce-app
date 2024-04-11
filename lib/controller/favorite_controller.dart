import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/data/datasource/remote/favorite_data.dart';
import 'package:get/get.dart';

abstract class FavoriteController extends GetxController {
  updateFavoriteState({required int itemId, required int favoriteVal});
  // upateFavoriteInBackend({required int itemId});
  addFavoriteInBackend({required int itemId});
  removeFavoriteInBackend({required int itemId});
  initData();
}

class FavoriteControllerImp extends FavoriteController {
  Map isFavorite = {};
  FavoriteData favoriteData = FavoriteData(Get.find());
  StatusRequest statusRequest = StatusRequest.success;
  MyServices services = Get.find<MyServices>();
  late int id;
  @override
  updateFavoriteState({required int itemId, required int favoriteVal}) {
    isFavorite[itemId] = favoriteVal;
    update();
  }

  @override
  initData() {
    id = services.sharePref.getInt(AppKey.usersId)!;
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  addFavoriteInBackend({required int itemId}) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await favoriteData.addFavorite(id.toString(), itemId.toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        print("add");
      } else {
        print("wrong add");
        // statusRequest = StatusRequest.nodata;
      }
    }
    update();
  }

  @override
  removeFavoriteInBackend({required int itemId}) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await favoriteData.removeFavorite(id.toString(), itemId.toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        print("delete");
      } else {
        print("wrong delete");
        // statusRequest = StatusRequest.nodata;
      }
    }
    update();
  }

  // @override
  // upateFavoriteInBackend({required int itemId}) async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response =
  //       await favoriteData.postData(id.toString(), itemId.toString());
  //   statusRequest = handlingData(response);
  //   if (statusRequest == StatusRequest.success) {
  //     if (response['status'] == 'success') {
  //     } else {
  //       // statusRequest = StatusRequest.nodata;
  //     }
  //   }
  //   update();
  // }
}
