import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/app_link.dart';

class SearchFavoriteItemsData {
  Crud crud;
  SearchFavoriteItemsData(this.crud);

  searchData(String itemName) async {
    var response = await crud.postData(
      AppLink.favoriteSearch,
      {
        "itemName": itemName,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
