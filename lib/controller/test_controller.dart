import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/data/datasource/remote/test_data.dart';
import 'package:get/get.dart';

class TestDataController extends GetxController {
  //TestData testData = TestData(Crud());
  TestData testData = TestData(Get.find());
  late StatusRequest statusRequest;
  List data = [];

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.nodata;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
