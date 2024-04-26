import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/app_link.dart';

class SearchItemsData {
  Crud crud;
  SearchItemsData(this.crud);

  searchData(String itemName) async {
    var response = await crud.postData(
      AppLink.search,
      {
        "itemName": itemName,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
