import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/app_link.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);

  addFavorite(String userId, String itemId) async {
    var response = await crud.postData(
      AppLink.addFavorite,
      {
        "usersId": userId,
        "itemsId": itemId,
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String userId, String itemId) async {
    var response = await crud.postData(
      AppLink.removeFavorite,
      {
        "usersId": userId,
        "itemsId": itemId,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}

// class FavoriteData {
//   Crud crud;
//   FavoriteData(this.crud);

//   postData(String userId, String itemId) async {
//     var response = await crud.postData(
//       AppLink.favorite,
//       {
//         "userId": userId,
//         "itemId": itemId,
//       },
//     );
//     return response.fold((l) => l, (r) => r);
//   }
// }
