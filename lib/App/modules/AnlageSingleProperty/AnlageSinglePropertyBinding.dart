import 'package:get/get.dart';
import 'AnlageSinglePropertyController.dart';

class AnlageSinglePropertyBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AnlageSinglePropertyController());
  }
}