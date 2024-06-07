import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/app_link.dart';

class SearchOffersData {
  Crud crud;
  SearchOffersData(this.crud);

  searchOffers(String itemName) async {
    var response = await crud.postData(
      AppLink.offersSearch,
      {"itemName": itemName},
    );
    return response.fold((l) => l, (r) => r);
  }
}
