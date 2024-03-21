import 'package:ecommerce/data/datasource/remote/test_data.dart';
import 'package:get/get.dart';

class TestDataController extends GetxController {
  // TestData testData = TestData(Crud());
  TestData testData = TestData(Get.find());
}
