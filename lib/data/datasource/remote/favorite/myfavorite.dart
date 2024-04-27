import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/app_link.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);

  getData(String id) async {
    var response = await crud.postData(
      AppLink.viewFavorite,
      {"userId": id},
    );
    return response.fold((l) => l, (r) => r);
  }

  delteData(String id) async {
    var response = await crud.postData(
      AppLink.deleteFavorite,
      {
        "favoriteId": id,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
