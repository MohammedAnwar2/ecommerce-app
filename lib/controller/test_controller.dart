import 'package:ecommerce/core/class/sratus_request.dart';
import 'package:ecommerce/core/functions/hadlingdata.dart';
import 'package:ecommerce/data/datasource/remote/auth/signup.dart';
import 'package:get/get.dart';

class TestDataController extends GetxController {
  //TestData testData = TestData(Crud());
  SignupData testData = SignupData(Get.find());
  late StatusRequest statusRequest;
  List data = [];

  getData() async {}

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
