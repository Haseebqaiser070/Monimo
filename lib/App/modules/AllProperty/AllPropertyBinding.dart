import 'package:get/get.dart';
import 'package:monimo/App/modules/AllProperty/AllPropertyController.dart';

class AllPropertyBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AllPropertyController());
  }
}