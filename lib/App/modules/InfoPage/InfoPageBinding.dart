import 'package:get/get.dart';
import 'package:monimo/App/modules/InfoPage/InfoPageController.dart';

class InfoPageBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => InfoPageController());
  }
}