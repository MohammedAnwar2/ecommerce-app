import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/app_link.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  postData(String category) async {
    var response = await crud.postData(
      AppLink.items,
      {
        "category": category,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
