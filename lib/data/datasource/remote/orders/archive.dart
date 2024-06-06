import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/app_link.dart';

class ArchiveData {
  Crud crud;
  ArchiveData(this.crud);

  archiveOrder(int userId) async {
    var response =
        await crud.postData(AppLink.archive, {"userid": userId.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
