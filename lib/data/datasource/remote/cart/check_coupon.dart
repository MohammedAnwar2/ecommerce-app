import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/app_link.dart';

class CheckCouponData {
  Crud crud;
  CheckCouponData(this.crud);

  checkCoupon(String couponName) async {
    var response = await crud.postData(
      AppLink.checkCoupon,
      {
        "couponName": couponName,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
