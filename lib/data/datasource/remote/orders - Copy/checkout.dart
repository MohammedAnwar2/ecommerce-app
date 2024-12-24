import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/app_link.dart';

class CheckoutData {
  Crud crud;
  CheckoutData(this.crud);

  checkout(
      int userId,
      String paymentmethod,
      String addressId,
      String orderstype,
      String pricedelivery,
      String ordersprice,
      String discount,
      String couponid) async {
    var response = await crud.postData(AppLink.checkout, {
      "userId": userId.toString(),
      "paymentmethod": paymentmethod,
      "addressId": addressId,
      "orderstype": orderstype,
      "pricedelivery": pricedelivery,
      "ordersprice": ordersprice,
      "discount": discount,
      "couponid": couponid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
