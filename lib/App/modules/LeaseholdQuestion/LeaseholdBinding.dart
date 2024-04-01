import 'package:get/get.dart';

import 'LeaseholdController.dart';

class LeaseholdBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LeaseholdController());
  }
}