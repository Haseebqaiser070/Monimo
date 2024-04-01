import 'package:get/get.dart';
import 'package:monimo/App/modules/HomeScreen/HomeScreenController.dart';

class HomeScreenBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => HomeScreenController());
  }
}