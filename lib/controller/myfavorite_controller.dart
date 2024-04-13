import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/data/datasource/remote/myfavorite.dart';
import 'package:ecommerce/data/model/my_favorite_model.dart';
import 'package:get/get.dart';

abstract class MyFavoriteController extends GetxController {
  getData();
  deleteData(String favoriteId);
  initData();
}

class MyFavoriteControllerImp extends MyFavoriteController {
  MyFavoriteData myfavoriteData = MyFavoriteData(Get.find());
  StatusRequest statusRequest = StatusRequest.success;
  MyServices services = Get.find<MyServices>();
  late int id;
  List<MyFavoriteModel> data = [];
  RxInt count = 0.obs;

  @override
  initData() {
    id = services.sharePref.getInt(AppKey.usersId)!;
    getData();
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await myfavoriteData.getData(id.toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => MyFavoriteModel.fromJson(e)));
        count.value = data.length;
        print("-----------------");
        //  print(data);
      } else {
        statusRequest = StatusRequest.nodata;
      }
    }
    update();
  }

  @override
  deleteData(String favoriteId) {
    var response = myfavoriteData.delteData(favoriteId);
    statusRequest = handlingData(response);
    data.removeWhere((element) => element.favoriteId.toString() == favoriteId);
    count.value = data.length - 1;
    //statusRequest = StatusRequest.nodata;

    update();
  }
}
