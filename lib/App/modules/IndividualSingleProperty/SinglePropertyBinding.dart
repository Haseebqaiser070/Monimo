import 'package:get/get.dart';
import 'package:monimo/App/modules/IndividualSingleProperty/SinglePropertyController.dart';

class SinglePropertyBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SinglePropertyController());
  }
}