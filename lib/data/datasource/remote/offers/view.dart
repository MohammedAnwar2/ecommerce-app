import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/app_link.dart';

class ViewOffersData {
  Crud crud;
  ViewOffersData(this.crud);

  viewOffers() async {
    var response = await crud.postData(
      AppLink.offersView,
      {},
    );
    return response.fold((l) => l, (r) => r);
  }
}
