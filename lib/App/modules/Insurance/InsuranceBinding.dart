import 'package:get/get.dart';
import 'package:monimo/App/modules/Insurance/InsuranceController.dart';

class InsuranceBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => InsuranceController());
  }
}