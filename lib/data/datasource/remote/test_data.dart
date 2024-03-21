import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/app_link.dart';

class TestData {
  Crud crud;
  TestData(this.crud);

  getdata() async {
    var response = await crud.postData(AppLink.test, {});
    response.fold((l) => l, (r) => r);
  }
}
