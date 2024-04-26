import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/constant/app_keys.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/core/services/service.dart';
import 'package:ecommerce/data/datasource/remote/cart/add_cart.dart';
import 'package:ecommerce/data/datasource/remote/cart/delete_cart.dart';
import 'package:ecommerce/data/datasource/remote/cart/get_count_cart.dart';
import 'package:ecommerce/data/datasource/remote/cart/view_all_cart_products.dart';
import 'package:ecommerce/data/model/view_cart_all_products.dart';
import 'package:get/get.dart';

abstract class MyCardController extends GetxController {
  addData(String itemId);
  deleteData(String itemId);
  getCountData(String itemId);
  viewAllCartProducts();
  initData();
  resetView();
  refreshView();
}

class MyCardControllerImp extends MyCardController {
  AddCartData addCartData = AddCartData(Get.find());
  CoutCartData coutCartData = CoutCartData(Get.find());
  DeleteCartData deleteCartData = DeleteCartData(Get.find());
  ViewCartData viewCartData = ViewCartData(Get.find());
  StatusRequest statusRequest = StatusRequest.success;
  MyServices services = Get.find<MyServices>();
  late int id;
  List<ViewCartProductsModel> data = [];
  double totalprice = 0.0;
  String totalcount = "";

  @override
  initData() {
    id = services.sharePref.getInt(AppKey.usersId)!;
    viewAllCartProducts();
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  addData(String itemId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addCartData.addCart(id.toString(), itemId);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
      } else {
        statusRequest = StatusRequest.serverfailure;
      }
    }
    update();
  }

  @override
  deleteData(String itemId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await deleteCartData.deleteCart(id.toString(), itemId);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
      } else {
        statusRequest = StatusRequest.serverfailure;
      }
    }
    update();
  }

  @override
  getCountData(String itemId) async {
    var response = await coutCartData.getCartCount(id.toString(), itemId);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        int count = 0;
        count = response['count'];
        print("--------------------- $count");
        return count;
      } else {
        return 0;
      }
    }
    update();
  }

  @override
  viewAllCartProducts() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await viewCartData.viewAllCartProducts(id.toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List alldata = response['datacart'];
        List countprice = response['countprice'];
        data.addAll(alldata.map((e) => ViewCartProductsModel.fromJson(e)));
        totalprice = countprice[0]["totalprice"];
        totalcount = countprice[0]["totalcount"];
      } else {
        statusRequest = StatusRequest.nodata;
      }
    }
    update();
  }

  @override
  refreshView() {
    resetView();
    viewAllCartProducts();
  }

  @override
  resetView() {
    data.clear();
    totalcount = "";
    totalprice = 0;
  }
}
